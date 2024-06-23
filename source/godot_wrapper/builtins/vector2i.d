module godot_wrapper.builtins.vector2i;


/**
Godot Vector2i type.
*/
struct GodotVector2i
{
    private
    {
        import godot_wrapper.builtins.int_ : GodotInt;
    }

    GodotInt x;
    GodotInt y;
}
