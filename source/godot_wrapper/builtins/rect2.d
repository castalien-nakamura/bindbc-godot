module godot_wrapper.builtins.rect2;

/**
Godot Rect2 type.
*/
struct GodotRect2
{
    private
    {
        import godot_wrapper.builtins.vector2 : GodotVector2;
    }

    GodotVector2 position;
    GodotVector2 size;
}
