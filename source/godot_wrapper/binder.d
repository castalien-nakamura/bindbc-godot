module godot_wrapper.binder;

/** 
Export name for a GDExtension class.
*/
struct GDExtensionExportName
{
    string name;
}

/** 
base class name for a GDExtension class.
*/
struct GDExtensionBaseClassName
{
    string name;
}

/**
GDExtension binded class interface.
*/
interface GDExtensionBindedClass
{
    /** 
    Called when the object is freed.
    */
    void onDestroy() nothrow;
}

/** 
Binded class database.
*/
class GodotBindedClassDB
{
    private
    {
        import std.traits : getUDAs, getSymbolsByUDA, Unqual;
        import godot_wrapper.gdextension_interface : classdb_register_extension_class_method,
            classdb_register_extension_class2,
            GDExtensionClassCreationInfo2,
            GDExtensionClassMethodInfo,
            GDEXTENSION_METHOD_FLAGS_DEFAULT,
            GDEXTENSION_METHOD_FLAG_EDITOR,
            GDEXTENSION_METHOD_FLAG_CONST,
            string_name_new_with_latin1_chars;
        import godot_wrapper.builtins : GodotStringName;
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
        enum exportNames = getUDAs!(T, GDExtensionExportName);
        static if (exportNames.length == 0)
        {
            enum className = __traits(identifier, Unqual!T);
        }
        else static if (exportNames.length == 1)
        {
            enum className = exportNames[0].name;
        }
        else
        {
            static assert(false, "Only one Godot export name is allowed.");
        }

        enum baseClasseNames = getUDAs!(T, GDExtensionBaseClassName);
        static if (baseClasseNames.length == 0)
        {
            enum baseClassName = "Object";
        }
        else static if (baseClasseNames.length == 1)
        {
            enum baseClassName = baseClasseNames[0].name;
        }
        else
        {
            static assert(false, "Only one Godot base class is allowed.");
        }
    
        register!(className, baseClassName)(() => new T());
    }

    /**
    Register a new binded class.

    Params:
        name = The name of the class.
        baseName = The name of the base class.
        T = The type of the class.
        constructor = The constructor of the class.
    */
    void register(string name, string baseName)(
        GDExtensionBindedClass delegate() nothrow constructor) nothrow scope
    in (constructor)
    in (name !in bindedClasses_)
    {
        auto className = getOrRegisterGodotName!name;
        auto baseClassName = getOrRegisterGodotName!baseName;
        auto classUserData = new BindedClassUserData(
            this, className, baseClassName, constructor);
        bindedClasses_[name] = classUserData;

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

        GDExtensionClassMethodInfo methodInfo;
        auto methodName = getOrRegisterGodotName!"test_method";
        methodInfo.name = &methodName;
        methodInfo.method_flags = GDEXTENSION_METHOD_FLAGS_DEFAULT
            | GDEXTENSION_METHOD_FLAG_CONST;
        methodInfo.call_func = &callMethod;
        methodInfo.ptrcall_func = &callPointerMethod;
        classdb_register_extension_class_method(
            getGodotClassLibraryPointer(),
            &className,
            &methodInfo);
    }

private:
    GodotStringName[string] namePool_;
    BindedClassUserData*[string] bindedClasses_;
    BindedClassInstanceUserData*[GDObjectInstanceID] bindedInstances_;

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
    import godot_wrapper.print : print;
    print("callPointerMethod", "callPointerMethod");
}
