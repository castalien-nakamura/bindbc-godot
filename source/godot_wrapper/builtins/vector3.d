module godot_wrapper.builtins.vector3;

/**
Godot Vector3 type.
*/
struct GodotVector3
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
    }

    GodotPropertyFloat x;
    GodotPropertyFloat y;
    GodotPropertyFloat z;
}
