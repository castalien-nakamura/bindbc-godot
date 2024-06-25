module godot_wrapper.binder;

/** 
Binded class database.
*/
class GodotBindedClassDB
{
    private
    {
        import std.array : appender;
        import std.meta : Filter;
        import std.stdint : uint32_t;
        import std.traits : FunctionAttribute,
            functionAttributes,
            getSymbolsByUDA,
            getUDAs,
            isCallable,
            hasStaticMember,
            Parameters,
            ParameterIdentifierTuple,
            ReturnType,
            Unqual;
        import godot_wrapper.gdextension_interface : classdb_register_extension_class_method,
            classdb_register_extension_class2,
            GDExtensionClassMethodArgumentMetadata,
            GDExtensionClassCreationInfo2,
            GDExtensionClassMethodInfo,
            GDExtensionPropertyInfo,
            GDEXTENSION_METHOD_FLAGS_DEFAULT,
            GDEXTENSION_METHOD_FLAG_CONST,
            GDEXTENSION_METHOD_FLAG_STATIC,
            string_name_new_with_latin1_chars;
        import godot_wrapper.binded_class : GetGDExtensionBaseClassName,
            GetGDExtensionExportName;
        import godot_wrapper.builtins : GodotStringName,
            GetGodotVariantType;
        import godot_wrapper.entrypoint : getGodotClassLibraryPointer;
    }

    /**
    Register a new binded class.

    Params:
        name = The name of the class.
        baseName = The name of the base class.
        T = The type of the class.
        constructor = The constructor of the class.
        destructor = The destructor of the class.
    */
    void register(T : GDExtensionBindedClass)() nothrow scope
    {
        // get the export name and base class name
        enum gdextensionExportName = GetGDExtensionExportName!T;
        assert(gdextensionExportName !in bindedClasses_, "Class " ~ gdextensionExportName ~ " already registered.");
        auto className = getOrRegisterGodotName!gdextensionExportName;

        enum gdextensionBaseClassName = GetGDExtensionBaseClassName!T;
        auto baseClassName = getOrRegisterGodotName!gdextensionBaseClassName;

        auto classUserData = new BindedClassUserData(
            this, className, baseClassName, () => new T());
        bindedClasses_[gdextensionExportName] = classUserData;

        // register the class
        GDExtensionClassCreationInfo2 classInfo;
        classInfo.is_exposed = true;
        classInfo.create_instance_func = &createInstance;
        classInfo.free_instance_func = &freeInstance;
        classInfo.class_userdata = classUserData;

        classdb_register_extension_class2(
            getGodotClassLibraryPointer(),
            &className,
            &baseClassName,
            &classInfo);

        // register the methods
        foreach (i, method; Filter!(isCallable, getSymbolsByUDA!(T, GDExtensionExportMethod)))
        {
            GDExtensionClassMethodInfo methodInfo;

            // set method name
            enum methodExports = getUDAs!(method, GDExtensionExportMethod);
            static assert(methodExports.length == 1, "Only one Godot export method is allowed.");
            enum methodName = __traits(identifier, method);
            enum methodExportName = methodExports[0].name == "" ? methodName : methodExports[0].name;
            auto godotMethodName = getOrRegisterGodotName!methodExportName;
            methodInfo.name = &godotMethodName;

            // set method flags
            methodInfo.method_flags = GDEXTENSION_METHOD_FLAGS_DEFAULT;

            static if (hasStaticMember!(T, methodName))
            {
                methodInfo.method_flags |= GDEXTENSION_METHOD_FLAG_STATIC;
            }

            enum methodAttributes = functionAttributes!method;
            static if (methodAttributes & FunctionAttribute.const_
                || methodAttributes & FunctionAttribute.immutable_)
            {
                methodInfo.method_flags |= GDEXTENSION_METHOD_FLAG_CONST;
            }

            methodInfo.call_func = &callMethod;
            methodInfo.ptrcall_func = &callPointerMethod;

            alias R = Unqual!(ReturnType!method);
            auto returnValueName = getOrRegisterGodotName!(R.stringof);
            GDExtensionPropertyInfo returnValueInfo;

            static if (is(R == void))
            {
                methodInfo.has_return_value = false;
            }
            else
            {
                returnValueInfo.type = GetGodotVariantType!R;
                returnValueInfo.class_name = &returnValueName;
                returnValueInfo.name = &returnValueName;
                returnValueInfo.hint = 0;
                returnValueInfo.hint_string = &returnValueName;
                returnValueInfo.usage = 0b110; // PROPERTY_USAGE_DEFAULT

                methodInfo.has_return_value = true;
                methodInfo.return_value_info = &returnValueInfo;
                methodInfo.return_value_metadata = GetGodotMethodArgumentMetadata!R;
            }

            auto artumentNames = appender!(GodotStringName[])();
            auto argumentInfos = appender!(GDExtensionPropertyInfo[])();
            auto argumentMetadata = appender!(GDExtensionClassMethodArgumentMetadata[])();

            enum parameterNames = ParameterIdentifierTuple!method;
            foreach (j, parameter; Parameters!method)
            {
                alias P = Unqual!parameter;
                artumentNames.put(getOrRegisterGodotName!(parameterNames[j]));
                auto parameterName = &(artumentNames.data[j]);

                GDExtensionPropertyInfo argumentInfo;
                argumentInfo.type = GetGodotVariantType!P;
                argumentInfo.class_name = parameterName;
                argumentInfo.hint = 0;
                argumentInfo.hint_string = parameterName;
                argumentInfo.usage = 0b110; // PROPERTY_USAGE_DEFAULT
                argumentInfos.put(argumentInfo);
                argumentMetadata.put(GetGodotMethodArgumentMetadata!P);
            }

            methodInfo.argument_count = cast(uint32_t) argumentInfos[].length;
            if (argumentInfos[].length > 0)
            {
                methodInfo.arguments_info = &argumentInfos[][0];
                methodInfo.arguments_metadata = &argumentMetadata[][0];
            }

            classdb_register_extension_class_method(
                getGodotClassLibraryPointer(),
                &className,
                &methodInfo);
        }
    }

private:
    GodotStringName[string] namePool_;
    BindedClassUserData*[string] bindedClasses_;
    BindedClassInstanceUserData*[GDObjectInstanceID] bindedInstances_;

    /** 
    Get or register a Godot name.

    Params:
        name = The name of the Godot name.
    Returns:
        The Godot StringName.
    */
    GodotStringName getOrRegisterGodotName(string name)() nothrow
    {
        if (auto sn = name in namePool_)
        {
            return *sn;
        }

        GodotStringName sn;
        string_name_new_with_latin1_chars(&sn, name, true);
        namePool_[name] = sn;
        return sn;
    }
}

private:

import godot_wrapper.builtins : GodotStringName;
import godot_wrapper.binded_class : GDExtensionBindedClass, GDExtensionExportMethod;
import godot_wrapper.gdextension_interface : classdb_construct_object,
    object_get_instance_id,
    object_set_instance,
    GDExtensionCallError,
    GDExtensionClassInstancePtr,
    GDExtensionConstTypePtr,
    GDExtensionConstVariantPtr,
    GDExtensionInt,
    GDExtensionObjectPtr,
    GDExtensionTypePtr,
    GDExtensionVariantPtr,
    GDObjectInstanceID;

void registerMethods(T : GDExtensionBindedClass)()
{
}

template GetGodotMethodArgumentMetadata(T)
{
    private
    {
        import godot_wrapper.gdextension_interface : GDExtensionClassMethodArgumentMetadata,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT8,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT16,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT32,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT64,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT8,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT16,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT32,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT64,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_FLOAT,
            GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_DOUBLE;
    }

    static if (is(T == byte))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT8;
    }
    else static if (is(T == short))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT62;
    }
    else static if (is(T == int))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT32;
    }
    else static if (is(T == long))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT64;
    }
    else static if (is(T == ubyte))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT8;
    }
    else static if (is(T == ushort))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT62;
    }
    else static if (is(T == uint))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT32;
    }
    else static if (is(T == ulong))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT64;
    }
    else static if (is(T == float))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_FLOAT;
    }
    else static if (is(T == double))
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_DOUBLE;
    }
    else
    {
        enum GetGodotMethodArgumentMetadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE;
    }
}

struct BindedClassInstanceUserData
{
    GDObjectInstanceID instanceID;
    GDExtensionBindedClass object;
}

struct BindedClassUserData
{
    GodotBindedClassDB db;
    GodotStringName className;
    GodotStringName baseClassName;
    GDExtensionBindedClass delegate() nothrow createObject;
}

/** 
GDExtension binded class method interface.
*/
interface GDextensionBindedClassMethod
{
    /** 
    Called when the method is called.
    */
    void call(
        GDExtensionBindedClass instance,
        const(GDExtensionConstTypePtr)* p_args,
        GDExtensionTypePtr r_ret) nothrow;
}

/** 
GDExtension binded class method implementation.

Params:
    T = The type of the method.
    methodName = The name of the method.
*/
class GDextensionBindedClassMethodImpl(T : GDExtensionBindedClass, string methodName) : GDextensionBindedClassMethod
{
    override void call(
        GDExtensionBindedClass instance,
        const(GDExtensionConstTypePtr)* p_args,
        GDExtensionTypePtr r_ret) nothrow
    {
        auto typedInstance = cast(T) instance;
        assert(typedInstance, "Invalid instance type.");
    }
}

extern(C) GDExtensionObjectPtr createInstance(
    void* p_class_userdata) nothrow
{
    auto classUserData = cast(BindedClassUserData*) p_class_userdata;

    // create a new instance of the class
    auto object = classUserData.createObject();

    // construct the godot object base.
    auto godotObject = classdb_construct_object(&classUserData.baseClassName);

    // bind the instance to the godot object
    auto instanceID = object_get_instance_id(godotObject);
    auto instance = new BindedClassInstanceUserData(instanceID, object);
    classUserData.db.bindedInstances_[instanceID] = instance;
    object_set_instance(godotObject, &classUserData.className, instance);

    return godotObject;
}

extern(C) void freeInstance(
    void* p_class_userdata,
    GDExtensionClassInstancePtr p_instance) nothrow
{
    auto classUserData = cast(BindedClassUserData*) p_class_userdata;
    auto instanceUserData = cast(BindedClassInstanceUserData*) p_instance;
    instanceUserData.object.onDestroy();
    classUserData.db.bindedInstances_.remove(instanceUserData.instanceID);
}

extern(C) void callMethod(
    void* method_userdata,
    GDExtensionClassInstancePtr p_instance,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionInt p_argument_count,
    GDExtensionVariantPtr r_return,
    GDExtensionCallError* r_error) nothrow
{
    import godot_wrapper.print : print;
    print("callMethod", "callMethod");
}

extern(C) void callPointerMethod(
    void* method_userdata,
    GDExtensionClassInstancePtr p_instance,
    const(GDExtensionConstTypePtr)* p_args,
    GDExtensionTypePtr r_ret) nothrow
{
    auto args = cast(const(int)**) p_args;
    import godot_wrapper.print : print;
    print("callPointerMethod", "callPointerMethod: %s, %s, %s, %s, %d, %d",
        method_userdata, p_instance, args, r_ret, *args[0], *args[1]);

    auto result = cast(int*) r_ret;
    *result = *args[0] * 2;
}
