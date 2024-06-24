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
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PLANE;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PLANE;

    GodotVector3 normal;
    GodotPropertyFloat d;
}
