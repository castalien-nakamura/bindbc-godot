module godot_wrapper.entrypoint;

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
            GDExtensionInitialization,
            GDExtensionInitializationLevel,
            GDEXTENSION_INITIALIZATION_SCENE,
            GDExtensionClassCreationInfo2,
            GDExtensionClassInstancePtr,
            GDExtensionObjectPtr,
            initializeGDExtensionFunctions,
            string_name_new_with_latin1_chars,
            classdb_register_extension_class2;
        import godot_wrapper.print : print;
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
    GDExtensionBool godot_gdextension_entry(
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

        GDExtensionClassCreationInfo2 classInfo;
        classInfo.create_instance_func = &createInstance;
        classInfo.free_instance_func = &freeInstance;

        return true;
    }

    extern(C) static void initialize(void* userdata, GDExtensionInitializationLevel p_level) nothrow
    {
        print("initialize", "level: %s", p_level);
    }

	extern(C) static void deinitialize(void* userdata, GDExtensionInitializationLevel p_level) nothrow
    {
        print("deinitialize", "level: %s", p_level);
    }

    extern(C) static GDExtensionObjectPtr createInstance(void* p_class_userdata) nothrow
    {
        return null;
    }
    
    extern(C) static void freeInstance(void* p_userdata, GDExtensionClassInstancePtr p_instance) nothrow
    {
    }
}

version (GODOT_WRAPPER_TEST_EXTENSION)
{
    mixin GodotWrapperEntryPoint!"test_extension_entry_point";
}
