module godot_wrapper.builtins.vector3i;


/**
Godot Vector3i type.
*/
struct GodotVector3i
{
    private
    {
        import godot_wrapper.builtins.int_ : GodotInt;
    }

    GodotInt x;
    GodotInt y;
    GodotInt z;
}
