module godot_wrapper.builtins.transform2d;

/** 
Godot Transform2D type.
*/
struct GodotTransform2D
{
    private
    {
        import godot_wrapper.builtins.vector2 : GodotVector2;
    }

    GodotVector2 x;
    GodotVector2 y;
    GodotVector2 origin;
}
