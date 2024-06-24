module godot_wrapper.builtins.vector4;

/**
Godot Vector4 type.
*/
struct GodotVector4
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_VECTOR4;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_VECTOR4;

    GodotPropertyFloat x;
    GodotPropertyFloat y;
    GodotPropertyFloat z;
    GodotPropertyFloat w;
}
