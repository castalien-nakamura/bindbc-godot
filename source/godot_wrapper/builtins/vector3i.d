module godot_wrapper.builtins.vector3i;


/**
Godot Vector3i type.
*/
struct GodotVector3i
{
    private
    {
        import godot_wrapper.builtins.int_ : GodotInt;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_VECTOR3I;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_VECTOR3I;

    GodotInt x;
    GodotInt y;
    GodotInt z;
}
