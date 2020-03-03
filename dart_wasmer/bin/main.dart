// Import dart:ffi.
import 'dart:ffi' as ffi;
// Utilities for working with ffi like String
import 'package:ffi/ffi.dart';

import 'dart:io' show Platform;

// Create a typedef with the FFI type signature of the C function.
// Commonly used types defined by dart:ffi library include Double, Int32, NativeFunction, Pointer, Struct, Uint8, and Void.
typedef play_once_func = ffi.Void Function();

// Create a typedef for the variable that you’ll use when calling the C function.
typedef PlayOnce = void Function();

main() {
  ffi.DynamicLibrary dylib;
  // Open the dynamic library that contains the C function.
  if (Platform.isMacOS) {
    dylib = ffi.DynamicLibrary.open("target/debug/libadder.dylib");
  }

  if (Platform.isWindows) {
    dylib = ffi.DynamicLibrary.open("target/debug/libadder.dll");
  }

  if (Platform.isLinux) {
    dylib = ffi.DynamicLibrary.open("target/debug/libadder.so");
  }

  // Get a reference to the C function, and put it into a variable. This code uses the typedefs defined in steps 2 and 3, along with the dynamic library variable from step 4.
  final PlayOnce play_once = dylib
      .lookup<ffi.NativeFunction<play_once_func>>('load_wasm')
      .asFunction();

  // Call the C function.
  play_once();
}
