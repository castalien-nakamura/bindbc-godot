module godot_wrapper.builtins.string_name;

/**
Godot StringName type.
*/
struct GodotStringName
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_STRING_NAME;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_STRING_NAME;

private:
    size_t internal_;
}
