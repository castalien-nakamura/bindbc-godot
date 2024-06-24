module godot_wrapper.builtins.array;

/**
Godot Array type.
*/
struct GodotArray
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_ARRAY;

private:
    size_t internal_;
}
