module godot_wrapper.builtins.packed_float32_array;

/** 
Godot PackedFloat32Array type.
*/
struct GodotPackedFloat32Array
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT32_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT32_ARRAY;

private:
    size_t[2] internal_;
}
