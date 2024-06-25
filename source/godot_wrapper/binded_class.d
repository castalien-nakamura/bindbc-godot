module godot_wrapper.binded_class;

/** 
Export name for a GDExtension class.
*/
struct GDExtensionExportName
{
    string name;
}

/** 
base class name for a GDExtension class.
*/
struct GDExtensionBaseClassName
{
    string name;
}

/** 
Export method for a GDExtension class.
*/
struct GDExtensionExportMethod
{
    string name;
}

/**
GDExtension binded class interface.
*/
interface GDExtensionBindedClass
{
    /** 
    Called when the object is freed.
    */
    void onDestroy() nothrow;
}

/**
Get the export name for a GDExtension binded class.

Params:
    T = The type of the class.
*/
template GetGDExtensionExportName(T : GDExtensionBindedClass)
{
    private import std.traits : getUDAs, Unqual;

    private enum exportNames = getUDAs!(T, GDExtensionExportName);

    static if (exportNames.length == 0)
    {
        enum GetGDExtensionExportName = __traits(identifier, Unqual!T);
    }
    else static if (exportNames.length == 1)
    {
        enum GetGDExtensionExportName = exportNames[0].name;
    }
    else
    {
        static assert(false, "Only one Godot export name is allowed.");
    }
}

/**
Get the base class name for a GDExtension binded class.

Params:
    T = The type of the class.
*/
template GetGDExtensionBaseClassName(T : GDExtensionBindedClass)
{
    private import std.traits : getUDAs;

    private enum baseClasseNames = getUDAs!(T, GDExtensionBaseClassName);

    static if (baseClasseNames.length == 0)
    {
        enum GetGDExtensionBaseClassName = "Object";
    }
    else static if (baseClasseNames.length == 1)
    {
        enum GetGDExtensionBaseClassName = baseClasseNames[0].name;
    }
    else
    {
        static assert(false, "Only one Godot base class is allowed.");
    }
}

/**
Get the base class name for a GDExtension binded class.

Params:
    method = The type of the class.
*/
template GetGDExtensionExportMethodName(alias method)
{
    private
    {
        import std.traits : getUDAs, isCallable;
        import godot_wrapper.binded_class : GDExtensionExportMethod;
    }

    static assert(isCallable!method, "The type must be callable.");
    private enum exportMethods = getUDAs!(method, GDExtensionExportMethod);

    static if (exportMethods.length == 0)
    {
        static assert(false, "No Godot export method is defined.");
    }
    else static if (exportMethods.length == 1)
    {
        enum GetGDExtensionExportMethodName = exportMethods[0].name == ""
            ? __traits(identifier, method)
            : exportMethods[0].name;
    }
    else
    {
        static assert(false, "Only one Godot export method is allowed.");
    }
}
