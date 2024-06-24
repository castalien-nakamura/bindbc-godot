module godot_wrapper.builtins.dictionary;

/**
Godot Dictionary type.
*/
struct GodotDictionary
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_DICTIONARY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_DICTIONARY;

private:
    size_t internal_;
}
