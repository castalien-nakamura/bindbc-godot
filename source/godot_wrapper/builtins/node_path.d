module godot_wrapper.builtins.node_path;

/**
Godot NodePath type.
*/
struct GodotNodePath
{
    private
    {
        import godot_wrapper.gdextension_interface : GDEXTENSION_VARIANT_TYPE_NODE_PATH;
    }

    enum variantType = GDEXTENSION_VARIANT_TYPE_NODE_PATH;

private:
    size_t internal_;
}
