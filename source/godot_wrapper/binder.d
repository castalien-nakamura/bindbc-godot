module godot_wrapper.binder;

/** 
Binded class database.
*/
class GodotBindedClassDB
{
    private
    {
        import std.traits : Unqual;
        import godot_wrapper.gdextension_interface : classdb_register_extension_class2,
            GDExtensionClassCreationInfo2,
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
    void register(T)() nothrow scope if (is(T == class))
    {
        enum className = __traits(identifier, Unqual!T);
        register!(className, "Object", T)(() => new T(), delegate (T instance) {});
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
    void register(string name, string baseName, T)(
        T delegate() nothrow constructor,
        void delegate(T) nothrow destructor) nothrow scope
    if (is(T == class) || is(T == interface))
    in (constructor)
    in (destructor)
    in (name !in bindedClasses_)
    {
        auto className = getOrRegisterGodotName!name;
        auto baseClassName = getOrRegisterGodotName!baseName;
        auto classUserData = new BindedClassUserData(
            this,
            className,
            baseClassName,
            constructor,
            (Object instance) { destructor(cast(T) instance); });
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
    GDExtensionClassInstancePtr,
    GDExtensionObjectPtr,
    GDObjectInstanceID;

struct BindedClassInstanceUserData
{
    GDObjectInstanceID instanceID;
    Object object;
}

struct BindedClassUserData
{
    GodotBindedClassDB db;
    GodotStringName className;
    GodotStringName baseClassName;
    Object delegate() nothrow createObject;
    void delegate(Object) nothrow freeObject;
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
    classUserData.freeObject(instanceUserData.object);
    classUserData.db.bindedInstances_.remove(instanceUserData.instanceID);
}
