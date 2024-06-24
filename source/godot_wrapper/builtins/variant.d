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
            GDEXTENSION_VARIANT_TYPE_NIL,
            GDEXTENSION_VARIANT_TYPE_BOOL,
            GDEXTENSION_VARIANT_TYPE_INT,
            GDEXTENSION_VARIANT_TYPE_FLOAT,
            GDEXTENSION_VARIANT_TYPE_STRING,
            GDEXTENSION_VARIANT_TYPE_VECTOR2,
            GDEXTENSION_VARIANT_TYPE_VECTOR2I,
            GDEXTENSION_VARIANT_TYPE_RECT2,
            GDEXTENSION_VARIANT_TYPE_RECT2I,
            GDEXTENSION_VARIANT_TYPE_VECTOR3,
            GDEXTENSION_VARIANT_TYPE_VECTOR3I,
            GDEXTENSION_VARIANT_TYPE_TRANSFORM2D,
            GDEXTENSION_VARIANT_TYPE_VECTOR4,
            GDEXTENSION_VARIANT_TYPE_VECTOR4I,
            GDEXTENSION_VARIANT_TYPE_PLANE,
            GDEXTENSION_VARIANT_TYPE_QUATERNION,
            GDEXTENSION_VARIANT_TYPE_AABB,
            GDEXTENSION_VARIANT_TYPE_BASIS,
            GDEXTENSION_VARIANT_TYPE_TRANSFORM3D,
            GDEXTENSION_VARIANT_TYPE_PROJECTION,
            GDEXTENSION_VARIANT_TYPE_COLOR,
            GDEXTENSION_VARIANT_TYPE_STRING_NAME,
            GDEXTENSION_VARIANT_TYPE_NODE_PATH,
            GDEXTENSION_VARIANT_TYPE_RID,
            GDEXTENSION_VARIANT_TYPE_OBJECT,
            GDEXTENSION_VARIANT_TYPE_CALLABLE,
            GDEXTENSION_VARIANT_TYPE_SIGNAL,
            GDEXTENSION_VARIANT_TYPE_DICTIONARY,
            GDEXTENSION_VARIANT_TYPE_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_BYTE_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_INT32_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_INT64_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT32_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT64_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR2_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR3_ARRAY,
            GDEXTENSION_VARIANT_TYPE_PACKED_COLOR_ARRAY;
        import godot_wrapper.builtins.aabb : GodotAABB;
        import godot_wrapper.builtins.array : GodotArray;
        import godot_wrapper.builtins.basis : GodotBasis;
        import godot_wrapper.builtins.bool_ : GodotBool;
        import godot_wrapper.builtins.callable : GodotCallable;
        import godot_wrapper.builtins.color : GodotColor;
        import godot_wrapper.builtins.dictionary : GodotDictionary;
        import godot_wrapper.builtins.float_ : GodotFloat;
        import godot_wrapper.builtins.int_ : GodotInt;
        import godot_wrapper.builtins.node_path : GodotNodePath;
        import godot_wrapper.builtins.object : GodotObject;
        import godot_wrapper.builtins.packed_byte_array : GodotPackedByteArray;
        import godot_wrapper.builtins.packed_color_array : GodotPackedColorArray;
        import godot_wrapper.builtins.packed_float32_array : GodotPackedFloat32Array;
        import godot_wrapper.builtins.packed_float64_array : GodotPackedFloat64Array;
        import godot_wrapper.builtins.packed_int32_array : GodotPackedInt32Array;
        import godot_wrapper.builtins.packed_int64_array : GodotPackedInt64Array;
        import godot_wrapper.builtins.packed_string_array : GodotPackedStringArray;
        import godot_wrapper.builtins.packed_vector2_array : GodotPackedVector2Array;
        import godot_wrapper.builtins.packed_vector3_array : GodotPackedVector3Array;
        import godot_wrapper.builtins.plane : GodotPlane;
        import godot_wrapper.builtins.projection : GodotProjection;
        import godot_wrapper.builtins.quaternion : GodotQuaternion;
        import godot_wrapper.builtins.rect2 : GodotRect2;
        import godot_wrapper.builtins.rect2i : GodotRect2i;
        import godot_wrapper.builtins.rid : GodotRID;
        import godot_wrapper.builtins.signal : GodotSignal;
        import godot_wrapper.builtins.string_name : GodotStringName;
        import godot_wrapper.builtins.string : GodotString;
        import godot_wrapper.builtins.transform2d : GodotTransform2D;
        import godot_wrapper.builtins.transform3d : GodotTransform3D;
        import godot_wrapper.builtins.vector2 : GodotVector2;
        import godot_wrapper.builtins.vector2i : GodotVector2i;
        import godot_wrapper.builtins.vector3: GodotVector3;
        import godot_wrapper.builtins.vector3i : GodotVector3i;
        import godot_wrapper.builtins.vector4 : GodotVector4;
        import godot_wrapper.builtins.vector4i : GodotVector4i;
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
    else static if (is(T == GodotString))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_STRING;
    }
    else static if (is(T == GodotVector2))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_VECTOR2;
    }
    else static if (is(T == GodotVector2i))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_VECTOR2I;
    }
    else static if (is(T == GodotRect2))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_RECT2;
    }
    else static if (is(T == GodotRect2i))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_RECT2I;
    }
    else static if (is(T == GodotVector3))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_VECTOR3;
    }
    else static if (is(T == GodotVector3i))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_VECTOR3I;
    }
    else static if (is(T == GodotTransform2D))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_TRANSFORM2D;
    }
    else static if (is(T == GodotVector4))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_VECTOR4;
    }
    else static if (is(T == GodotVector4i))
    {
        enum GodotVariantType = GDEXTENSION_VARIANT_TYPE_VECTOR4i;
    }
    else
    {
        static assert(false, "Unsupported type");
    }
}
