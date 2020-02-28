import 'dart:ffi';

import 'package:ffi_tool/c.dart';
import 'dart:io';

void main() {
  generateFile(File('generated.dart'), library);
}

final library = Library(
  dynamicLibraryPath: '/Users/rodydavis/Developer/GitHub/examples/flutter_ffi_plugin/hello_world/hello_library',
  elements: [
    // A function
    Func(
      name: 'Example',
      parameterTypes: ['int32', 'float64', '*void'],
      returnType: 'void',
    ),

    // A global
    Global(
      name: 'ExampleGlobal',
      type: 'int32',
    ),
  ],
);
