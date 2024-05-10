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
            GDExtensionInterface,
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
    GDExtensionBool godot_gdextension_entry(
        const(GDExtensionInterface)* p_interface,
        GDExtensionClassLibraryPtr p_library,
        GDExtensionInitialization* r_initialization) nothrow
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

        return true;
    }
}

version (GODOT_WRAPPER_TEST_EXTENSION)
{
    mixin GodotWrapperEntryPoint!"test_extension_entry_point";
}
