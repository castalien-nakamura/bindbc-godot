module godot_wrapper.builtins.vector3;

/**
Godot Vector3 type.
*/
struct GodotVector3
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_VECTOR3;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_VECTOR3;

    GodotPropertyFloat x;
    GodotPropertyFloat y;
    GodotPropertyFloat z;
}
