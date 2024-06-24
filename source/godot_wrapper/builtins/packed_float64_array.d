module godot_wrapper.builtins.packed_float64_array;

/** 
Godot PackedFloat64Array type.
*/
struct GodotPackedFloat64Array
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT64_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT64_ARRAY;

private:
    size_t[2] internal_;
}
