module godot_wrapper.builtins.string;

/**
Godot String type.
*/
struct GodotString
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_STRING;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_STRING;

private:
    size_t internal_;
}
