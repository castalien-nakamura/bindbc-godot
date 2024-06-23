module godot_wrapper.builtins.plane;

/**
Godot Plane type.
*/
struct GodotPlane
{
    private
    {
        import godot_wrapper.builtins.vector3 : GodotVector3;
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
    }

    GodotVector3 normal;
    GodotPropertyFloat d;
}
