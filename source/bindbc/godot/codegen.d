/+
+            Copyright 2024 – 2024 Castalien LLC
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.godot.codegen;

import bindbc.godot.config;
import bindbc.common.codegen;

mixin(makeFnBindFns(staticBinding, Version(1,0,0)));
