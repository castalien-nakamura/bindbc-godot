module godot_wrapper.builtins.rect2i;

/**
Godot Rect2i type.
*/
struct GodotRect2i
{
    private
    {
        import godot_wrapper.builtins.vector2i : GodotVector2i;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_RECT2I;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_RECT2I;

    GodotVector2i position;
    GodotVector2i size;
}
