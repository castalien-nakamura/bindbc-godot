module godot_wrapper.builtins.vector2;

/**
Godot Vector2 type.
*/
struct GodotVector2
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
    }

    GodotPropertyFloat x;
    GodotPropertyFloat y;
}
