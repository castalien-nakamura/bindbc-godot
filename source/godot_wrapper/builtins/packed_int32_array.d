module godot_wrapper.builtins.packed_int32_array;

/** 
Godot PackedInt32Array type.
*/
struct GodotPackedInt32Array
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_INT32_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_INT32_ARRAY;

private:
    size_t[2] internal_;
}
