module godot_wrapper.print;

import std.exception : collectException;
import std.string : format, toStringz;
import std.stdint : int32_t;

import godot_wrapper.gdextension_interface :
    print_error_with_message,
    print_warning,
    print_warning_with_message;

/**
Prints a warning message to the Godot editor console.

Params:
    file = file name.
    fn = function name.
    line = line number.
    description = description of the warning.
    args = arguments to format the message.
*/
void print(
    string file = __FILE__,
    string fn = __PRETTY_FUNCTION__,
    size_t line = __LINE__,
    Args...)(string description, Args args) nothrow
{
    immutable(char)* message;
    auto error = collectException(format(args).toStringz, message);
    if (error)
    {
        print_error_with_message(
            description.toStringz,
            message,
            fn,
            file,
            cast(int32_t) line,
            true);
        return;
    }

    print_warning_with_message(
        description.toStringz,
        message,
        fn,
        file,
        cast(int32_t) line,
        true);
}

/**
Prints a warning message to the Godot editor console.

Params:
    file = file name.
    fn = function name.
    line = line number.
    description = description of the warning.
*/
void print(
    string file = __FILE__,
    string fn = __PRETTY_FUNCTION__,
    size_t line = __LINE__)(string description) nothrow
{
    print_warning(
        description.toStringz,
        fn,
        file,
        cast(int32_t) line,
        true);
}
