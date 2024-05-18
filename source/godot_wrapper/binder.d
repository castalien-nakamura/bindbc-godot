module godot_wrapper.binder;

/** 
Godot binder.
*/
struct GodotBinder(T) if (is(T == class) || is(T == interface))
{
}