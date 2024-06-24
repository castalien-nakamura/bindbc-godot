module godot_wrapper.builtins.packed_vector3_array;

/** 
Godot PackedVector3Array type.
*/
struct GodotPackedVector3Array
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR3_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR3_ARRAY;

private:
    size_t[2] internal_;
}
