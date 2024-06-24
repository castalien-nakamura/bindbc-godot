module godot_wrapper.builtins.object;

/**
Godot Object type.
*/
struct GodotObject
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_OBJECT;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_OBJECT;

private:
    size_t internal_;
}
