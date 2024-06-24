module godot_wrapper.builtins.packed_byte_array;

/** 
Godot PackedByteArray type.
*/
struct GodotPackedByteArray
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_BYTE_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_BYTE_ARRAY;

private:
    size_t[2] internal_;
}
