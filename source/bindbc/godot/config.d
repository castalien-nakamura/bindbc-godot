/+
+            Copyright 2024 – 2024 Castalien LLC
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.godot.config;

public import bindbc.common.types: c_long, c_ulong, va_list, wchar_t;
public import bindbc.common.versions: Version;

enum staticBinding = (){
	version(BindBC_Static)       return true;
	else return false;
}();

enum cStyleEnums = (){
	version(GODOT_D_Enums_Only)  return false;
	else return true;
}();

enum dStyleEnums = (){
	version(GODOT_C_Enums_Only)  return false;
	else return true;
}();