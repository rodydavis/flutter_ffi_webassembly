// Import dart:ffi.
import 'dart:async';
import 'dart:ffi' as ffi;
// Utilities for working with ffi like String
import 'package:ffi/ffi.dart';

import 'dart:io' show Platform;

import 'ffi/copy_lib.dart';

// Create a typedef with the FFI type signature of the C function.
// Commonly used types defined by dart:ffi library include Double, Int32, NativeFunction, Pointer, Struct, Uint8, and Void.
typedef greet_func = ffi.Void Function(ffi.Pointer<Utf8>);

// Create a typedef for the variable that you’ll use when calling the C function.
// typedef HelloWorld = void Function();
typedef HelloWorld = void Function(ffi.Pointer<Utf8>);

FutureOr<void> helloWorld() async {
  ffi.DynamicLibrary dylib;
  // Open the dynamic library that contains the C function.
  String _file;
  if (Platform.isMacOS) {
    _file = await copyAssetFile('target/debug/librusty_ffi_flutter.dylib');
  }
  if (Platform.isWindows) {
    _file = await copyAssetFile('target/debug/librusty_ffi_flutter.dll');
  }
  if (Platform.isLinux) {
    _file = await copyAssetFile('target/debug/librusty_ffi_flutter.so');
  }
  if (_file == null) {
    print('Could Not Load File..');
    return;
  }

  dylib = ffi.DynamicLibrary.open(_file);

  // Get a reference to the C function, and put it into a variable. This code uses the typedefs defined in steps 2 and 3, along with the dynamic library variable from step 4.
  HelloWorld greet =
      dylib.lookup<ffi.NativeFunction<greet_func>>('greet').asFunction();

  // // Convert a Dart [String] to a Utf8-encoded null-terminated C string.
  // String _file = await copyAssetFile(pathToAudio);
  final ffi.Pointer<Utf8> input = Utf8.toUtf8('').cast();

  // Call the C function.
  greet(input);
}
