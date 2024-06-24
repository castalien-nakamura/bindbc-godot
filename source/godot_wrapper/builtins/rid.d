module godot_wrapper.builtins.rid;

/**
Godot RID type.
*/
struct GodotRID
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_RID;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_RID;

private:
    ubyte[8] internal_;
}
