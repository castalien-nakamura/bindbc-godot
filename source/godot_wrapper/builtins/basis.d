module godot_wrapper.builtins.basis;

/** 
Godot Basis type.
*/
struct GodotBasis
{
    private
    {
        import godot_wrapper.builtins.vector3 : GodotVector3;
    }

    GodotVector3 x;
    GodotVector3 y;
    GodotVector3 z;
}
