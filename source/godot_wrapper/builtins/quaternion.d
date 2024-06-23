module godot_wrapper.builtins.quaternion;

/** 
Godot Quaternion type. 
*/
struct GodotQuaternion
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
