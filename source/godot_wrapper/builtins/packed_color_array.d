module godot_wrapper.builtins.packed_color_array;

/** 
Godot PackedColorArray type.
*/
struct GodotPackedColorArray
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_PACKED_COLOR_ARRAY;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_PACKED_COLOR_ARRAY;

private:
    size_t[2] internal_;
}
