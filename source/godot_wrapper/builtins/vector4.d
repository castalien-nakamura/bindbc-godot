module godot_wrapper.builtins.vector4;

/**
Godot Vector4 type.
*/
struct GodotVector4
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotPropertyFloat;
    }

    GodotPropertyFloat x;
    GodotPropertyFloat y;
    GodotPropertyFloat z;
    GodotPropertyFloat w;
}
