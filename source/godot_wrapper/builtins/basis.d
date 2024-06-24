module godot_wrapper.builtins.basis;

/** 
Godot Basis type.
*/
struct GodotBasis
{
    private
    {
        import godot_wrapper.builtins.vector3 : GodotVector3;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_BASIS;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_BASIS;

    GodotVector3 x;
    GodotVector3 y;
    GodotVector3 z;
}
