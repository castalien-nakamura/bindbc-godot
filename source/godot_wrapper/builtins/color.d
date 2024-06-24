module godot_wrapper.builtins.color;

/** 
Godot Color type.
*/
struct GodotColor
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotFloat32;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_COLOR;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_COLOR;

    GodotFloat32 r;
    GodotFloat32 g;
    GodotFloat32 b;
    GodotFloat32 a;
}
