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
    GDExtensionCallError,
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
    classdb_get_method_bind,
    classdb_register_extension_class2,
    object_method_bind_call,
    variant_booleanize,
    object_set_instance,
    mem_alloc,
    mem_free,
    object_destroy;
import godot_wrapper.print : print;
import godot_wrapper.builtins : GodotStringName,
    GodotVariant;

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

/** 
Returns:
    The pointer to the Godot class library.
*/
GDExtensionClassLibraryPtr getGodotClassLibraryPointer() @nogc nothrow
{
    return godotClassLibraryPointer_;
}

private:

version (GODOT_WRAPPER_TEST_EXTENSION)
{
    mixin GodotWrapperEntryPoint!"test_extension_entry_point";
}

__gshared GDExtensionClassLibraryPtr godotClassLibraryPointer_;

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

    godotClassLibraryPointer_ = p_library;
    r_initialization.minimum_initialization_level = GDEXTENSION_INITIALIZATION_SCENE;
    r_initialization.initialize = &initialize;
    r_initialization.deinitialize = &deinitialize;
    r_initialization.userdata = null;

    initializeGDExtensionFunctions(p_get_proc_address);

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
