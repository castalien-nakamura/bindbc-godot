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
            GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE,
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
            enum methodID = gdextensionExportName ~ "." ~ methodExportName;
            assert(methodID !in bindedClassMethods_, "Method " ~ methodID ~ " already registered.");

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
                methodInfo.return_value_metadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE;
            }

            auto argumentNames = appender!(GodotStringName[])();
            auto argumentTypeNames = appender!(GodotStringName[])();
            auto argumentInfos = appender!(GDExtensionPropertyInfo[])();
            auto argumentMetadata = appender!(GDExtensionClassMethodArgumentMetadata[])();

            alias methodParameters = Parameters!method;
            enum parameterNames = ParameterIdentifierTuple!method;
            foreach (j, parameter; methodParameters)
            {
                alias P = Unqual!parameter;
                argumentTypeNames.put(getOrRegisterGodotName!(P.stringof));
                auto argumentTypeName = &(argumentTypeNames[][j]);

                argumentNames.put(getOrRegisterGodotName!(parameterNames[j]));
                auto argumentName = &(argumentNames[][j]);

                GDExtensionPropertyInfo argumentInfo;
                argumentInfo.type = GetGodotVariantType!P;
                argumentInfo.class_name = argumentTypeName;
                argumentInfo.name = argumentName;
                argumentInfo.hint = 0;
                argumentInfo.hint_string = argumentName;
                argumentInfo.usage = 0b110; // PROPERTY_USAGE_DEFAULT
                argumentInfos.put(argumentInfo);
                argumentMetadata.put(GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE);
            }

            methodInfo.argument_count = cast(uint32_t) argumentInfos[].length;
            if (argumentInfos[].length > 0)
            {
                methodInfo.arguments_info = &argumentInfos[][0];
                methodInfo.arguments_metadata = &argumentMetadata[][0];
            }

            // create the method user data
            auto methodUserData = new BindedClassMethodUserData(
                this, new GDextensionBindedClassMethodImpl!(T, methodName, R, methodParameters));

            methodInfo.method_userdata = methodUserData;
            methodInfo.call_func = &callMethod;
            methodInfo.ptrcall_func = &callPointerMethod;

            classdb_register_extension_class_method(
                getGodotClassLibraryPointer(),
                &className,
                &methodInfo);
            
            // store the method user data
            bindedClassMethods_[methodID] = methodUserData;
        }
    }

private:
    GodotStringName[string] namePool_;
    BindedClassUserData*[string] bindedClasses_;
    BindedClassInstanceUserData*[GDObjectInstanceID] bindedInstances_;
    BindedClassMethodUserData*[string] bindedClassMethods_;

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

import std.traits : ReturnType;
import std.typecons : Tuple;
import godot_wrapper.builtins : GodotBool,
    GodotFloat,
    GodotInt,
    GodotStringName;
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

struct BindedClassMethodUserData
{
    GodotBindedClassDB db;
    GDextensionBindedClassMethod method;
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
    R = The return type of the method.
    Params = The parameters of the method.
*/
class GDextensionBindedClassMethodImpl(T : GDExtensionBindedClass, string methodName, R, Params...)
    : GDextensionBindedClassMethod
{
    override void call(
        GDExtensionBindedClass instance,
        const(GDExtensionConstTypePtr)* p_args,
        GDExtensionTypePtr r_ret) nothrow
    {
        auto typedInstance = cast(T) instance;
        assert(typedInstance, "Invalid instance type.");

        Tuple!Params args;
        static foreach (i, param; Params)
        {
            args[i] = fromGodotArgument!param(p_args[i]);
        }

        static if(is(R == void))
        {
            __traits(getMember, typedInstance, methodName)(args.expand);
        }
        else
        {
            writeGodotResult(__traits(getMember, typedInstance, methodName)(args.expand), r_ret);
        }
    }
}

T fromGodotArgument(T)(GDExtensionConstTypePtr p) nothrow @nogc pure
{
    static if (is(T == GodotBool) || is(T == GodotInt) || is(T == GodotFloat))
    {
        return *(cast(const(T)*) p);
    }
    else static if (is(T U == U*))
    {
        return cast(T) p;
    }
    else
    {
        static assert(false, "Unsupported Godot value type.");
    }
}

void writeGodotResult(T)(T value, GDExtensionTypePtr dest) nothrow
{
    *(cast(T*) dest) = value;
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
    auto methodUserData = cast(BindedClassMethodUserData*) method_userdata;
    auto instance = cast(BindedClassInstanceUserData*) p_instance;
    methodUserData.method.call(instance.object, p_args, r_ret);
}
