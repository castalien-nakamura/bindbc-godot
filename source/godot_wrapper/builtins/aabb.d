module godot_wrapper.builtins.aabb;

/**
Godot AABB type.
*/
struct GodotAABB
{
    private
    {
        import godot_wrapper.builtins.vector3 : GodotVector3;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_AABB;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_AABB;

    GodotVector3 position;
    GodotVector3 size;
}
