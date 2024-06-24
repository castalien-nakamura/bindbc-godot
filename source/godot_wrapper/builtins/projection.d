module godot_wrapper.builtins.projection;

struct GodotProjection
{
    private
    {
        import godot_wrapper.builtins.vector4 : GodotVector4;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PROJECTION;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PROJECTION;

    GodotVector4 x;
    GodotVector4 y;
    GodotVector4 z;
    GodotVector4 w;
}
