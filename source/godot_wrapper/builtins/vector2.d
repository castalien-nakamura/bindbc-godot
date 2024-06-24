module godot_wrapper.builtins.vector2;

/**
Godot Vector2 type.
*/
struct GodotVector2
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_VECTOR2;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_VECTOR2;

    GodotPropertyFloat x;
    GodotPropertyFloat y;
}
