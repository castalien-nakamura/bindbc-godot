/**
BindBC Godot Extension Interface.
*/
module godot_wrapper.gdextension_interface.types;

import core.stdc.stddef : wchar_t;
import std.stdint : int32_t,
    int64_t,
    uint8_t,
    uint32_t,
    uint64_t;

extern(C) nothrow:

alias char32_t = dchar;
alias char16_t = wchar;

/* VARIANT TYPES */

alias GDExtensionVariantType = int;
enum : GDExtensionVariantType
{
    GDEXTENSION_VARIANT_TYPE_NIL,

    /*  atomic types */
    GDEXTENSION_VARIANT_TYPE_BOOL,
    GDEXTENSION_VARIANT_TYPE_INT,
    GDEXTENSION_VARIANT_TYPE_FLOAT,
    GDEXTENSION_VARIANT_TYPE_STRING,

    /* math types */
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

    /* misc types */
    GDEXTENSION_VARIANT_TYPE_COLOR,
    GDEXTENSION_VARIANT_TYPE_STRING_NAME,
    GDEXTENSION_VARIANT_TYPE_NODE_PATH,
    GDEXTENSION_VARIANT_TYPE_RID,
    GDEXTENSION_VARIANT_TYPE_OBJECT,
    GDEXTENSION_VARIANT_TYPE_CALLABLE,
    GDEXTENSION_VARIANT_TYPE_SIGNAL,
    GDEXTENSION_VARIANT_TYPE_DICTIONARY,
    GDEXTENSION_VARIANT_TYPE_ARRAY,

    /* typed arrays */
    GDEXTENSION_VARIANT_TYPE_PACKED_BYTE_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_INT32_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_INT64_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT32_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT64_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR2_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR3_ARRAY,
    GDEXTENSION_VARIANT_TYPE_PACKED_COLOR_ARRAY,

    GDEXTENSION_VARIANT_TYPE_VARIANT_MAX
}

alias GDExtensionVariantOperator = int;
enum : GDExtensionVariantOperator
{
    /* comparison */
    GDEXTENSION_VARIANT_OP_EQUAL,
    GDEXTENSION_VARIANT_OP_NOT_EQUAL,
    GDEXTENSION_VARIANT_OP_LESS,
    GDEXTENSION_VARIANT_OP_LESS_EQUAL,
    GDEXTENSION_VARIANT_OP_GREATER,
    GDEXTENSION_VARIANT_OP_GREATER_EQUAL,

    /* mathematic */
    GDEXTENSION_VARIANT_OP_ADD,
    GDEXTENSION_VARIANT_OP_SUBTRACT,
    GDEXTENSION_VARIANT_OP_MULTIPLY,
    GDEXTENSION_VARIANT_OP_DIVIDE,
    GDEXTENSION_VARIANT_OP_NEGATE,
    GDEXTENSION_VARIANT_OP_POSITIVE,
    GDEXTENSION_VARIANT_OP_MODULE,
    GDEXTENSION_VARIANT_OP_POWER,

    /* bitwise */
    GDEXTENSION_VARIANT_OP_SHIFT_LEFT,
    GDEXTENSION_VARIANT_OP_SHIFT_RIGHT,
    GDEXTENSION_VARIANT_OP_BIT_AND,
    GDEXTENSION_VARIANT_OP_BIT_OR,
    GDEXTENSION_VARIANT_OP_BIT_XOR,
    GDEXTENSION_VARIANT_OP_BIT_NEGATE,

    /* logic */
    GDEXTENSION_VARIANT_OP_AND,
    GDEXTENSION_VARIANT_OP_OR,
    GDEXTENSION_VARIANT_OP_XOR,
    GDEXTENSION_VARIANT_OP_NOT,

    /* containment */
    GDEXTENSION_VARIANT_OP_IN,
    GDEXTENSION_VARIANT_OP_MAX

}

alias GDExtensionVariantPtr = void*;
alias GDExtensionConstVariantPtr = const(void)*;
alias GDExtensionUninitializedVariantPtr = void*;
alias GDExtensionStringNamePtr = void*;
alias GDExtensionConstStringNamePtr = const(void)*;
alias GDExtensionUninitializedStringNamePtr = void*;
alias GDExtensionStringPtr = void*;
alias GDExtensionConstStringPtr = const(void)*;
alias GDExtensionUninitializedStringPtr = void*;
alias GDExtensionObjectPtr = void*;
alias GDExtensionConstObjectPtr = const(void)*;
alias GDExtensionUninitializedObjectPtr = void*;
alias GDExtensionTypePtr = void*;
alias GDExtensionConstTypePtr = const(void)*;
alias GDExtensionUninitializedTypePtr = void*;
alias GDExtensionMethodBindPtr = const(void)*;
alias GDExtensionInt = int64_t;
alias GDExtensionBool = uint8_t;
alias GDObjectInstanceID = uint64_t;
alias GDExtensionRefPtr = void*;
alias GDExtensionConstRefPtr = const(void)*;

/* VARIANT DATA I/O */

alias GDExtensionCallErrorType = int;
enum : GDExtensionCallErrorType
{
    GDEXTENSION_CALL_OK,
    GDEXTENSION_CALL_ERROR_INVALID_METHOD,
    GDEXTENSION_CALL_ERROR_INVALID_ARGUMENT, // Expected a different variant type.
    GDEXTENSION_CALL_ERROR_TOO_MANY_ARGUMENTS, // Expected lower number of arguments.
    GDEXTENSION_CALL_ERROR_TOO_FEW_ARGUMENTS, // Expected higher number of arguments.
    GDEXTENSION_CALL_ERROR_INSTANCE_IS_NULL,
    GDEXTENSION_CALL_ERROR_METHOD_NOT_CONST, // Used for const call.
}

struct GDExtensionCallError
{
    GDExtensionCallErrorType error;
    int32_t argument;
    int32_t expected;
}

alias GDExtensionVariantFromTypeConstructorFunc = void function(
    GDExtensionUninitializedVariantPtr, GDExtensionTypePtr);
alias GDExtensionTypeFromVariantConstructorFunc = void function(
    GDExtensionUninitializedTypePtr, GDExtensionVariantPtr);
alias GDExtensionPtrOperatorEvaluator = void function(
    GDExtensionConstTypePtr p_left, GDExtensionConstTypePtr p_right, GDExtensionTypePtr r_result);
alias GDExtensionPtrBuiltInMethod = void function(
    GDExtensionTypePtr p_base,
    const(GDExtensionConstTypePtr)* p_args,
    GDExtensionTypePtr r_return,
    int p_argument_count);
alias GDExtensionPtrConstructor = void function(
    GDExtensionUninitializedTypePtr p_base, const(GDExtensionConstTypePtr)* p_args);
alias GDExtensionPtrDestructor = void function(GDExtensionTypePtr p_base);
alias GDExtensionPtrSetter = void function(GDExtensionTypePtr p_base, GDExtensionConstTypePtr p_value);
alias GDExtensionPtrGetter = void function(GDExtensionConstTypePtr p_base, GDExtensionTypePtr r_value);
alias GDExtensionPtrIndexedSetter = void function(
    GDExtensionTypePtr p_base, GDExtensionInt p_index, GDExtensionConstTypePtr p_value);
alias GDExtensionPtrIndexedGetter = void function(
    GDExtensionConstTypePtr p_base, GDExtensionInt p_index, GDExtensionTypePtr r_value);
alias GDExtensionPtrKeyedSetter = void function(
    GDExtensionTypePtr p_base, GDExtensionConstTypePtr p_key, GDExtensionConstTypePtr p_value);
alias GDExtensionPtrKeyedGetter = void function(
    GDExtensionConstTypePtr p_base, GDExtensionConstTypePtr p_key, GDExtensionTypePtr r_value);
alias GDExtensionPtrKeyedChecker = uint32_t function(
    GDExtensionConstVariantPtr p_base, GDExtensionConstVariantPtr p_key);
alias GDExtensionPtrUtilityFunction = void function(
    GDExtensionTypePtr r_return, const(GDExtensionConstTypePtr)* p_args, int p_argument_count);

alias GDExtensionClassConstructor = GDExtensionObjectPtr function();

alias GDExtensionInstanceBindingCreateCallback = void* function(void* p_token, void* p_instance);
alias GDExtensionInstanceBindingFreeCallback = void function(void* p_token, void* p_instance, void* p_binding);
alias GDExtensionInstanceBindingReferenceCallback = GDExtensionBool function(
    void* p_token, void* p_binding, GDExtensionBool p_reference);

struct GDExtensionInstanceBindingCallbacks
{
    GDExtensionInstanceBindingCreateCallback create_callback;
    GDExtensionInstanceBindingFreeCallback free_callback;
    GDExtensionInstanceBindingReferenceCallback reference_callback;
}

alias GDExtensionClassInstancePtr = void*;

alias GDExtensionClassSet = GDExtensionBool function(
    GDExtensionClassInstancePtr p_instance,
    GDExtensionConstStringNamePtr p_name,
    GDExtensionConstVariantPtr p_value);
alias GDExtensionClassGet = GDExtensionBool function(
    GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret);
alias GDExtensionClassGetRID = uint64_t function(GDExtensionClassInstancePtr p_instance);

struct GDExtensionPropertyInfo
{
    GDExtensionVariantType type;
    GDExtensionStringNamePtr name;
    GDExtensionStringNamePtr class_name;
    uint32_t hint; // Bitfield of `PropertyHint` (defined in `extension_api.json`).
    GDExtensionStringPtr hint_string;
    uint32_t usage; // Bitfield of `PropertyUsageFlags` (defined in `extension_api.json`).
}

struct GDExtensionMethodInfo
{
    GDExtensionStringNamePtr name;
    GDExtensionPropertyInfo return_value;
    uint32_t flags; // Bitfield of `GDExtensionClassMethodFlags`.
    int32_t id;

    /* Arguments: `default_arguments` is an array of size `argument_count`. */
    uint32_t argument_count;
    GDExtensionPropertyInfo* arguments;

    /* Default arguments: `default_arguments` is an array of size `default_argument_count`. */
    uint32_t default_argument_count;
    GDExtensionVariantPtr* default_arguments;
}

alias GDExtensionClassGetPropertyList = const(GDExtensionPropertyInfo)* function(
    GDExtensionClassInstancePtr p_instance, uint32_t* r_count);
alias GDExtensionClassFreePropertyList = void function(
    GDExtensionClassInstancePtr p_instance, const(GDExtensionPropertyInfo)* p_list);
alias GDExtensionClassPropertyCanRevert = GDExtensionBool function(
    GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name);
alias GDExtensionClassPropertyGetRevert = GDExtensionBool function(
    GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret);
alias GDExtensionClassValidateProperty = GDExtensionBool function(
    GDExtensionClassInstancePtr p_instance, GDExtensionPropertyInfo* p_property);

deprecated alias GDExtensionClassNotification = void function(
    GDExtensionClassInstancePtr p_instance, int32_t p_what);
alias GDExtensionClassNotification2 = void function(
    GDExtensionClassInstancePtr p_instance, int32_t p_what, GDExtensionBool p_reversed);
alias GDExtensionClassToString = void function(
    GDExtensionClassInstancePtr p_instance, GDExtensionBool* r_is_valid, GDExtensionStringPtr p_out);
alias GDExtensionClassReference = void function(GDExtensionClassInstancePtr p_instance);
alias GDExtensionClassUnreference = void function(GDExtensionClassInstancePtr p_instance);
alias GDExtensionClassCallVirtual = void function(
    GDExtensionClassInstancePtr p_instance,
    const(GDExtensionConstTypePtr)* p_args,
    GDExtensionTypePtr r_ret);
alias GDExtensionClassCreateInstance = GDExtensionObjectPtr function(void* p_class_userdata);
alias GDExtensionClassFreeInstance = void function(
    void* p_class_userdata, GDExtensionClassInstancePtr p_instance);
alias GDExtensionClassRecreateInstance = GDExtensionClassInstancePtr function(
    void *p_class_userdata, GDExtensionObjectPtr p_object);
alias GDExtensionClassGetVirtual = GDExtensionClassCallVirtual function(
    void* p_class_userdata, GDExtensionConstStringNamePtr p_name);
alias GDExtensionClassGetVirtualCallData = void function(
    void* p_class_userdata, GDExtensionConstStringNamePtr p_name);
alias GDExtensionClassCallVirtualWithData = void function(
    GDExtensionClassInstancePtr p_instance,
    GDExtensionConstStringNamePtr p_name,
    void* p_virtual_call_userdata,
    const(GDExtensionConstTypePtr)* p_args,
    GDExtensionTypePtr r_ret);

deprecated struct GDExtensionClassCreationInfo
{
    GDExtensionBool is_virtual;
    GDExtensionBool is_abstract;
    GDExtensionClassSet set_func;
    GDExtensionClassGet get_func;
    GDExtensionClassGetPropertyList get_property_list_func;
    GDExtensionClassFreePropertyList free_property_list_func;
    GDExtensionClassPropertyCanRevert property_can_revert_func;
    GDExtensionClassPropertyGetRevert property_get_revert_func;
    GDExtensionClassNotification notification_func;
    GDExtensionClassToString to_string_func;
    GDExtensionClassReference reference_func;
    GDExtensionClassUnreference unreference_func;
    GDExtensionClassCreateInstance create_instance_func; // (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
    GDExtensionClassFreeInstance free_instance_func; // Destructor; mandatory.
    GDExtensionClassGetVirtual get_virtual_func; // Queries a virtual function by name and returns a callback to invoke the requested virtual function.
    GDExtensionClassGetRID get_rid_func;
    void* class_userdata; // Per-class user data, later accessible in instance bindings.
}

struct GDExtensionClassCreationInfo2
{
	GDExtensionBool is_virtual;
	GDExtensionBool is_abstract;
	GDExtensionBool is_exposed;
	GDExtensionClassSet set_func;
	GDExtensionClassGet get_func;
	GDExtensionClassGetPropertyList get_property_list_func;
	GDExtensionClassFreePropertyList free_property_list_func;
	GDExtensionClassPropertyCanRevert property_can_revert_func;
	GDExtensionClassPropertyGetRevert property_get_revert_func;
	GDExtensionClassValidateProperty validate_property_func;
	GDExtensionClassNotification2 notification_func;
	GDExtensionClassToString to_string_func;
	GDExtensionClassReference reference_func;
	GDExtensionClassUnreference unreference_func;
	GDExtensionClassCreateInstance create_instance_func; // (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
	GDExtensionClassFreeInstance free_instance_func; // Destructor; mandatory.
	GDExtensionClassRecreateInstance recreate_instance_func;
	// Queries a virtual function by name and returns a callback to invoke the requested virtual function.
	GDExtensionClassGetVirtual get_virtual_func;
	// Paired with `call_virtual_with_data_func`, this is an alternative to `get_virtual_func` for extensions that
	// need or benefit from extra data when calling virtual functions.
	// Returns user data that will be passed to `call_virtual_with_data_func`.
	// Returning `NULL` from this function signals to Godot that the virtual function is not overridden.
	// Data returned from this function should be managed by the extension and must be valid until the extension is deinitialized.
	// You should supply either `get_virtual_func`, or `get_virtual_call_data_func` with `call_virtual_with_data_func`.
	GDExtensionClassGetVirtualCallData get_virtual_call_data_func;
	// Used to call virtual functions when `get_virtual_call_data_func` is not null.
	GDExtensionClassCallVirtualWithData call_virtual_with_data_func;
	GDExtensionClassGetRID get_rid_func;
	void* class_userdata; // Per-class user data, later accessible in instance bindings.
}

alias GDExtensionClassLibraryPtr = void*;

alias GDExtensionClassMethodFlags = int;
enum : GDExtensionClassMethodFlags
{
    GDEXTENSION_METHOD_FLAG_NORMAL = 1,
    GDEXTENSION_METHOD_FLAG_EDITOR = 2,
    GDEXTENSION_METHOD_FLAG_CONST = 4,
    GDEXTENSION_METHOD_FLAG_VIRTUAL = 8,
    GDEXTENSION_METHOD_FLAG_VARARG = 16,
    GDEXTENSION_METHOD_FLAG_STATIC = 32,
    GDEXTENSION_METHOD_FLAGS_DEFAULT = GDEXTENSION_METHOD_FLAG_NORMAL,
}

alias GDExtensionClassMethodArgumentMetadata = int;
enum : GDExtensionClassMethodArgumentMetadata
{
    GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT8,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT16,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT32,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT64,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT8,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT16,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT32,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT64,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_FLOAT,
    GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_DOUBLE
}

alias GDExtensionClassMethodCall = void function(
    void* method_userdata,
    GDExtensionClassInstancePtr p_instance,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionInt p_argument_count,
    GDExtensionVariantPtr r_return,
    GDExtensionCallError* r_error);
alias GDExtensionClassMethodValidatedCall = void function(
    void* method_userdata,
    GDExtensionClassInstancePtr p_instance,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionVariantPtr r_return);
alias GDExtensionClassMethodPtrCall = void function(
    void* method_userdata,
    GDExtensionClassInstancePtr p_instance,
    const(GDExtensionConstTypePtr)* p_args,
    GDExtensionTypePtr r_ret);

struct GDExtensionClassMethodInfo
{
    GDExtensionStringNamePtr name;
    void* method_userdata;
    GDExtensionClassMethodCall call_func;
    GDExtensionClassMethodPtrCall ptrcall_func;
    uint32_t method_flags; // Bitfield of `GDExtensionClassMethodFlags`.

    /* If `has_return_value` is false, `return_value_info` and `return_value_metadata` are ignored. */
    GDExtensionBool has_return_value;
    GDExtensionPropertyInfo* return_value_info;
    GDExtensionClassMethodArgumentMetadata return_value_metadata;

    /* Arguments: `arguments_info` and `arguments_metadata` are array of size `argument_count`.
	 * Name and hint information for the argument can be omitted in release builds. Class name should always be present if it applies.
	 */
    uint32_t argument_count;
    GDExtensionPropertyInfo* arguments_info;
    GDExtensionClassMethodArgumentMetadata* arguments_metadata;

    /* Default arguments: `default_arguments` is an array of size `default_argument_count`. */
    uint32_t default_argument_count;
    GDExtensionVariantPtr* default_arguments;
}

alias GDExtensionCallableCustomCall = void function(
    void* callable_userdata,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionInt p_argument_count,
    GDExtensionVariantPtr r_return,
    GDExtensionCallError* r_error);
alias GDExtensionCallableCustomIsValid = GDExtensionBool function(void* callable_userdata);
alias GDExtensionCallableCustomFree = void function(void* callable_userdata);

alias GDExtensionCallableCustomHash = uint32_t function(void* callable_userdata);
alias GDExtensionCallableCustomEqual = GDExtensionBool function(
    void* callable_userdata_a, void* callable_userdata_b);
alias GDExtensionCallableCustomLessThan = GDExtensionBool function(
    void* callable_userdata_a, void* callable_userdata_b);

alias GDExtensionCallableCustomToString = void function(
    void* callable_userdata, GDExtensionBool* r_is_valid, GDExtensionStringPtr r_out);

struct GDExtensionCallableCustomInfo
{
	/* Only `call_func` and `token` are strictly required, however, `object_id` should be passed if its not a static method.
	 *
	 * `token` should point to an address that uniquely identifies the GDExtension (for example, the
	 * `GDExtensionClassLibraryPtr` passed to the entry symbol function.
	 *
	 * `hash_func`, `equal_func`, and `less_than_func` are optional. If not provided both `call_func` and
	 * `callable_userdata` together are used as the identity of the callable for hashing and comparison purposes.
	 *
	 * The hash returned by `hash_func` is cached, `hash_func` will not be called more than once per callable.
	 *
	 * `is_valid_func` is necessary if the validity of the callable can change before destruction.
	 *
	 * `free_func` is necessary if `callable_userdata` needs to be cleaned up when the callable is freed.
	 */
	void* callable_userdata;
	void* token;

	GDObjectInstanceID object_id;

	GDExtensionCallableCustomCall call_func;
	GDExtensionCallableCustomIsValid is_valid_func;
	GDExtensionCallableCustomFree free_func;

	GDExtensionCallableCustomHash hash_func;
	GDExtensionCallableCustomEqual equal_func;
	GDExtensionCallableCustomLessThan less_than_func;

	GDExtensionCallableCustomToString to_string_func;
}

alias GDExtensionScriptInstanceDataPtr = void*; // Pointer to custom ScriptInstance native implementation.

alias GDExtensionScriptInstanceSet = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance,
    GDExtensionConstStringNamePtr p_name,
    GDExtensionConstVariantPtr p_value);
alias GDExtensionScriptInstanceGet = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance,
    GDExtensionConstStringNamePtr p_name,
    GDExtensionVariantPtr r_ret);
alias GDExtensionScriptInstanceGetPropertyList = const(GDExtensionPropertyInfo)* function(
    GDExtensionScriptInstanceDataPtr p_instance, uint32_t* r_count);
alias GDExtensionScriptInstanceFreePropertyList = void function(
    GDExtensionScriptInstanceDataPtr p_instance, const(GDExtensionPropertyInfo)* p_list);
alias GDExtensionScriptInstanceGetClassCategory = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance, GDExtensionPropertyInfo* p_class_category);

alias GDExtensionScriptInstanceGetPropertyType = GDExtensionVariantType function(
    GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionBool* r_is_valid);
alias GDExtensionScriptInstanceValidateProperty = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance, GDExtensionPropertyInfo* p_property);

alias GDExtensionScriptInstancePropertyCanRevert = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name);
alias GDExtensionScriptInstancePropertyGetRevert = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret);

alias GDExtensionScriptInstanceGetOwner = GDExtensionObjectPtr function(
    GDExtensionScriptInstanceDataPtr p_instance);
alias GDExtensionScriptInstancePropertyStateAdd = void function(
    GDExtensionConstStringNamePtr p_name, GDExtensionConstVariantPtr p_value, void* p_userdata);
alias GDExtensionScriptInstanceGetPropertyState = void function(
    GDExtensionScriptInstanceDataPtr p_instance,
    GDExtensionScriptInstancePropertyStateAdd p_add_func,
    void* p_userdata);

alias GDExtensionScriptInstanceGetMethodList = const(GDExtensionMethodInfo)* function(
    GDExtensionScriptInstanceDataPtr p_instance, uint32_t* r_count);
alias GDExtensionScriptInstanceFreeMethodList = void function(
    GDExtensionScriptInstanceDataPtr p_instance, const(GDExtensionMethodInfo)* p_list);

alias GDExtensionScriptInstanceHasMethod = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name);

alias GDExtensionScriptInstanceCall = void function(
    GDExtensionScriptInstanceDataPtr p_self,
    GDExtensionConstStringNamePtr p_method,
    const(GDExtensionConstVariantPtr)* p_args,
    GDExtensionInt p_argument_count,
    GDExtensionVariantPtr r_return,
    GDExtensionCallError* r_error);
alias GDExtensionScriptInstanceNotification = void function(
    GDExtensionScriptInstanceDataPtr p_instance, int32_t p_what);
alias GDExtensionScriptInstanceNotification2 = void function(
    GDExtensionScriptInstanceDataPtr p_instance, int32_t p_what, GDExtensionBool p_reversed);

alias GDExtensionScriptInstanceToString = void function(
    GDExtensionScriptInstanceDataPtr p_instance,
    GDExtensionBool* r_is_valid,
    GDExtensionStringPtr r_out);

alias GDExtensionScriptInstanceRefCountIncremented = void function(
    GDExtensionScriptInstanceDataPtr p_instance);
alias GDExtensionScriptInstanceRefCountDecremented = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance);

alias GDExtensionScriptInstanceGetScript = GDExtensionObjectPtr function(
    GDExtensionScriptInstanceDataPtr p_instance);
alias GDExtensionScriptInstanceIsPlaceholder = GDExtensionBool function(
    GDExtensionScriptInstanceDataPtr p_instance);

alias GDExtensionScriptLanguagePtr = void*;

alias GDExtensionScriptInstanceGetLanguage = GDExtensionScriptLanguagePtr function(
    GDExtensionScriptInstanceDataPtr p_instance);

alias GDExtensionScriptInstanceFree = void function(GDExtensionScriptInstanceDataPtr p_instance);

alias GDExtensionScriptInstancePtr = void*;

/**
Deprecated. Use GDExtensionScriptInstanceInfo2 instead.
*/
deprecated struct GDExtensionScriptInstanceInfo
{
    GDExtensionScriptInstanceSet set_func;
    GDExtensionScriptInstanceGet get_func;
    GDExtensionScriptInstanceGetPropertyList get_property_list_func;
    GDExtensionScriptInstanceFreePropertyList free_property_list_func;

    GDExtensionScriptInstancePropertyCanRevert property_can_revert_func;
    GDExtensionScriptInstancePropertyGetRevert property_get_revert_func;

    GDExtensionScriptInstanceGetOwner get_owner_func;
    GDExtensionScriptInstanceGetPropertyState get_property_state_func;

    GDExtensionScriptInstanceGetMethodList get_method_list_func;
    GDExtensionScriptInstanceFreeMethodList free_method_list_func;
    GDExtensionScriptInstanceGetPropertyType get_property_type_func;

    GDExtensionScriptInstanceHasMethod has_method_func;

    GDExtensionScriptInstanceCall call_func;
    GDExtensionScriptInstanceNotification notification_func;

    GDExtensionScriptInstanceToString to_string_func;

    GDExtensionScriptInstanceRefCountIncremented refcount_incremented_func;
    GDExtensionScriptInstanceRefCountDecremented refcount_decremented_func;

    GDExtensionScriptInstanceGetScript get_script_func;

    GDExtensionScriptInstanceIsPlaceholder is_placeholder_func;

    GDExtensionScriptInstanceSet set_fallback_func;
    GDExtensionScriptInstanceGet get_fallback_func;

    GDExtensionScriptInstanceGetLanguage get_language_func;

    GDExtensionScriptInstanceFree free_func;
}

struct GDExtensionScriptInstanceInfo2
{
	GDExtensionScriptInstanceSet set_func;
	GDExtensionScriptInstanceGet get_func;
	GDExtensionScriptInstanceGetPropertyList get_property_list_func;
	GDExtensionScriptInstanceFreePropertyList free_property_list_func;
	GDExtensionScriptInstanceGetClassCategory get_class_category_func; // Optional. Set to NULL for the default behavior.

	GDExtensionScriptInstancePropertyCanRevert property_can_revert_func;
	GDExtensionScriptInstancePropertyGetRevert property_get_revert_func;

	GDExtensionScriptInstanceGetOwner get_owner_func;
	GDExtensionScriptInstanceGetPropertyState get_property_state_func;

	GDExtensionScriptInstanceGetMethodList get_method_list_func;
	GDExtensionScriptInstanceFreeMethodList free_method_list_func;
	GDExtensionScriptInstanceGetPropertyType get_property_type_func;
	GDExtensionScriptInstanceValidateProperty validate_property_func;

	GDExtensionScriptInstanceHasMethod has_method_func;

	GDExtensionScriptInstanceCall call_func;
	GDExtensionScriptInstanceNotification2 notification_func;

	GDExtensionScriptInstanceToString to_string_func;

	GDExtensionScriptInstanceRefCountIncremented refcount_incremented_func;
	GDExtensionScriptInstanceRefCountDecremented refcount_decremented_func;

	GDExtensionScriptInstanceGetScript get_script_func;

	GDExtensionScriptInstanceIsPlaceholder is_placeholder_func;

	GDExtensionScriptInstanceSet set_fallback_func;
	GDExtensionScriptInstanceGet get_fallback_func;

	GDExtensionScriptInstanceGetLanguage get_language_func;

	GDExtensionScriptInstanceFree free_func;
}

/* INTERFACE */

alias GDGroupTaskFunction = void function(void*, uint32_t);
alias GDTaskFunction = void function(void*);

/* INITIALIZATION */

alias GDExtensionInitializationLevel = int;
enum : GDExtensionInitializationLevel
{
	GDEXTENSION_INITIALIZATION_CORE,
	GDEXTENSION_INITIALIZATION_SERVERS,
	GDEXTENSION_INITIALIZATION_SCENE,
	GDEXTENSION_INITIALIZATION_EDITOR,
	GDEXTENSION_MAX_INITIALIZATION_LEVEL,
}

struct GDExtensionInitialization
{
extern(C) nothrow:

	/* Minimum initialization level required.
	 * If Core or Servers, the extension needs editor or game restart to take effect */
	GDExtensionInitializationLevel minimum_initialization_level;
	/* Up to the user to supply when initializing */
	void* userdata;
	/* This function will be called multiple times for each initialization level. */
	void function(void* userdata, GDExtensionInitializationLevel p_level) initialize;
	void function(void* userdata, GDExtensionInitializationLevel p_level) deinitialize;
}

alias GDExtensionInterfaceFunctionPtr = void function();
alias GDExtensionInterfaceGetProcAddress = GDExtensionInterfaceFunctionPtr function(const(char)* p_function_name);

/*
* Each GDExtension should define a C function that matches the signature of GDExtensionInitializationFunction,
* and export it so that it can be loaded via dlopen() or equivalent for the given platform.
*
* For example:
*
*   GDExtensionBool my_extension_init(GDExtensionInterfaceGetProcAddress p_get_proc_address, GDExtensionClassLibraryPtr p_library, GDExtensionInitialization *r_initialization);
*
* This function's name must be specified as the 'entry_symbol' in the .gdextension file.
*
* This makes it the entry point of the GDExtension and will be called on initialization.
*
* The GDExtension can then modify the r_initialization structure, setting the minimum initialization level,
* and providing pointers to functions that will be called at various stages of initialization/shutdown.
*
* The rest of the GDExtension's interface to Godot consists of function pointers that can be loaded
* by calling p_get_proc_address("...") with the name of the function.
*
* For example:
*
*   GDExtensionInterfaceGetGodotVersion get_godot_version = (GDExtensionInterfaceGetGodotVersion)p_get_proc_address("get_godot_version");
*
* (Note that snippet may cause "cast between incompatible function types" on some compilers, you can
* silence this by adding an intermediary `void*` cast.)
*
* You can then call it like a normal function:
*
*   GDExtensionGodotVersion godot_version;
*   get_godot_version(&godot_version);
*   printf("Godot v%d.%d.%d\n", godot_version.major, godot_version.minor, godot_version.patch);
*
* All of these interface functions are described below, together with the name that's used to load it,
* and the function pointer typedef that shows its signature.
*/
alias GDExtensionInitializationFunction = GDExtensionBool function(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization* r_initialization);

/* INTERFACE */

struct GDExtensionGodotVersion
{
	uint32_t major;
	uint32_t minor;
	uint32_t patch;
	const(char)* version_string;
}
