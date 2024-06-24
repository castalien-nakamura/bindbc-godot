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
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_TRANSFORM3D;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_TRANSFORM3D;

    GodotBasis basis;
    GodotVector3 origin;
}
