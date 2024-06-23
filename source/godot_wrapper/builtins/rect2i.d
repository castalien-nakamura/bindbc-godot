module godot_wrapper.builtins.rect2i;

/**
Godot Rect2i type.
*/
struct GodotRect2i
{
    private
    {
        import godot_wrapper.builtins.vector2i : GodotVector2i;
    }

    GodotVector2i position;
    GodotVector2i size;
}
