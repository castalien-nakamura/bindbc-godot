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
Get Godot Variant type.

Params:
    T = Type of the variant contents.
*/
template GetGodotVariantType(T)
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
    
    static if (is(T == GodotBool) || is(T == GodotBool*))
    {
        enum GetGodotVariantType = GDEXTENSION_VARIANT_TYPE_BOOL;
    }
    else static if (is(T == GodotInt) || is(T == GodotInt*))
    {
        enum GetGodotVariantType = GDEXTENSION_VARIANT_TYPE_INT;
    }
    else static if (is(T == GodotFloat) || is(T == GodotFloat*))
    {
        enum GetGodotVariantType = GDEXTENSION_VARIANT_TYPE_FLOAT;
    }
    else static if (is(T U == U*))
    {
        enum GetGodotVariantType = U.variantType;
    }
    else
    {
        static assert(false, "Unsupported Godot Variant type.");
    }
}

unittest
{
    import godot_wrapper.gdextension_interface :
        GDEXTENSION_VARIANT_TYPE_BOOL,
        GDEXTENSION_VARIANT_TYPE_FLOAT,
        GDEXTENSION_VARIANT_TYPE_INT,
        GDEXTENSION_VARIANT_TYPE_OBJECT;
    import godot_wrapper.builtins.bool_ : GodotBool;
    import godot_wrapper.builtins.float_ : GodotFloat;
    import godot_wrapper.builtins.int_ : GodotInt;
    import godot_wrapper.builtins.object : GodotObject;

    static assert(GetGodotVariantType!GodotBool == GDEXTENSION_VARIANT_TYPE_BOOL);
    static assert(GetGodotVariantType!GodotFloat == GDEXTENSION_VARIANT_TYPE_FLOAT);
    static assert(GetGodotVariantType!GodotInt == GDEXTENSION_VARIANT_TYPE_INT);
    static assert(GetGodotVariantType!(GodotBool*) == GDEXTENSION_VARIANT_TYPE_BOOL);
    static assert(GetGodotVariantType!(GodotFloat*) == GDEXTENSION_VARIANT_TYPE_FLOAT);
    static assert(GetGodotVariantType!(GodotInt*) == GDEXTENSION_VARIANT_TYPE_INT);

    static assert(GetGodotVariantType!(GodotObject*) == GDEXTENSION_VARIANT_TYPE_OBJECT);
    static assert(GetGodotVariantType!(const(GodotObject)*) == GDEXTENSION_VARIANT_TYPE_OBJECT);
}
