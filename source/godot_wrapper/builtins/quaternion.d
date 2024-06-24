module godot_wrapper.builtins.quaternion;

/** 
Godot Quaternion type. 
*/
struct GodotQuaternion
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_QUATERNION;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_QUATERNION;

    GodotPropertyFloat x;
    GodotPropertyFloat y;
    GodotPropertyFloat z;
    GodotPropertyFloat w;
}
