module godot_wrapper.builtins.variant;

/** 
Godot Variant type.
*/
struct GodotVariant
{
private:
    ubyte[40] internal_;
}

/**
Godot Variant type.

Params:
    T = Type of the variant contents.
*/
template GodotVariantType(T)
{
    private
    {
        import godot_wrapper.gdextension_interface :
            GDEXTENSION_VARIANT_TYPE_BOOL,
            GDEXTENSION_VARIANT_TYPE_FLOAT,
            GDEXTENSION_VARIANT_TYPE_INT;
        import godot_wrapper.builtins.bool_ : GodotBool;
        import godot_wrapper.builtins.float_ : GodotFloat;
        import godot_wrapper.builtins.int_ : GodotInt;
    }
    
    static if (is(T == GodotBool))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_BOOL;
    }
    else static if (is(T == GodotInt))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_INT;
    }
    else static if (is(T == GodotFloat))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_FLOAT;
    }
    else
    {
        enum GodotVariantType = T.variantType;
    }
}
