module godot_wrapper.entrypoint;

import std.stdint : int32_t,
    uint32_t,
    uint64_t;

import godot_wrapper.gdextension_interface : GDExtensionBool,
    GDExtensionInterfaceGetProcAddress,
    GDExtensionClassLibraryPtr,
    GDExtensionInitialization,
    GDExtensionInitializationLevel,
    GDEXTENSION_INITIALIZATION_SCENE,
    GDExtensionClassCallVirtual,
    GDExtensionClassCreationInfo2,
    GDExtensionClassInstancePtr,
    GDExtensionConstStringNamePtr,
    GDExtensionConstTypePtr,
    GDExtensionConstVariantPtr,
    GDExtensionObjectPtr,
    GDExtensionPropertyInfo,
    GDExtensionStringNamePtr,
    GDExtensionStringPtr,
    GDExtensionTypePtr,
    GDExtensionVariantPtr,
    initializeGDExtensionFunctions,
    string_name_new_with_latin1_chars,
    classdb_construct_object,
    classdb_register_extension_class2;
import godot_wrapper.print : print;
import godot_wrapper.builtins : GodotStringName;

/** 
Godot entry point for the dynamic library.

Params:
    entryPointName = The name of the extension entry point.
*/
mixin template GodotWrapperEntryPoint(string entryPointName)
{
    private
    {
        import godot_wrapper.gdextension_interface : GDExtensionBool,
            GDExtensionInterfaceGetProcAddress,
            GDExtensionClassLibraryPtr,
            GDExtensionInitialization;
    }

    // Runtime initialization for Windows
    version (Windows)
    {
        version (D_BetterC)
        {
            // skip if BetterC
        }
        else
        {
            import core.sys.windows.dll : SimpleDllMain;
            mixin SimpleDllMain;
        }
    }

    /**
    Godot entry point for the dynamic library.

    Params:
        p_get_proc_address = The function to get the address of a function in the Godot engine.
        p_library = The library that contains the extension.
        r_initialization = The initialization data for the extension.
    Returns:
        True if the extension was successfully initialized, false otherwise.
    */
    pragma(mangle, entryPointName)
    export extern(C) static
    GDExtensionBool godotGDExtensionEntryPoint(
        GDExtensionInterfaceGetProcAddress p_get_proc_address,
        GDExtensionClassLibraryPtr p_library,
        GDExtensionInitialization* r_initialization)
    {
        return godotGDExtensionEntryPointImpl(p_get_proc_address, p_library, r_initialization);
    }
}

private:

version (GODOT_WRAPPER_TEST_EXTENSION)
{
    mixin GodotWrapperEntryPoint!"test_extension_entry_point";
}

/**
Godot entry point for the dynamic library.

Params:
    p_get_proc_address = The function to get the address of a function in the Godot engine.
    p_library = The library that contains the extension.
    r_initialization = The initialization data for the extension.
Returns:
    True if the extension was successfully initialized, false otherwise.
*/
GDExtensionBool godotGDExtensionEntryPointImpl(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization* r_initialization)
{
    // Runtime initialization for non-Windows
    version (Windows)
    {
        // initialized by DllMain
    }
    else
    {
        version (D_BetterC)
        {
            // skip if BetterC
        }
        else
        {
            import core.runtime : Runtime;
            Runtime.initialize();
        }
    }

    r_initialization.minimum_initialization_level = GDEXTENSION_INITIALIZATION_SCENE;
    r_initialization.initialize = &initialize;
    r_initialization.deinitialize = &deinitialize;
    r_initialization.userdata = null;

    initializeGDExtensionFunctions(p_get_proc_address);
    
    GodotStringName testClassName;
    string_name_new_with_latin1_chars(&testClassName, "PoetClass", true);
    GodotStringName parentClassName;
    string_name_new_with_latin1_chars(&parentClassName, "RefCounted", true);

    GDExtensionClassCreationInfo2 classInfo;
    classInfo.is_exposed = true;
    classInfo.create_instance_func = &createInstance;
    classInfo.free_instance_func = &freeInstance;
    classInfo.reference_func = &classReference;
    classInfo.unreference_func = &classUnreference;

    classdb_register_extension_class2(
        p_library,
        &testClassName,
        &parentClassName,
        &classInfo);

    return true;
}

extern(C) void initialize(void* userdata, GDExtensionInitializationLevel p_level) nothrow
{
    print("initialize", "level: %s", p_level);
}

extern(C) void deinitialize(void* userdata, GDExtensionInitializationLevel p_level) nothrow
{
    print("deinitialize", "level: %s", p_level);
}

extern(C) GDExtensionObjectPtr createInstance(void* p_class_userdata) nothrow
{
    print("createInstance");

    GodotStringName className;
    string_name_new_with_latin1_chars(&className, "RefCounted", true);
    auto godotObject = classdb_construct_object(&className);
    return godotObject;
}

extern(C) void freeInstance(void* p_class_userdata, GDExtensionClassInstancePtr p_instance) nothrow
{
    print("freeInstance");
}

extern(C) void classReference(GDExtensionClassInstancePtr p_instance) nothrow
{
    print("classReference", "p_instance: %s", p_instance);
}

extern(C) void classUnreference(GDExtensionClassInstancePtr p_instance) nothrow
{
    print("classUnreference", "p_instance: %s", p_instance);
}
