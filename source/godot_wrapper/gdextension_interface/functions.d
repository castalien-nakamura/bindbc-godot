module godot_wrapper.gdextension_interface.functions;

import godot_wrapper.gdextension_interface.types;
import core.stdc.stddef : wchar_t;
import std.stdint : int32_t,
    int64_t,
    uint8_t,
    uint32_t,
    uint64_t;

@nogc nothrow pragma(inline)
{
    /* GODOT CORE */

    void get_godot_version(GDExtensionGodotVersion* r_godot_version)
    {
        _get_godot_version(r_godot_version);
    }

    void* mem_alloc(size_t p_bytes)
    {
        return _mem_alloc(p_bytes);
    }

    void* mem_realloc(void* p_ptr, size_t p_bytes)
    {
        return _mem_realloc(p_ptr, p_bytes);
    }

    void mem_free(void* p_ptr)
    {
        _mem_free(p_ptr);
    }

    void print_error(
        const(char)* p_description,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify)
    {
        _print_error(p_description, p_function, p_file, p_line, p_editor_notify); 
    }

    void print_error_with_message(
        const(char)* p_description,
        const(char)* p_message,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify)
    {
        _print_error_with_message(p_description, p_message, p_function, p_file, p_line, p_editor_notify);
    }

    void print_warning(
        const(char)* p_description,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify)
    {
        _print_warning(p_description, p_function, p_file, p_line, p_editor_notify);
    }

    void print_warning_with_message(
        const(char)* p_description,
        const(char)* p_message,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify)
    {
        _print_warning_with_message(p_description, p_message, p_function, p_file, p_line, p_editor_notify);
    }

    void print_script_error(
        const(char)* p_description,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify)
    {
        _print_script_error(p_description, p_function, p_file, p_line, p_editor_notify);
    }

    void print_script_error_with_message(
        const(char)* p_description,
        const(char)* p_message,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify)
    {
        _print_script_error_with_message(p_description, p_message, p_function, p_file, p_line, p_editor_notify);
    }

    uint64_t get_native_struct_size(GDExtensionConstStringNamePtr p_name)
    {
        return _get_native_struct_size(p_name);
    }

    /* GODOT VARIANT */

    /* variant general */
    void variant_new_copy(GDExtensionVariantPtr r_dest, GDExtensionConstVariantPtr p_src)
    {
        _variant_new_copy(r_dest, p_src);
    }

    void variant_new_nil(GDExtensionVariantPtr r_dest)
    {
        _variant_new_nil(r_dest);
    }

    void variant_destroy(GDExtensionVariantPtr p_self)
    {
        _variant_destroy(p_self);
    }

    /* variant type */
    void variant_call(
        GDExtensionVariantPtr p_self,
        GDExtensionConstStringNamePtr p_method,
        const(GDExtensionConstVariantPtr)* p_args,
        GDExtensionInt p_argument_count,
        GDExtensionVariantPtr r_return,
        GDExtensionCallError* r_error)
    {
        _variant_call(p_self, p_method, p_args, p_argument_count, r_return, r_error);
    }

    void variant_call_static(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_method,
        const(GDExtensionConstVariantPtr)* p_args,
        GDExtensionInt p_argument_count,
        GDExtensionVariantPtr r_return,
        GDExtensionCallError* r_error)
    {
        _variant_call_static(p_type, p_method, p_args, p_argument_count, r_return, r_error);
    }

    void variant_evaluate(
        GDExtensionVariantOperator p_op,
        GDExtensionConstVariantPtr p_a,
        GDExtensionConstVariantPtr p_b,
        GDExtensionVariantPtr r_return,
        GDExtensionBool* r_valid)
    {
        _variant_evaluate(p_op, p_a, p_b, r_return, r_valid);    
    }

    void variant_set(
        GDExtensionVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid)
    {
        _variant_set(p_self, p_key, p_value, r_valid);
    }

    void variant_set_named(
        GDExtensionVariantPtr p_self,
        GDExtensionConstStringNamePtr p_key,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid)
    {
        _variant_set_named(p_self, p_key, p_value, r_valid);
    }

    void variant_set_keyed(
        GDExtensionVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid)
    {
        _variant_set_keyed(p_self, p_key, p_value, r_valid);
    }

    void variant_set_indexed(
        GDExtensionVariantPtr p_self,
        GDExtensionInt p_index,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid,
        GDExtensionBool* r_oob)
    {
        _variant_set_indexed(p_self, p_index, p_value, r_valid, r_oob);
    }

    void variant_get(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionVariantPtr r_ret,
        GDExtensionBool* r_valid)
    {
        _variant_get(p_self, p_key, r_ret, r_valid);
    }

    void variant_get_named(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstStringNamePtr p_key,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid)
    {
        _variant_get_named(p_self, p_key, r_ret, r_valid);
    }

    void variant_get_keyed(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid)
    {
        _variant_get_keyed(p_self, p_key, r_ret, r_valid);
    }

    void variant_get_indexed(
        GDExtensionConstVariantPtr p_self,
        GDExtensionInt p_index,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid,
        GDExtensionBool* r_oob)
    {
        _variant_get_indexed(p_self, p_index, r_ret, r_valid, r_oob);
    }

    GDExtensionBool variant_iter_init(
        GDExtensionConstVariantPtr p_self,
        GDExtensionUninitializedVariantPtr r_iter,
        GDExtensionBool* r_valid)
    {
        return _variant_iter_init(p_self, r_iter, r_valid);
    }

    GDExtensionBool variant_iter_next(
        GDExtensionConstVariantPtr p_self,
        GDExtensionVariantPtr r_iter,
        GDExtensionBool* r_valid)
    {
        return _variant_iter_next(p_self, r_iter, r_valid);
    }

    void variant_iter_get(
        GDExtensionConstVariantPtr p_self,
        GDExtensionVariantPtr r_iter,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid)
    {
        return _variant_iter_get(p_self, r_iter, r_ret, r_valid);
    }

    GDExtensionInt variant_hash(GDExtensionConstVariantPtr p_self)
    {
        return _variant_hash(p_self);
    }

    GDExtensionInt variant_recursive_hash(
        GDExtensionConstVariantPtr p_self,
        GDExtensionInt p_recursion_count)
    {
        return _variant_recursive_hash(p_self, p_recursion_count);
    }

    GDExtensionBool variant_hash_compare(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_other)
    {
        return _variant_hash_compare(p_self, p_other);
    }

    GDExtensionBool variant_booleanize(GDExtensionConstVariantPtr p_self)
    {
        return _variant_booleanize(p_self);
    }

    void variant_duplicate(
        GDExtensionConstVariantPtr p_self,
        GDExtensionVariantPtr r_ret,
        GDExtensionBool p_deep)
    {
        return _variant_duplicate(p_self, r_ret, p_deep);
    }

    void variant_stringify(GDExtensionConstVariantPtr p_self, GDExtensionStringPtr r_ret)
    {
        return _variant_stringify(p_self, r_ret);
    }

    GDExtensionVariantType variant_get_type(GDExtensionConstVariantPtr p_self)
    {
        return _variant_get_type(p_self);
    }

    GDExtensionBool variant_has_method(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstStringNamePtr p_method)
    {
        return _variant_has_method(p_self, p_method);
    }

    GDExtensionBool variant_has_member(GDExtensionVariantType p_type, GDExtensionConstStringNamePtr p_member)
    {
        return _variant_has_member(p_type, p_member);
    }

    GDExtensionBool variant_has_key(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionBool* r_valid)
    {
        return _variant_has_key(p_self, p_key, r_valid);
    }

    void variant_get_type_name(GDExtensionVariantType p_type, GDExtensionUninitializedStringPtr r_name)
    {
        _variant_get_type_name(p_type, r_name);
    }

    GDExtensionBool variant_can_convert(GDExtensionVariantType p_from, GDExtensionVariantType p_to)
    {
        return _variant_can_convert(p_from, p_to);
    }

    GDExtensionBool variant_can_convert_strict(GDExtensionVariantType p_from, GDExtensionVariantType p_to)
    {
        return _variant_can_convert_strict(p_from, p_to);
    }

    /* ptrcalls */
    GDExtensionVariantFromTypeConstructorFunc get_variant_from_type_constructor(GDExtensionVariantType p_type)
    {
        return _get_variant_from_type_constructor(p_type);
    }

    GDExtensionTypeFromVariantConstructorFunc get_variant_to_type_constructor(GDExtensionVariantType p_type)
    {
        return _get_variant_to_type_constructor(p_type);
    }

    GDExtensionPtrOperatorEvaluator variant_get_ptr_operator_evaluator(
        GDExtensionVariantOperator p_operator,
        GDExtensionVariantType p_type_a,
        GDExtensionVariantType p_type_b)
    {
        return _variant_get_ptr_operator_evaluator(p_operator, p_type_a, p_type_b);
    }

    GDExtensionPtrBuiltInMethod variant_get_ptr_builtin_method(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_method,
        GDExtensionInt p_hash)
    {
        return _variant_get_ptr_builtin_method(p_type, p_method, p_hash);
    }

    GDExtensionPtrConstructor variant_get_ptr_constructor(GDExtensionVariantType p_type, int32_t p_constructor)
    {
        return _variant_get_ptr_constructor(p_type, p_constructor);
    }

    GDExtensionPtrDestructor variant_get_ptr_destructor(GDExtensionVariantType p_type)
    {
        return _variant_get_ptr_destructor(p_type);
    }

    void variant_construct(
        GDExtensionVariantType p_type,
        GDExtensionUninitializedVariantPtr p_base,
        const(GDExtensionConstVariantPtr)* p_args,
        int32_t p_argument_count,
        GDExtensionCallError* r_error)
    {
        _variant_construct(p_type, p_base, p_args, p_argument_count, r_error);
    }

    GDExtensionPtrSetter variant_get_ptr_setter(GDExtensionVariantType p_type, GDExtensionConstStringNamePtr p_member)
    {
        return _variant_get_ptr_setter(p_type, p_member);
    }

    GDExtensionPtrGetter variant_get_ptr_getter(GDExtensionVariantType p_type, GDExtensionConstStringNamePtr p_member)
    {
        return _variant_get_ptr_getter(p_type, p_member);
    }

    GDExtensionPtrIndexedSetter variant_get_ptr_indexed_setter(GDExtensionVariantType p_type)
    {
        return _variant_get_ptr_indexed_setter(p_type);
    }

    GDExtensionPtrIndexedGetter variant_get_ptr_indexed_getter(GDExtensionVariantType p_type)
    {
        return _variant_get_ptr_indexed_getter(p_type);
    }

    GDExtensionPtrKeyedSetter variant_get_ptr_keyed_setter(GDExtensionVariantType p_type)
    {
        return _variant_get_ptr_keyed_setter(p_type);
    }

    GDExtensionPtrKeyedGetter variant_get_ptr_keyed_getter(GDExtensionVariantType p_type)
    {
        return _variant_get_ptr_keyed_getter(p_type);
    }

    GDExtensionPtrKeyedChecker variant_get_ptr_keyed_checker(GDExtensionVariantType p_type)
    {
        return _variant_get_ptr_keyed_checker(p_type);
    }

    void variant_get_constant_value(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_constant,
        GDExtensionUninitializedVariantPtr r_ret)
    {
        _variant_get_constant_value(p_type, p_constant, r_ret);
    }

    GDExtensionPtrUtilityFunction variant_get_ptr_utility_function(
        GDExtensionConstStringNamePtr p_function,
        GDExtensionInt p_hash)
    {
        return _variant_get_ptr_utility_function(p_function, p_hash);
    }

    /*  extra utilities */
    void string_new_with_latin1_chars(GDExtensionStringPtr r_dest, const(char)* p_contents)
    {
        _string_new_with_latin1_chars(r_dest, p_contents);
    }

    void string_new_with_utf8_chars(GDExtensionStringPtr r_dest, const(char)* p_contents)
    {
        _string_new_with_utf8_chars(r_dest, p_contents);
    }

    void string_new_with_utf16_chars(GDExtensionUninitializedStringPtr r_dest, const(char16_t)* p_contents)
    {
        _string_new_with_utf16_chars(r_dest, p_contents);
    }

    void string_new_with_utf32_chars(GDExtensionStringPtr r_dest, const(char32_t)* p_contents)
    {
        _string_new_with_utf32_chars(r_dest, p_contents);
    }

    void string_new_with_wide_chars(GDExtensionUninitializedStringPtr r_dest, const(wchar_t)* p_contents)
    {
        _string_new_with_wide_chars(r_dest, p_contents);
    }

    void string_new_with_latin1_chars_and_len(
        GDExtensionUninitializedStringPtr r_dest,
        const(char)* p_contents,
        GDExtensionInt p_size)
    {
        _string_new_with_latin1_chars_and_len(r_dest, p_contents, p_size);
    }

    void string_new_with_utf8_chars_and_len(
        GDExtensionUninitializedStringPtr r_dest,
        const(char)* p_contents,
        GDExtensionInt p_size)
    {
        _string_new_with_utf8_chars_and_len(r_dest, p_contents, p_size);
    }

    void string_new_with_utf16_chars_and_len(
        GDExtensionUninitializedStringPtr r_dest,
        const(char16_t)* p_contents,
        GDExtensionInt p_size)
    {
        _string_new_with_utf16_chars_and_len(r_dest, p_contents, p_size);
    }

    void string_new_with_utf32_chars_and_len(
        GDExtensionUninitializedStringPtr r_dest,
        const(char32_t)* p_contents,
        GDExtensionInt p_size)
    {
        _string_new_with_utf32_chars_and_len(r_dest, p_contents, p_size);
    }

    void string_new_with_wide_chars_and_len(
        GDExtensionUninitializedStringPtr r_dest,
        const(wchar_t)* p_contents,
        GDExtensionInt p_size)
    {
        _string_new_with_wide_chars_and_len(r_dest, p_contents, p_size);
    }

    GDExtensionInt string_to_latin1_chars(
        GDExtensionConstStringPtr p_self,
        char* r_text,
        GDExtensionInt p_max_write_length)
    {
        return _string_to_latin1_chars(p_self, r_text, p_max_write_length);
    }

    GDExtensionInt string_to_utf8_chars(
        GDExtensionConstStringPtr p_self,
        char* r_text,
        GDExtensionInt p_max_write_length)
    {
        return _string_to_utf8_chars(p_self, r_text, p_max_write_length);
    }

    GDExtensionInt string_to_utf16_chars(
        GDExtensionConstStringPtr p_self,
        char16_t* r_text,
        GDExtensionInt p_max_write_length)
    {
        return _string_to_utf16_chars(p_self, r_text, p_max_write_length);
    }

    GDExtensionInt string_to_utf32_chars(
        GDExtensionConstStringPtr p_self,
        char32_t* r_text,
        GDExtensionInt p_max_write_length)
    {
        return _string_to_utf32_chars(p_self, r_text, p_max_write_length);
    }

    GDExtensionInt string_to_wide_chars(
        GDExtensionConstStringPtr p_self,
        wchar_t* r_text,
        GDExtensionInt p_max_write_length)
    {
        return _string_to_wide_chars(p_self, r_text, p_max_write_length);
    }

    char32_t* string_operator_index(GDExtensionStringPtr p_self, GDExtensionInt p_index)
    {
        return _string_operator_index(p_self, p_index);
    }

    const(char32_t)* string_operator_index_const(
        GDExtensionConstStringPtr p_self,
        GDExtensionInt p_index)
    {
        return _string_operator_index_const(p_self, p_index);
    }

    void string_operator_plus_eq_string(
        GDExtensionStringPtr p_self,
        GDExtensionConstStringPtr p_b)
    {
        _string_operator_plus_eq_string(p_self, p_b);
    }

    void string_operator_plus_eq_char(GDExtensionStringPtr p_self, char32_t p_b)
    {
        _string_operator_plus_eq_char(p_self, p_b);
    }

    void string_operator_plus_eq_cstr(GDExtensionStringPtr p_self, const(char)* p_b)
    {
        _string_operator_plus_eq_cstr(p_self, p_b);
    }

    void string_operator_plus_eq_wcstr(GDExtensionStringPtr p_self, const(wchar_t)* p_b)
    {
        _string_operator_plus_eq_wcstr(p_self, p_b);
    }

    void string_operator_plus_eq_c32str(GDExtensionStringPtr p_self, const(char32_t)* p_b)
    {
        _string_operator_plus_eq_c32str(p_self, p_b);
    }

    GDExtensionInt string_resize(GDExtensionStringPtr p_self, GDExtensionInt p_resize) 
    {
        return _string_resize(p_self, p_resize);
    }

    void string_name_new_with_latin1_chars(
        GDExtensionUninitializedStringNamePtr r_dest,
        const(char)* p_contents,
        GDExtensionBool p_is_static)
    {
        _string_name_new_with_latin1_chars(r_dest, p_contents, p_is_static);
    }

    void string_name_new_with_utf8_chars(
        GDExtensionUninitializedStringNamePtr r_dest,
        const(char)* p_contents)
    {
        _string_name_new_with_utf8_chars(r_dest, p_contents);
    }

    void string_name_new_with_utf8_chars_and_len(
        GDExtensionUninitializedStringNamePtr r_dest,
        const(char)* p_contents,
        GDExtensionInt p_size)
    {
        _string_name_new_with_utf8_chars_and_len(r_dest, p_contents, p_size);
    }

    /*  XMLParser extra utilities */

    GDExtensionInt xml_parser_open_buffer(
        GDExtensionObjectPtr p_instance,
        const(uint8_t)* p_buffer,
        size_t p_size)
    {
        return _xml_parser_open_buffer(p_instance, p_buffer, p_size);
    }

    /*  FileAccess extra utilities */

    void file_access_store_buffer(GDExtensionObjectPtr p_instance, const(uint8_t)* p_src, uint64_t p_length)
    {
        _file_access_store_buffer(p_instance, p_src, p_length);
    }

    uint64_t file_access_get_buffer(GDExtensionConstObjectPtr p_instance, uint8_t* p_dst, uint64_t p_length)
    {
        return _file_access_get_buffer(p_instance, p_dst, p_length);
    }

    /*  WorkerThreadPool extra utilities */

    int64_t worker_thread_pool_add_native_group_task(
        GDExtensionObjectPtr p_instance,
        GDGroupTaskFunction p_func,
        void* p_userdata,
        int p_elements,
        int p_tasks,
        GDExtensionBool p_high_priority,
        GDExtensionConstStringPtr p_description)
    {
        return _worker_thread_pool_add_native_group_task(
            p_instance, p_func, p_userdata, p_elements, p_tasks, p_high_priority, p_description);
    }

    int64_t worker_thread_pool_add_native_task(
        GDExtensionObjectPtr p_instance,
        GDTaskFunction p_func,
        void* p_userdata,
        GDExtensionBool p_high_priority,
        GDExtensionConstStringPtr p_description)
    {
        return _worker_thread_pool_add_native_task(
            p_instance, p_func, p_userdata, p_high_priority, p_description);
    }

    /* Packed array functions */

    uint8_t* packed_byte_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_byte_array_operator_index(p_self, p_index);
    }

    const(uint8_t)* packed_byte_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_byte_array_operator_index_const(p_self, p_index);
    }

    GDExtensionTypePtr packed_color_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_color_array_operator_index(p_self, p_index);
    }

    GDExtensionTypePtr packed_color_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_color_array_operator_index_const(p_self, p_index);
    }

    float* packed_float32_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_float32_array_operator_index(p_self, p_index);
    }

    const(float)* packed_float32_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_float32_array_operator_index_const(p_self, p_index);
    }

    double* packed_float64_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_float64_array_operator_index(p_self, p_index);
    }

    const(double)* packed_float64_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_float64_array_operator_index_const(p_self, p_index);
    }

    int32_t* packed_int32_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_int32_array_operator_index(p_self, p_index);
    }

    const(int32_t)* packed_int32_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_int32_array_operator_index_const(p_self, p_index);
    }

    int64_t* packed_int64_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_int64_array_operator_index(p_self, p_index);
    }

    const(int64_t)* packed_int64_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_int64_array_operator_index_const(p_self, p_index);
    }

    GDExtensionStringPtr packed_string_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_string_array_operator_index(p_self, p_index);
    }

    GDExtensionStringPtr packed_string_array_operator_index_const(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index)
    {
        return _packed_string_array_operator_index_const(p_self, p_index);
    }

    GDExtensionTypePtr packed_vector2_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_vector2_array_operator_index(p_self, p_index);
    }

    GDExtensionTypePtr packed_vector2_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_vector2_array_operator_index_const(p_self, p_index);
    }

    GDExtensionTypePtr packed_vector3_array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_vector3_array_operator_index(p_self, p_index);
    }

    GDExtensionTypePtr packed_vector3_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _packed_vector3_array_operator_index_const(p_self, p_index);
    }

    GDExtensionVariantPtr array_operator_index(GDExtensionTypePtr p_self, GDExtensionInt p_index)
    {
        return _array_operator_index(p_self, p_index);
    }

    GDExtensionVariantPtr array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
    {
        return _array_operator_index_const(p_self, p_index);
    }

    void array_ref(GDExtensionTypePtr p_self, GDExtensionConstTypePtr p_from)
    {
        _array_ref(p_self, p_from);
    }

    void array_set_typed(
        GDExtensionTypePtr p_self,
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstVariantPtr p_script)
    {
        _array_set_typed(p_self, p_type, p_class_name, p_script);
    }

    /* Dictionary functions */

    GDExtensionVariantPtr dictionary_operator_index(GDExtensionTypePtr p_self, GDExtensionConstVariantPtr p_key)
    {
        return _dictionary_operator_index(p_self, p_key);
    }

    GDExtensionVariantPtr dictionary_operator_index_const(
        GDExtensionConstTypePtr p_self,
        GDExtensionConstVariantPtr p_key)
    {
        return _dictionary_operator_index_const(p_self, p_key);
    }

    /* OBJECT */

    void object_method_bind_call(
        GDExtensionMethodBindPtr p_method_bind,
        GDExtensionObjectPtr p_instance,
        const(GDExtensionConstVariantPtr)* p_args,
        GDExtensionInt p_arg_count,
        GDExtensionVariantPtr r_ret,
        GDExtensionCallError* r_error)
    {
        _object_method_bind_call(p_method_bind, p_instance, p_args, p_arg_count, r_ret, r_error);
    }

    void object_method_bind_ptrcall(
        GDExtensionMethodBindPtr p_method_bind,
        GDExtensionObjectPtr p_instance,
        const(GDExtensionConstTypePtr)* p_args,
        GDExtensionTypePtr r_ret)
    {
        _object_method_bind_ptrcall(p_method_bind, p_instance, p_args, r_ret);
    }

    void object_destroy(GDExtensionObjectPtr p_o)
    {
        _object_destroy(p_o);
    }

    GDExtensionObjectPtr global_get_singleton(GDExtensionConstStringNamePtr p_name)
    {
        return _global_get_singleton(p_name);
    }

    void* object_get_instance_binding(
        GDExtensionObjectPtr p_o,
        void* p_token,
        const(GDExtensionInstanceBindingCallbacks)* p_callbacks)
    {
        return _object_get_instance_binding(p_o, p_token, p_callbacks);
    }

    void object_set_instance_binding(
        GDExtensionObjectPtr p_o,
        void* p_token,
        void* p_binding,
        const(GDExtensionInstanceBindingCallbacks)* p_callbacks)
    {
        _object_set_instance_binding(p_o, p_token, p_binding, p_callbacks);
    }

    void object_set_instance(
        GDExtensionObjectPtr p_o,
        GDExtensionConstStringNamePtr p_classname,
        GDExtensionClassInstancePtr p_instance)
    {
        _object_set_instance(p_o, p_classname, p_instance);
    }

    GDExtensionBool object_get_class_name(
        GDExtensionConstObjectPtr p_object,
        GDExtensionClassLibraryPtr p_library,
        GDExtensionUninitializedStringNamePtr r_class_name)
    {
        return _object_get_class_name(p_object, p_library, r_class_name);
    }

    GDExtensionObjectPtr object_cast_to(GDExtensionConstObjectPtr p_object, void* p_class_tag)
    {
        return _object_cast_to(p_object, p_class_tag);
    }

    GDExtensionObjectPtr object_get_instance_from_id(GDObjectInstanceID p_instance_id)
    {
        return _object_get_instance_from_id(p_instance_id);
    }

    GDObjectInstanceID object_get_instance_id(GDExtensionConstObjectPtr p_object)
    {
        return _object_get_instance_id(p_object);
    }

    /* REFERENCE */

    GDExtensionObjectPtr ref_get_object(GDExtensionConstRefPtr p_ref)
    {
        return _ref_get_object(p_ref);
    }

    void ref_set_object(GDExtensionRefPtr p_ref, GDExtensionObjectPtr p_object)
    {
        _ref_set_object(p_ref, p_object);
    }

    /* SCRIPT INSTANCE */

    GDExtensionScriptInstancePtr script_instance_create2(
        const(GDExtensionScriptInstanceInfo2)* p_info,
        GDExtensionScriptInstanceDataPtr p_instance_data)
    {
        return _script_instance_create2(p_info, p_instance_data);
    }

    GDExtensionScriptInstancePtr placeholder_script_instance_create(
        GDExtensionObjectPtr p_language,
        GDExtensionObjectPtr p_script,
        GDExtensionObjectPtr p_owner)
    {
        return _placeholder_script_instance_create(p_language, p_script, p_owner);
    }

    GDExtensionScriptInstanceDataPtr object_get_script_instance(
        GDExtensionConstObjectPtr p_object,
        GDExtensionObjectPtr p_language)
    {
        return _object_get_script_instance(p_object, p_language);
    }

    void callable_custom_create(
        GDExtensionUninitializedTypePtr r_callable,
        GDExtensionCallableCustomInfo* p_callable_custom_info)
    {
        _callable_custom_create(r_callable, p_callable_custom_info);
    }

    void* callable_custom_get_userdata(
        GDExtensionConstTypePtr p_callable,
        void* p_token)
    {
        return _callable_custom_get_userdata(p_callable, p_token);
    }

    /* CLASSDB */

    GDExtensionObjectPtr classdb_construct_object(GDExtensionConstStringNamePtr p_classname)
    {
        return _classdb_construct_object(p_classname);
    }

    GDExtensionMethodBindPtr classdb_get_method_bind(
        GDExtensionConstStringNamePtr p_classname,
        GDExtensionConstStringNamePtr p_methodname,
        GDExtensionInt p_hash)
    {
        return _classdb_get_method_bind(p_classname, p_methodname, p_hash);
    }

    void* classdb_get_class_tag(GDExtensionConstStringNamePtr p_classname)
    {
        return _classdb_get_class_tag(p_classname);
    }

    /* CLASSDB EXTENSION */

    void classdb_register_extension_class2(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringNamePtr p_parent_class_name,
        const(GDExtensionClassCreationInfo2)* p_extension_funcs)
    {
        _classdb_register_extension_class2(p_library, p_class_name, p_parent_class_name, p_extension_funcs);
    }

    void classdb_register_extension_class_method(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        const(GDExtensionClassMethodInfo)* p_method_info)
    {
        _classdb_register_extension_class_method(p_library, p_class_name, p_method_info);
    }

    void classdb_register_extension_class_integer_constant(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringNamePtr p_enum_name,
        GDExtensionConstStringNamePtr p_constant_name,
        GDExtensionInt p_constant_value,
        GDExtensionBool p_is_bitfield)
    {
        _classdb_register_extension_class_integer_constant(
            p_library, p_class_name, p_enum_name, p_constant_name, p_constant_value, p_is_bitfield);
    }

    void classdb_register_extension_class_property(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        const(GDExtensionPropertyInfo)* p_info,
        GDExtensionConstStringNamePtr p_setter,
        GDExtensionConstStringNamePtr p_getter)
    {
        _classdb_register_extension_class_property(p_library, p_class_name, p_info, p_setter, p_getter);
    }

    void classdb_register_extension_class_property_indexed(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        const(GDExtensionPropertyInfo)* p_info,
        GDExtensionConstStringNamePtr p_setter,
        GDExtensionConstStringNamePtr p_getter,
        GDExtensionInt p_index)
    {
        _classdb_register_extension_class_property_indexed(
            p_library, p_class_name, p_info, p_setter, p_getter, p_index);
    }

    void classdb_register_extension_class_property_group(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringPtr p_group_name,
        GDExtensionConstStringPtr p_prefix)
    {
        _classdb_register_extension_class_property_group(p_library, p_class_name, p_group_name, p_prefix);
    }

    void classdb_register_extension_class_property_subgroup(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringPtr p_subgroup_name,
        GDExtensionConstStringPtr p_prefix)
    {
        _classdb_register_extension_class_property_subgroup(p_library, p_class_name, p_subgroup_name, p_prefix);
    }

    void classdb_register_extension_class_signal(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringNamePtr p_signal_name,
        const(GDExtensionPropertyInfo)* p_argument_info,
        GDExtensionInt p_argument_count)
    {
        _classdb_register_extension_class_signal(
            p_library, p_class_name, p_signal_name, p_argument_info, p_argument_count);
    }

    void classdb_unregister_extension_class(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name)
    {
        _classdb_unregister_extension_class(p_library, p_class_name);
    }

    void get_library_path(GDExtensionClassLibraryPtr p_library, GDExtensionStringPtr r_path)
    {
        _get_library_path(p_library, r_path);
    }

    void editor_add_plugin(GDExtensionConstStringNamePtr p_class_name)
    {
        _editor_add_plugin(p_class_name);
    }

    void editor_remove_plugin(GDExtensionConstStringNamePtr p_class_name)
    {
        _editor_remove_plugin(p_class_name);
    }
}

/** 
Initializes the functions from the GDExtensionInterface.

Params:
    getProc = The function to get the address of a function from the GDExtensionInterface.
*/
void initializeGDExtensionFunctions(GDExtensionInterfaceGetProcAddress getProc) @nogc nothrow
in (getProc)
{
    import std.traits : getSymbolsByUDA;
    static foreach (symbole; getSymbolsByUDA!(godot_wrapper.gdextension_interface.functions, GodotFunctionName))
    {
        mixin(symbole.stringof ~ 
            " = cast(typeof(" ~ symbole.stringof ~ "))" ~
            " getProc(\"" ~  symbole.stringof[1 .. $] ~ "\");");
    }
}

private:

enum GodotFunctionName;

extern(C) @nogc nothrow @system
{
    @(GodotFunctionName)
    void function(GDExtensionGodotVersion* r_godot_version) _get_godot_version;
    
    @(GodotFunctionName)
    void* function(size_t p_bytes) _mem_alloc;
    
    @(GodotFunctionName)
    void* function(void* p_ptr, size_t p_bytes) _mem_realloc;
    
    @(GodotFunctionName)
    void function(void* p_ptr) _mem_free;
    
    @(GodotFunctionName)
    void function(
        const(char)* p_description,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify) _print_error;
    
    @(GodotFunctionName)
    void function(
        const(char)* p_description,
        const(char)* p_message,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify) _print_error_with_message;
    
    @(GodotFunctionName)
    void function(
        const(char)* p_description,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify) _print_warning;
    
    @(GodotFunctionName)
    void function(
        const(char)* p_description,
        const(char)* p_message,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify) _print_warning_with_message;
    
    @(GodotFunctionName)
    void function(
        const(char)* p_description,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify) _print_script_error;
    
    @(GodotFunctionName)
    void function(
        const(char)* p_description,
        const(char)* p_message,
        const(char)* p_function,
        const(char)* p_file,
        int32_t p_line,
        GDExtensionBool p_editor_notify) _print_script_error_with_message;
    
    @(GodotFunctionName)
    uint64_t function(GDExtensionConstStringNamePtr p_name) _get_native_struct_size;
    
    @(GodotFunctionName)
    void function(GDExtensionUninitializedVariantPtr r_dest, GDExtensionConstVariantPtr p_src) _variant_new_copy;
    
    @(GodotFunctionName)
    void function(GDExtensionUninitializedVariantPtr r_dest) _variant_new_nil;
    
    @(GodotFunctionName)
    void function(GDExtensionVariantPtr p_self) _variant_destroy;
    
    @(GodotFunctionName)
    void function(
        GDExtensionVariantPtr p_self,
        GDExtensionConstStringNamePtr p_method,
        const(GDExtensionConstVariantPtr)* p_args,
        GDExtensionInt p_argument_count,
        GDExtensionUninitializedVariantPtr r_return,
        GDExtensionCallError* r_error) _variant_call;
    
    @(GodotFunctionName)
    void function(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_method,
        const(GDExtensionConstVariantPtr)* p_args,
        GDExtensionInt p_argument_count,
        GDExtensionUninitializedVariantPtr r_return,
        GDExtensionCallError* r_error) _variant_call_static;
    
    @(GodotFunctionName)
    void function(
        GDExtensionVariantOperator p_op,
        GDExtensionConstVariantPtr p_a,
        GDExtensionConstVariantPtr p_b,
        GDExtensionUninitializedVariantPtr r_return,
        GDExtensionBool* r_valid) _variant_evaluate;
    
    @(GodotFunctionName)
    void function(
        GDExtensionVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid) _variant_set;
    
    @(GodotFunctionName)
    void function(
        GDExtensionVariantPtr p_self,
        GDExtensionConstStringNamePtr p_key,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid) _variant_set_named;
    
    @(GodotFunctionName)
    void function(
        GDExtensionVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid) _variant_set_keyed;
    
    @(GodotFunctionName)
    void function(
        GDExtensionVariantPtr p_self,
        GDExtensionInt p_index,
        GDExtensionConstVariantPtr p_value,
        GDExtensionBool* r_valid,
        GDExtensionBool* r_oob) _variant_set_indexed;
    
    @(GodotFunctionName)
    void function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid) _variant_get;
    
    @(GodotFunctionName)
    void function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstStringNamePtr p_key,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid) _variant_get_named;
    
    @(GodotFunctionName)
    void function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid) _variant_get_keyed;
    
    @(GodotFunctionName)
    void function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionInt p_index,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid,
        GDExtensionBool* r_oob) _variant_get_indexed;
    
    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionUninitializedVariantPtr r_iter,
        GDExtensionBool* r_valid) _variant_iter_init;
    
    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionVariantPtr r_iter,
        GDExtensionBool* r_valid) _variant_iter_next;
    
    @(GodotFunctionName)
    void function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionVariantPtr r_iter,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionBool* r_valid) _variant_iter_get;
    
    @(GodotFunctionName)
    GDExtensionInt function(GDExtensionConstVariantPtr p_self) _variant_hash;
    
    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionInt p_recursion_count) _variant_recursive_hash;
    
    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_other) _variant_hash_compare;
    
    @(GodotFunctionName)
    GDExtensionBool function(GDExtensionConstVariantPtr p_self) _variant_booleanize;

    @(GodotFunctionName)
    void function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionVariantPtr r_ret,
        GDExtensionBool p_deep) _variant_duplicate;

    @(GodotFunctionName)
    void function(GDExtensionConstVariantPtr p_self, GDExtensionStringPtr r_ret) _variant_stringify;

    @(GodotFunctionName)
    GDExtensionVariantType function(GDExtensionConstVariantPtr p_self) _variant_get_type;

    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstStringNamePtr p_method) _variant_has_method;

    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_member) _variant_has_member;

    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionConstVariantPtr p_self,
        GDExtensionConstVariantPtr p_key,
        GDExtensionBool* r_valid) _variant_has_key;

    @(GodotFunctionName)
    void function(
        GDExtensionVariantType p_type,
        GDExtensionUninitializedStringPtr r_name) _variant_get_type_name;

    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionVariantType p_from,
        GDExtensionVariantType p_to) _variant_can_convert;

    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionVariantType p_from,
        GDExtensionVariantType p_to) _variant_can_convert_strict;

    @(GodotFunctionName)
    GDExtensionVariantFromTypeConstructorFunc function(
        GDExtensionVariantType p_type) _get_variant_from_type_constructor;

    @(GodotFunctionName)
    GDExtensionTypeFromVariantConstructorFunc function(
        GDExtensionVariantType p_type) _get_variant_to_type_constructor;

    @(GodotFunctionName)
    GDExtensionPtrOperatorEvaluator function(
        GDExtensionVariantOperator p_operator,
        GDExtensionVariantType p_type_a,
        GDExtensionVariantType p_type_b) _variant_get_ptr_operator_evaluator;

    @(GodotFunctionName)
    GDExtensionPtrBuiltInMethod function(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_method,
        GDExtensionInt p_hash) _variant_get_ptr_builtin_method;

    @(GodotFunctionName)
    GDExtensionPtrConstructor function(
        GDExtensionVariantType p_type,
        int32_t p_constructor) _variant_get_ptr_constructor;

    @(GodotFunctionName)
    GDExtensionPtrDestructor function(GDExtensionVariantType p_type) _variant_get_ptr_destructor;

    @(GodotFunctionName)
    void function(
        GDExtensionVariantType p_type,
        GDExtensionUninitializedVariantPtr r_base,
        const(GDExtensionConstVariantPtr)* p_args,
        int32_t p_argument_count,
        GDExtensionCallError* r_error) _variant_construct;

    @(GodotFunctionName)
    GDExtensionPtrSetter function(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_member) _variant_get_ptr_setter;

    @(GodotFunctionName)
    GDExtensionPtrGetter function(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_member) _variant_get_ptr_getter;

    @(GodotFunctionName)
    GDExtensionPtrIndexedSetter function(
        GDExtensionVariantType p_type) _variant_get_ptr_indexed_setter;

    @(GodotFunctionName)
    GDExtensionPtrIndexedGetter function(
        GDExtensionVariantType p_type) _variant_get_ptr_indexed_getter;

    @(GodotFunctionName)
    GDExtensionPtrKeyedSetter function(
        GDExtensionVariantType p_type) _variant_get_ptr_keyed_setter;

    @(GodotFunctionName)
    GDExtensionPtrKeyedGetter function(
        GDExtensionVariantType p_type) _variant_get_ptr_keyed_getter;

    @(GodotFunctionName)
    GDExtensionPtrKeyedChecker function(
        GDExtensionVariantType p_type) _variant_get_ptr_keyed_checker;

    @(GodotFunctionName)
    void function(
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_constant,
        GDExtensionUninitializedVariantPtr r_ret) _variant_get_constant_value;

    @(GodotFunctionName)
    GDExtensionPtrUtilityFunction function(
        GDExtensionConstStringNamePtr p_function,
        GDExtensionInt p_hash) _variant_get_ptr_utility_function;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char)* p_contents) _string_new_with_latin1_chars;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char)* p_contents) _string_new_with_utf8_chars;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char16_t)* p_contents) _string_new_with_utf16_chars;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char32_t)* p_contents) _string_new_with_utf32_chars;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(wchar_t)* p_contents) _string_new_with_wide_chars;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char)* p_contents,
        GDExtensionInt p_size) _string_new_with_latin1_chars_and_len;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char)* p_contents,
        GDExtensionInt p_size) _string_new_with_utf8_chars_and_len;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char16_t)* p_contents,
        GDExtensionInt p_char_count) _string_new_with_utf16_chars_and_len;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(char32_t)* p_contents,
        GDExtensionInt p_char_count) _string_new_with_utf32_chars_and_len;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringPtr r_dest,
        const(wchar_t)* p_contents,
        GDExtensionInt p_char_count) _string_new_with_wide_chars_and_len;

    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionConstStringPtr p_self,
        char* r_text,
        GDExtensionInt p_max_write_length) _string_to_latin1_chars;

    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionConstStringPtr p_self,
        char* r_text,
        GDExtensionInt p_max_write_length) _string_to_utf8_chars;

    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionConstStringPtr p_self,
        char16_t* r_text,
        GDExtensionInt p_max_write_length) _string_to_utf16_chars;

    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionConstStringPtr p_self,
        char32_t* r_text,
        GDExtensionInt p_max_write_length) _string_to_utf32_chars;

    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionConstStringPtr p_self,
        wchar_t* r_text,
        GDExtensionInt p_max_write_length) _string_to_wide_chars;

    @(GodotFunctionName)
    char32_t* function(
        GDExtensionStringPtr p_self,
        GDExtensionInt p_index) _string_operator_index;

    @(GodotFunctionName)
    const(char32_t)* function(
        GDExtensionConstStringPtr p_self,
        GDExtensionInt p_index) _string_operator_index_const;

    @(GodotFunctionName)
    void function(
        GDExtensionStringPtr p_self,
        GDExtensionConstStringPtr p_b) _string_operator_plus_eq_string;

    @(GodotFunctionName)
    void function(
        GDExtensionStringPtr p_self,
        char32_t p_b) _string_operator_plus_eq_char;

    @(GodotFunctionName)
    void function(
        GDExtensionStringPtr p_self,
        const(char)* p_b) _string_operator_plus_eq_cstr;

    @(GodotFunctionName)
    void function(
        GDExtensionStringPtr p_self,
        const(wchar_t)* p_b) _string_operator_plus_eq_wcstr;

    @(GodotFunctionName)
    void function(
        GDExtensionStringPtr p_self,
        const(char32_t)* p_b) _string_operator_plus_eq_c32str;

    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionStringPtr p_self,
        GDExtensionInt p_resize) _string_resize;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringNamePtr r_dest,
        const(char)* p_contents,
        GDExtensionBool p_is_static) _string_name_new_with_latin1_chars;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringNamePtr r_dest,
        const(char)* p_contents) _string_name_new_with_utf8_chars;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedStringNamePtr r_dest,
        const(char)* p_contents,
        GDExtensionInt p_size) _string_name_new_with_utf8_chars_and_len;

    @(GodotFunctionName)
    GDExtensionInt function(
        GDExtensionObjectPtr p_instance,
        const(uint8_t)* p_buffer,
        size_t p_size) _xml_parser_open_buffer;

    @(GodotFunctionName)
    void function(
        GDExtensionObjectPtr p_instance,
        const(uint8_t)* p_src,
        uint64_t p_length) _file_access_store_buffer;

    @(GodotFunctionName)
    uint64_t function(
        GDExtensionConstObjectPtr p_instance,
        uint8_t* p_dst,
        uint64_t p_length) _file_access_get_buffer;

    @(GodotFunctionName)
    int64_t function(
        GDExtensionObjectPtr p_instance,
        GDGroupTaskFunction p_func,
        void* p_userdata,
        int p_elements,
        int p_tasks,
        GDExtensionBool p_high_priority,
        GDExtensionConstStringPtr p_description) _worker_thread_pool_add_native_group_task;

    @(GodotFunctionName)
    int64_t function(
        GDExtensionObjectPtr p_instance,
        GDTaskFunction p_func,
        void* p_userdata,
        GDExtensionBool p_high_priority,
        GDExtensionConstStringPtr p_description) _worker_thread_pool_add_native_task;

    @(GodotFunctionName)
    uint8_t* function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_byte_array_operator_index;

    @(GodotFunctionName)
    const(uint8_t)* function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_byte_array_operator_index_const;

    @(GodotFunctionName)
    GDExtensionTypePtr function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_color_array_operator_index;

    @(GodotFunctionName)
    GDExtensionTypePtr function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_color_array_operator_index_const;

    @(GodotFunctionName)
    float* function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_float32_array_operator_index;

    @(GodotFunctionName)
    const(float)* function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_float32_array_operator_index_const;

    @(GodotFunctionName)
    double* function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_float64_array_operator_index;

    @(GodotFunctionName)
    const(double)* function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_float64_array_operator_index_const;

    @(GodotFunctionName)
    int32_t* function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_int32_array_operator_index;

    @(GodotFunctionName)
    const(int32_t)* function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_int32_array_operator_index_const;

    @(GodotFunctionName)
    int64_t* function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_int64_array_operator_index;

    @(GodotFunctionName)
    const(int64_t)* function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_int64_array_operator_index_const;

    @(GodotFunctionName)
    GDExtensionStringPtr function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_string_array_operator_index;

    @(GodotFunctionName)
    GDExtensionStringPtr function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_string_array_operator_index_const;

    @(GodotFunctionName)
    GDExtensionTypePtr function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_vector2_array_operator_index;

    @(GodotFunctionName)
    GDExtensionTypePtr function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_vector2_array_operator_index_const;

    @(GodotFunctionName)
    GDExtensionTypePtr function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _packed_vector3_array_operator_index;

    @(GodotFunctionName)
    GDExtensionTypePtr function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _packed_vector3_array_operator_index_const;

    @(GodotFunctionName)
    GDExtensionVariantPtr function(
        GDExtensionTypePtr p_self,
        GDExtensionInt p_index) _array_operator_index;

    @(GodotFunctionName)
    GDExtensionVariantPtr function(
        GDExtensionConstTypePtr p_self,
        GDExtensionInt p_index) _array_operator_index_const;

    @(GodotFunctionName)
    void function(
        GDExtensionTypePtr p_self,
        GDExtensionConstTypePtr p_from) _array_ref;

    @(GodotFunctionName)
    void function(
        GDExtensionTypePtr p_self,
        GDExtensionVariantType p_type,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstVariantPtr p_script) _array_set_typed;

    @(GodotFunctionName)
    GDExtensionVariantPtr function(
        GDExtensionTypePtr p_self,
        GDExtensionConstVariantPtr p_key) _dictionary_operator_index;

    @(GodotFunctionName)
    GDExtensionVariantPtr function(
        GDExtensionConstTypePtr p_self,
        GDExtensionConstVariantPtr p_key) _dictionary_operator_index_const;

    @(GodotFunctionName)
    void function(
        GDExtensionMethodBindPtr p_method_bind,
        GDExtensionObjectPtr p_instance,
        const(GDExtensionConstVariantPtr)* p_args,
        GDExtensionInt p_arg_count,
        GDExtensionUninitializedVariantPtr r_ret,
        GDExtensionCallError* r_error) _object_method_bind_call;

    @(GodotFunctionName)
    void function(
        GDExtensionMethodBindPtr p_method_bind,
        GDExtensionObjectPtr p_instance,
        const(GDExtensionConstTypePtr)* p_args,
        GDExtensionTypePtr r_ret) _object_method_bind_ptrcall;

    @(GodotFunctionName)
    void function(GDExtensionObjectPtr p_o) _object_destroy;

    @(GodotFunctionName)
    GDExtensionObjectPtr function(GDExtensionConstStringNamePtr p_name) _global_get_singleton;

    @(GodotFunctionName)
    void* function(
        GDExtensionObjectPtr p_o,
        void* p_token,
        const(GDExtensionInstanceBindingCallbacks)* p_callbacks) _object_get_instance_binding;

    @(GodotFunctionName)
    void function(
        GDExtensionObjectPtr p_o,
        void* p_token,
        void* p_binding,
        const(GDExtensionInstanceBindingCallbacks)* p_callbacks) _object_set_instance_binding;

    @(GodotFunctionName)
    void function(GDExtensionObjectPtr p_o, void* p_token) _object_free_instance_binding;

    @(GodotFunctionName)
    void function(
        GDExtensionObjectPtr p_o,
        GDExtensionConstStringNamePtr p_classname,
        GDExtensionClassInstancePtr p_instance) _object_set_instance;

    @(GodotFunctionName)
    GDExtensionBool function(
        GDExtensionConstObjectPtr p_object,
        GDExtensionClassLibraryPtr p_library,
        GDExtensionUninitializedStringNamePtr r_class_name) _object_get_class_name;

    @(GodotFunctionName)
    GDExtensionObjectPtr function(
        GDExtensionConstObjectPtr p_object,
        void* p_class_tag) _object_cast_to;

    @(GodotFunctionName)
    GDExtensionObjectPtr function(GDObjectInstanceID p_instance_id) _object_get_instance_from_id;

    @(GodotFunctionName)
    GDObjectInstanceID function(GDExtensionConstObjectPtr p_object) _object_get_instance_id;

    @(GodotFunctionName)
    GDExtensionObjectPtr function(GDExtensionConstRefPtr p_ref) _ref_get_object;

    @(GodotFunctionName)
    void function(GDExtensionRefPtr p_ref, GDExtensionObjectPtr p_object) _ref_set_object;

    @(GodotFunctionName)
    GDExtensionScriptInstancePtr function(
        const(GDExtensionScriptInstanceInfo2)* p_info,
        GDExtensionScriptInstanceDataPtr p_instance_data) _script_instance_create2;

    @(GodotFunctionName)
    GDExtensionScriptInstancePtr function(
        GDExtensionObjectPtr p_language,
        GDExtensionObjectPtr p_script,
        GDExtensionObjectPtr p_owner) _placeholder_script_instance_create;

    @(GodotFunctionName)
    void function(
        GDExtensionScriptInstancePtr p_placeholder,
        GDExtensionConstTypePtr p_properties,
        GDExtensionConstTypePtr p_values) _placeholder_script_instance_update;

    @(GodotFunctionName)
    GDExtensionScriptInstanceDataPtr function(
        GDExtensionConstObjectPtr p_object,
        GDExtensionObjectPtr p_language) _object_get_script_instance;

    @(GodotFunctionName)
    void function(
        GDExtensionUninitializedTypePtr r_callable,
        GDExtensionCallableCustomInfo* p_callable_custom_info) _callable_custom_create;

    @(GodotFunctionName)
    void* function(
        GDExtensionConstTypePtr p_callable,
        void* p_token) _callable_custom_get_userdata;

    @(GodotFunctionName)
    GDExtensionObjectPtr function(
        GDExtensionConstStringNamePtr p_classname) _classdb_construct_object;

    @(GodotFunctionName)
    GDExtensionMethodBindPtr function(
        GDExtensionConstStringNamePtr p_classname,
        GDExtensionConstStringNamePtr p_methodname,
        GDExtensionInt p_hash) _classdb_get_method_bind;

    @(GodotFunctionName)
    void* function(GDExtensionConstStringNamePtr p_classname) _classdb_get_class_tag;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringNamePtr p_parent_class_name,
        const(GDExtensionClassCreationInfo2)* p_extension_funcs) _classdb_register_extension_class2;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        const(GDExtensionClassMethodInfo)* p_method_info) _classdb_register_extension_class_method;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringNamePtr p_enum_name,
        GDExtensionConstStringNamePtr p_constant_name,
        GDExtensionInt p_constant_value,
        GDExtensionBool p_is_bitfield) _classdb_register_extension_class_integer_constant;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        const(GDExtensionPropertyInfo)* p_info,
        GDExtensionConstStringNamePtr p_setter,
        GDExtensionConstStringNamePtr p_getter) _classdb_register_extension_class_property;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        const(GDExtensionPropertyInfo)* p_info,
        GDExtensionConstStringNamePtr p_setter,
        GDExtensionConstStringNamePtr p_getter,
        GDExtensionInt p_index) _classdb_register_extension_class_property_indexed;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringPtr p_group_name,
        GDExtensionConstStringPtr p_prefix) _classdb_register_extension_class_property_group;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringPtr p_subgroup_name,
        GDExtensionConstStringPtr p_prefix) _classdb_register_extension_class_property_subgroup;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name,
        GDExtensionConstStringNamePtr p_signal_name,
        const(GDExtensionPropertyInfo)* p_argument_info,
        GDExtensionInt p_argument_count) _classdb_register_extension_class_signal;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionConstStringNamePtr p_class_name) _classdb_unregister_extension_class;

    @(GodotFunctionName)
    void function(
        GDExtensionClassLibraryPtr p_library,
        GDExtensionUninitializedStringPtr r_path) _get_library_path;

    @(GodotFunctionName)
    void function(GDExtensionConstStringNamePtr p_class_name) _editor_add_plugin;

    @(GodotFunctionName)
    void function(GDExtensionConstStringNamePtr p_class_name) _editor_remove_plugin;
}
