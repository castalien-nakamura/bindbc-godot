module godot_wrapper.entrypoint;

version (Windows) {
    version (D_BetterC) {
    } else {
        import core.sys.windows.dll : SimpleDllMain;
        mixin SimpleDllMain;
    }
}
