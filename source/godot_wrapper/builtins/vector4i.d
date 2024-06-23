module godot_wrapper.builtins.vector4i;


/**
Godot Vector4i type.
*/
struct GodotVector4i
{
    private
    {
        import godot_wrapper.builtins.int_ : GodotInt;
    }

    GodotInt x;
    GodotInt y;
    GodotInt z;
    GodotInt w;
}
