module godot_wrapper.builtins.callable;

/** 
Godot Callable type.
*/
struct GodotCallable
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_CALLABLE;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_CALLABLE;

private:
    ubyte[16] internal_;
}
