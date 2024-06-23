module godot_wrapper.builtins.color;

/** 
Godot Color type.
*/
struct GodotColor
{
    private
    {
        import godot_wrapper.builtins.float_ : GodotFloat32;
    }

    GodotFloat32 r;
    GodotFloat32 g;
    GodotFloat32 b;
    GodotFloat32 a;
}
