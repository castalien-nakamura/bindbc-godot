module godot_wrapper.builtins.aabb;

/**
Godot AABB type.
*/
struct GodotAABB
{
    private
    {
        import godot_wrapper.builtins.vector3 : GodotVector3;
    }

    GodotVector3 position;
    GodotVector3 size;
}
