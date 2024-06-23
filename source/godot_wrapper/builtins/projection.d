module godot_wrapper.builtins.projection;

struct GodotProjection
{
    private
    {
        import godot_wrapper.builtins.vector4 : GodotVector4;
    }

    GodotVector4 x;
    GodotVector4 y;
    GodotVector4 z;
    GodotVector4 w;
}
