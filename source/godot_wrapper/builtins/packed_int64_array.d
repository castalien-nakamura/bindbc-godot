module godot_wrapper.builtins.packed_int64_array;

/** 
Godot PackedInt64Array type.
*/
struct GodotPackedInt64Array
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_INT64_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_INT64_ARRAY;

private:
    size_t[2] internal_;
}
