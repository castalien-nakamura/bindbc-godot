module godot_wrapper.builtins.vector2i;


/**
Godot Vector2i type.
*/
struct GodotVector2i
{
    private
    {
        import godot_wrapper.builtins.int_ : GodotInt;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_VECTOR2I;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_VECTOR2I;

    GodotInt x;
    GodotInt y;
}
