module godot_wrapper.gdextension_interface.functions;

import godot_wrapper.gdextension_interface.types;
import core.stdc.stddef : wchar_t;
import std.stdint : int32_t,
    int64_t,
    uint8_t,
    uint32_t,
    uint64_t;

@nogc nothrow pragma(inline):

/* GODOT CORE */

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
    GDExtensionVariantPtr r_return, GDExtensionBool* r_valid)
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
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid)
{
    _variant_get_named(p_self, p_key, r_ret, r_valid);
}

void variant_get_keyed(
    GDExtensionConstVariantPtr p_self,
    GDExtensionConstVariantPtr p_key,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid)
{
    _variant_get_keyed(p_self, p_key, r_ret, r_valid);
}

void variant_get_indexed(
    GDExtensionConstVariantPtr p_self,
    GDExtensionInt p_index,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid,
    GDExtensionBool* r_oob)
{
    _variant_get_indexed(p_self, p_index, r_ret, r_valid, r_oob);
}

GDExtensionBool variant_iter_init(
    GDExtensionConstVariantPtr p_self,
    GDExtensionVariantPtr r_iter,
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
    GDExtensionVariantPtr r_ret,
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

void variant_get_type_name(GDExtensionVariantType p_type, GDExtensionStringPtr r_name)
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
    GDExtensionVariantPtr p_base,
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
    GDExtensionVariantPtr r_ret)
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

void string_new_with_utf16_chars(GDExtensionStringPtr r_dest, const(char16_t)* p_contents)
{
    _string_new_with_utf16_chars(r_dest, p_contents);
}

void string_new_with_utf32_chars(GDExtensionStringPtr r_dest, const(char32_t)* p_contents)
{
    _string_new_with_utf32_chars(r_dest, p_contents);
}

void string_new_with_wide_chars(GDExtensionStringPtr r_dest, const(wchar_t)* p_contents)
{
    _string_new_with_wide_chars(r_dest, p_contents);
}

void string_new_with_latin1_chars_and_len(GDExtensionStringPtr r_dest, const(char)* p_contents, GDExtensionInt p_size)
{
    _string_new_with_latin1_chars_and_len(r_dest, p_contents, p_size);
}

void string_new_with_utf8_chars_and_len(GDExtensionStringPtr r_dest, const(char)* p_contents, GDExtensionInt p_size)
{
    _string_new_with_utf8_chars_and_len(r_dest, p_contents, p_size);
}

void string_new_with_utf16_chars_and_len(
    GDExtensionStringPtr r_dest,
    const(char16_t)* p_contents,
    GDExtensionInt p_size)
{
    _string_new_with_utf16_chars_and_len(r_dest, p_contents, p_size);
}

void string_new_with_utf32_chars_and_len(
    GDExtensionStringPtr r_dest,
    const(char32_t)* p_contents,
    GDExtensionInt p_size)
{
    _string_new_with_utf32_chars_and_len(r_dest, p_contents, p_size);
}

void string_new_with_wide_chars_and_len(GDExtensionStringPtr r_dest, const(wchar_t)* p_contents, GDExtensionInt p_size)
{
    _string_new_with_wide_chars_and_len(r_dest, p_contents, p_size);
}

GDExtensionInt string_to_latin1_chars(GDExtensionConstStringPtr p_self, char* r_text, GDExtensionInt p_max_write_length)
{
    return _string_to_latin1_chars(p_self, r_text, p_max_write_length);
}

GDExtensionInt string_to_utf8_chars(GDExtensionConstStringPtr p_self, char* r_text, GDExtensionInt p_max_write_length)
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

const(char32_t)* string_operator_index_const(GDExtensionConstStringPtr p_self, GDExtensionInt p_index)
{
    return _string_operator_index_const(p_self, p_index);
}

void string_operator_plus_eq_string(GDExtensionStringPtr p_self, GDExtensionConstStringPtr p_b)
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
    void function(void*, uint32_t) p_func,
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
    void function(void*) p_func,
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

GDExtensionStringPtr packed_string_array_operator_index_const(GDExtensionConstTypePtr p_self, GDExtensionInt p_index)
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

GDExtensionScriptInstancePtr script_instance_create(
    const(GDExtensionScriptInstanceInfo)* p_info,
    GDExtensionScriptInstanceDataPtr p_instance_data)
{
    return _script_instance_create(p_info, p_instance_data);
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

/* Provided parameters for `classdb_register_extension_*` can be safely freed once the function returns. */
void classdb_register_extension_class(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    GDExtensionConstStringNamePtr p_parent_class_name,
    const(GDExtensionClassCreationInfo)* p_extension_funcs)
{
    _classdb_register_extension_class(p_library, p_class_name, p_parent_class_name, p_extension_funcs);
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
    _classdb_register_extension_class_signal(p_library, p_class_name, p_signal_name, p_argument_info, p_argument_count);
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

private:

/* GODOT CORE */

__gshared void* function(size_t p_bytes) _mem_alloc;
__gshared void* function(void* p_ptr, size_t p_bytes) _mem_realloc;
__gshared void function(void* p_ptr) _mem_free;

__gshared void function(
    const(char)* p_description,
    const(char)* p_function,
    const(char)* p_file,
    int32_t p_line,
    GDExtensionBool p_editor_notify) _print_error;
__gshared void function(
    const(char)* p_description,
    const(char)* p_message,
    const(char)* p_function,
    const(char)* p_file,
    int32_t p_line,
    GDExtensionBool p_editor_notify) _print_error_with_message;
__gshared void function(
    const(char)* p_description,
    const(char)* p_function,
    const(char)* p_file,
    int32_t p_line,
    GDExtensionBool p_editor_notify) _print_warning;
__gshared void function(
    const(char)* p_description,
    const(char)* p_message,
    const(char)* p_function,
    const(char)* p_file,
    int32_t p_line,
    GDExtensionBool p_editor_notify) _print_warning_with_message;
__gshared void function(
    const(char)* p_description,
    const(char)* p_function,
    const(char)* p_file,
    int32_t p_line,
    GDExtensionBool p_editor_notify) _print_script_error;
__gshared void function(
    const(char)* p_description,
    const(char)* p_message,
    const(char)* p_function,
    const(char)* p_file,
    int32_t p_line,
    GDExtensionBool p_editor_notify) _print_script_error_with_message;

__gshared uint64_t function(GDExtensionConstStringNamePtr p_name) _get_native_struct_size;

/* GODOT VARIANT */

/* variant general */
__gshared void function(GDExtensionVariantPtr r_dest, GDExtensionConstVariantPtr p_src) _variant_new_copy;
__gshared void function(GDExtensionVariantPtr r_dest) _variant_new_nil;
__gshared void function(GDExtensionVariantPtr p_self) _variant_destroy;

/* variant type */
__gshared void function(
    GDExtensionVariantPtr p_self,
    GDExtensionConstStringNamePtr p_method,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionInt p_argument_count,
    GDExtensionVariantPtr r_return,
    GDExtensionCallError* r_error) _variant_call;
__gshared void function(
    GDExtensionVariantType p_type,
    GDExtensionConstStringNamePtr p_method,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionInt p_argument_count,
    GDExtensionVariantPtr r_return,
    GDExtensionCallError* r_error) _variant_call_static;
__gshared void function(
    GDExtensionVariantOperator p_op,
    GDExtensionConstVariantPtr p_a,
    GDExtensionConstVariantPtr p_b,
    GDExtensionVariantPtr r_return,
    GDExtensionBool* r_valid) _variant_evaluate;
__gshared void function(
    GDExtensionVariantPtr p_self,
    GDExtensionConstVariantPtr p_key,
    GDExtensionConstVariantPtr p_value,
    GDExtensionBool* r_valid) _variant_set;
__gshared void function(
    GDExtensionVariantPtr p_self,
    GDExtensionConstStringNamePtr p_key,
    GDExtensionConstVariantPtr p_value,
    GDExtensionBool* r_valid) _variant_set_named;
__gshared void function(
    GDExtensionVariantPtr p_self,
    GDExtensionConstVariantPtr p_key,
    GDExtensionConstVariantPtr p_value,
    GDExtensionBool* r_valid) _variant_set_keyed;
__gshared void function(
    GDExtensionVariantPtr p_self,
    GDExtensionInt p_index,
    GDExtensionConstVariantPtr p_value,
    GDExtensionBool* r_valid,
    GDExtensionBool* r_oob) _variant_set_indexed;
__gshared void function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionConstVariantPtr p_key,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid) _variant_get;
__gshared void function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionConstStringNamePtr p_key,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid) _variant_get_named;
__gshared void function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionConstVariantPtr p_key,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid) _variant_get_keyed;
__gshared void function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionInt p_index,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid,
    GDExtensionBool* r_oob) _variant_get_indexed;
__gshared GDExtensionBool function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionVariantPtr r_iter,
    GDExtensionBool* r_valid) _variant_iter_init;
__gshared GDExtensionBool function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionVariantPtr r_iter,
    GDExtensionBool* r_valid) _variant_iter_next;
__gshared void function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionVariantPtr r_iter,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool* r_valid) _variant_iter_get;
__gshared GDExtensionInt function(
    GDExtensionConstVariantPtr p_self) _variant_hash;
__gshared GDExtensionInt function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionInt p_recursion_count) _variant_recursive_hash;
__gshared GDExtensionBool function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionConstVariantPtr p_other) _variant_hash_compare;
__gshared GDExtensionBool function(
    GDExtensionConstVariantPtr p_self) _variant_booleanize;
__gshared void function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionVariantPtr r_ret,
    GDExtensionBool p_deep) _variant_duplicate;
__gshared void function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionStringPtr r_ret) _variant_stringify;

__gshared GDExtensionVariantType function(
    GDExtensionConstVariantPtr p_self) _variant_get_type;
__gshared GDExtensionBool function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionConstStringNamePtr p_method) _variant_has_method;
__gshared GDExtensionBool function(
    GDExtensionVariantType p_type,
    GDExtensionConstStringNamePtr p_member) _variant_has_member;
__gshared GDExtensionBool function(
    GDExtensionConstVariantPtr p_self,
    GDExtensionConstVariantPtr p_key,
    GDExtensionBool* r_valid) _variant_has_key;
__gshared void function(
    GDExtensionVariantType p_type,
    GDExtensionStringPtr r_name) _variant_get_type_name;
__gshared GDExtensionBool function(
    GDExtensionVariantType p_from,
    GDExtensionVariantType p_to) _variant_can_convert;
__gshared GDExtensionBool function(
    GDExtensionVariantType p_from,
    GDExtensionVariantType p_to) _variant_can_convert_strict;

/* ptrcalls */
__gshared GDExtensionVariantFromTypeConstructorFunc function(
    GDExtensionVariantType p_type) _get_variant_from_type_constructor;
__gshared GDExtensionTypeFromVariantConstructorFunc function(
    GDExtensionVariantType p_type) _get_variant_to_type_constructor;
__gshared GDExtensionPtrOperatorEvaluator function(
    GDExtensionVariantOperator p_operator,
    GDExtensionVariantType p_type_a,
    GDExtensionVariantType p_type_b) _variant_get_ptr_operator_evaluator;
__gshared GDExtensionPtrBuiltInMethod function(
    GDExtensionVariantType p_type,
    GDExtensionConstStringNamePtr p_method,
    GDExtensionInt p_hash) _variant_get_ptr_builtin_method;
__gshared GDExtensionPtrConstructor function(
    GDExtensionVariantType p_type,
    int32_t p_constructor) _variant_get_ptr_constructor;
__gshared GDExtensionPtrDestructor function(
    GDExtensionVariantType p_type) _variant_get_ptr_destructor;
__gshared void function(
    GDExtensionVariantType p_type,
    GDExtensionVariantPtr p_base,
    const GDExtensionConstVariantPtr* p_args,
    int32_t p_argument_count,
    GDExtensionCallError* r_error) _variant_construct;
__gshared GDExtensionPtrSetter function(
    GDExtensionVariantType p_type,
    GDExtensionConstStringNamePtr p_member) _variant_get_ptr_setter;
__gshared GDExtensionPtrGetter function(
    GDExtensionVariantType p_type,
    GDExtensionConstStringNamePtr p_member) _variant_get_ptr_getter;
__gshared GDExtensionPtrIndexedSetter function(
    GDExtensionVariantType p_type) _variant_get_ptr_indexed_setter;
__gshared GDExtensionPtrIndexedGetter function(
    GDExtensionVariantType p_type) _variant_get_ptr_indexed_getter;
__gshared GDExtensionPtrKeyedSetter function(
    GDExtensionVariantType p_type) _variant_get_ptr_keyed_setter;
__gshared GDExtensionPtrKeyedGetter function(
    GDExtensionVariantType p_type) _variant_get_ptr_keyed_getter;
__gshared GDExtensionPtrKeyedChecker function(
    GDExtensionVariantType p_type) _variant_get_ptr_keyed_checker;
__gshared void function(
    GDExtensionVariantType p_type,
    GDExtensionConstStringNamePtr p_constant,
    GDExtensionVariantPtr r_ret) _variant_get_constant_value;
__gshared GDExtensionPtrUtilityFunction function(
    GDExtensionConstStringNamePtr p_function,
    GDExtensionInt p_hash) _variant_get_ptr_utility_function;

/*  extra utilities */
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char)* p_contents) _string_new_with_latin1_chars;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char)* p_contents) _string_new_with_utf8_chars;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char16_t)* p_contents) _string_new_with_utf16_chars;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char32_t)* p_contents) _string_new_with_utf32_chars;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(wchar_t)* p_contents) _string_new_with_wide_chars;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char)* p_contents,
    GDExtensionInt p_size) _string_new_with_latin1_chars_and_len;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char)* p_contents,
    GDExtensionInt p_size) _string_new_with_utf8_chars_and_len;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char16_t)* p_contents,
    GDExtensionInt p_size) _string_new_with_utf16_chars_and_len;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(char32_t)* p_contents,
    GDExtensionInt p_size) _string_new_with_utf32_chars_and_len;
__gshared void function(
    GDExtensionStringPtr r_dest,
    const(wchar_t)* p_contents,
    GDExtensionInt p_size) _string_new_with_wide_chars_and_len;
__gshared GDExtensionInt function(
    GDExtensionConstStringPtr p_self,
    char* r_text,
    GDExtensionInt p_max_write_length) _string_to_latin1_chars;
__gshared GDExtensionInt function(
    GDExtensionConstStringPtr p_self,
    char* r_text,
    GDExtensionInt p_max_write_length) _string_to_utf8_chars;
__gshared GDExtensionInt function(
    GDExtensionConstStringPtr p_self,
    char16_t* r_text,
    GDExtensionInt p_max_write_length) _string_to_utf16_chars;
__gshared GDExtensionInt function(
    GDExtensionConstStringPtr p_self,
    char32_t* r_text,
    GDExtensionInt p_max_write_length) _string_to_utf32_chars;
__gshared GDExtensionInt function(
    GDExtensionConstStringPtr p_self,
    wchar_t* r_text,
    GDExtensionInt p_max_write_length) _string_to_wide_chars;
__gshared char32_t* function(
    GDExtensionStringPtr p_self,
    GDExtensionInt p_index) _string_operator_index;
__gshared const char32_t* function(
    GDExtensionConstStringPtr p_self,
    GDExtensionInt p_index) _string_operator_index_const;

__gshared void function(GDExtensionStringPtr p_self, GDExtensionConstStringPtr p_b) _string_operator_plus_eq_string;
__gshared void function(GDExtensionStringPtr p_self, char32_t p_b) _string_operator_plus_eq_char;
__gshared void function(GDExtensionStringPtr p_self, const(char)* p_b) _string_operator_plus_eq_cstr;
__gshared void function(GDExtensionStringPtr p_self, const(wchar_t)* p_b) _string_operator_plus_eq_wcstr;
__gshared void function(GDExtensionStringPtr p_self, const(char32_t)* p_b) _string_operator_plus_eq_c32str;

/*  XMLParser extra utilities */

__gshared GDExtensionInt function(
    GDExtensionObjectPtr p_instance,
    const(uint8_t)* p_buffer,
    size_t p_size) _xml_parser_open_buffer;

/*  FileAccess extra utilities */

__gshared void function(
    GDExtensionObjectPtr p_instance,
    const(uint8_t)* p_src,
    uint64_t p_length) _file_access_store_buffer;
__gshared uint64_t function(
    GDExtensionConstObjectPtr p_instance,
    uint8_t* p_dst,
    uint64_t p_length) _file_access_get_buffer;

/*  WorkerThreadPool extra utilities */

__gshared int64_t function(
    GDExtensionObjectPtr p_instance,
    void function(void*, uint32_t) p_func,
    void* p_userdata,
    int p_elements,
    int p_tasks,
    GDExtensionBool p_high_priority,
    GDExtensionConstStringPtr p_description) _worker_thread_pool_add_native_group_task;
__gshared int64_t function(
    GDExtensionObjectPtr p_instance,
    void function(void*) p_func,
    void* p_userdata,
    GDExtensionBool p_high_priority,
    GDExtensionConstStringPtr p_description) _worker_thread_pool_add_native_task;

/* Packed array functions */

__gshared uint8_t* function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_byte_array_operator_index;
__gshared const(uint8_t)* function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_byte_array_operator_index_const;

__gshared GDExtensionTypePtr function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_color_array_operator_index;
__gshared GDExtensionTypePtr function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_color_array_operator_index_const;

__gshared float* function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_float32_array_operator_index;
__gshared const(float)* function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_float32_array_operator_index_const;
__gshared double* function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_float64_array_operator_index;
__gshared const(double)* function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_float64_array_operator_index_const;

__gshared int32_t* function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_int32_array_operator_index;
__gshared const(int32_t)* function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_int32_array_operator_index_const;
__gshared int64_t* function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_int64_array_operator_index;
__gshared const(int64_t)* function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_int64_array_operator_index_const;

__gshared GDExtensionStringPtr function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_string_array_operator_index;
__gshared GDExtensionStringPtr function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_string_array_operator_index_const;

__gshared GDExtensionTypePtr function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_vector2_array_operator_index;
__gshared GDExtensionTypePtr function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_vector2_array_operator_index_const;
__gshared GDExtensionTypePtr function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _packed_vector3_array_operator_index;
__gshared GDExtensionTypePtr function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _packed_vector3_array_operator_index_const;

__gshared GDExtensionVariantPtr function(
    GDExtensionTypePtr p_self,
    GDExtensionInt p_index) _array_operator_index;
__gshared GDExtensionVariantPtr function(
    GDExtensionConstTypePtr p_self,
    GDExtensionInt p_index) _array_operator_index_const;
__gshared void function(
    GDExtensionTypePtr p_self,
    GDExtensionConstTypePtr p_from) _array_ref;
__gshared void function(
    GDExtensionTypePtr p_self,
    GDExtensionVariantType p_type,
    GDExtensionConstStringNamePtr p_class_name,
    GDExtensionConstVariantPtr p_script) _array_set_typed;

/* Dictionary functions */

__gshared GDExtensionVariantPtr function(
    GDExtensionTypePtr p_self,
    GDExtensionConstVariantPtr p_key) _dictionary_operator_index;
__gshared GDExtensionVariantPtr function(
    GDExtensionConstTypePtr p_self,
    GDExtensionConstVariantPtr p_key) _dictionary_operator_index_const;

/* OBJECT */

__gshared void function(
    GDExtensionMethodBindPtr p_method_bind,
    GDExtensionObjectPtr p_instance,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionInt p_arg_count,
    GDExtensionVariantPtr r_ret,
    GDExtensionCallError* r_error) _object_method_bind_call;
__gshared void function(
    GDExtensionMethodBindPtr p_method_bind,
    GDExtensionObjectPtr p_instance,
    const(GDExtensionConstTypePtr)* p_args,
    GDExtensionTypePtr r_ret) _object_method_bind_ptrcall;
__gshared void function(GDExtensionObjectPtr p_o) _object_destroy;
__gshared GDExtensionObjectPtr function(GDExtensionConstStringNamePtr p_name) _global_get_singleton;

__gshared void* function(
    GDExtensionObjectPtr p_o,
    void* p_token,
    const(GDExtensionInstanceBindingCallbacks)* p_callbacks) _object_get_instance_binding;
__gshared void function(
    GDExtensionObjectPtr p_o,
    void* p_token,
    void* p_binding,
    const(GDExtensionInstanceBindingCallbacks)* p_callbacks) _object_set_instance_binding;

__gshared void function(
    GDExtensionObjectPtr p_o,
    GDExtensionConstStringNamePtr p_classname,
    GDExtensionClassInstancePtr p_instance) _object_set_instance;

__gshared GDExtensionObjectPtr function(GDExtensionConstObjectPtr p_object, void* p_class_tag) _object_cast_to;
__gshared GDExtensionObjectPtr function(GDObjectInstanceID p_instance_id) _object_get_instance_from_id;
__gshared GDObjectInstanceID function(GDExtensionConstObjectPtr p_object) _object_get_instance_id;

/* REFERENCE */

__gshared GDExtensionObjectPtr function(GDExtensionConstRefPtr p_ref) _ref_get_object;
__gshared void function(GDExtensionRefPtr p_ref, GDExtensionObjectPtr p_object) _ref_set_object;

/* SCRIPT INSTANCE */

__gshared GDExtensionScriptInstancePtr function(
    const(GDExtensionScriptInstanceInfo)* p_info,
    GDExtensionScriptInstanceDataPtr p_instance_data) _script_instance_create;

/* CLASSDB */

__gshared GDExtensionObjectPtr function(GDExtensionConstStringNamePtr p_classname) _classdb_construct_object;
__gshared GDExtensionMethodBindPtr function(
    GDExtensionConstStringNamePtr p_classname,
    GDExtensionConstStringNamePtr p_methodname,
    GDExtensionInt p_hash) _classdb_get_method_bind;
__gshared void* function(GDExtensionConstStringNamePtr p_classname) _classdb_get_class_tag;

/* CLASSDB EXTENSION */

__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    GDExtensionConstStringNamePtr p_parent_class_name,
    const(GDExtensionClassCreationInfo)* p_extension_funcs) _classdb_register_extension_class;
__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    const(GDExtensionClassMethodInfo)* p_method_info) _classdb_register_extension_class_method;
__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    GDExtensionConstStringNamePtr p_enum_name,
    GDExtensionConstStringNamePtr p_constant_name,
    GDExtensionInt p_constant_value,
    GDExtensionBool p_is_bitfield) _classdb_register_extension_class_integer_constant;
__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    const(GDExtensionPropertyInfo)* p_info,
    GDExtensionConstStringNamePtr p_setter,
    GDExtensionConstStringNamePtr p_getter) _classdb_register_extension_class_property;
__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    GDExtensionConstStringPtr p_group_name,
    GDExtensionConstStringPtr p_prefix) _classdb_register_extension_class_property_group;
__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    GDExtensionConstStringPtr p_subgroup_name,
    GDExtensionConstStringPtr p_prefix) _classdb_register_extension_class_property_subgroup;
__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name,
    GDExtensionConstStringNamePtr p_signal_name,
    const(GDExtensionPropertyInfo)* p_argument_info,
    GDExtensionInt p_argument_count) _classdb_register_extension_class_signal;
__gshared void function(
    GDExtensionClassLibraryPtr p_library,
    GDExtensionConstStringNamePtr p_class_name) _classdb_unregister_extension_class;
__gshared void function(GDExtensionClassLibraryPtr p_library, GDExtensionStringPtr r_path) _get_library_path;
