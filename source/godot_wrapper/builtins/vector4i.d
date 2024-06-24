module godot_wrapper.builtins.vector4i;


/**
Godot Vector4i type.
*/
struct GodotVector4i
{
    private
    {
        import godot_wrapper.builtins.int_ : GodotInt;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_VECTOR4I;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_VECTOR4I;

    GodotInt x;
    GodotInt y;
    GodotInt z;
    GodotInt w;
}
