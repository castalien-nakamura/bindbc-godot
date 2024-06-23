module godot_wrapper.builtins.transform3d;

/** 
Godot Transform3D type.
*/
struct GodotTransform3D
{
    private
    {
        import godot_wrapper.builtins.basis : GodotBasis;
        import godot_wrapper.builtins.vector3 : GodotVector3;
    }

    GodotBasis basis;
    GodotVector3 origin;
}
