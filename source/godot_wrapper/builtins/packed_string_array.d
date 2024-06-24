module godot_wrapper.builtins.packed_string_array;

/** 
Godot PackedStringArray type.
*/
struct GodotPackedStringArray
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY;

private:
    size_t[2] internal_;
}
