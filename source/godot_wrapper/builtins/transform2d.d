module godot_wrapper.builtins.transform2d;

/** 
Godot Transform2D type.
*/
struct GodotTransform2D
{
    private
    {
        import godot_wrapper.builtins.vector2 : GodotVector2;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_TRANSFORM2D;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_TRANSFORM2D;

    GodotVector2 x;
    GodotVector2 y;
    GodotVector2 origin;
}
