module godot_wrapper.builtins.packed_vector2_array;

/** 
Godot PackedVector2Array type.
*/
struct GodotPackedVector2Array
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR2_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR2_ARRAY;

private:
    size_t[2] internal_;
}
