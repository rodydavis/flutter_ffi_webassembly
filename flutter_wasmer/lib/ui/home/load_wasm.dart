// // Import dart:ffi.
// import 'dart:async';
// import 'dart:ffi' as ffi;

// import 'dart:io' show File, Platform;

// import 'copy_lib.dart';

// // Create a typedef with the FFI type signature of the C function.
// // Commonly used types defined by dart:ffi library include Double, Int32, NativeFunction, Pointer, Struct, Uint8, and Void.
// typedef run_wasm_func = ffi.Void Function();

// // Create a typedef for the variable that you’ll use when calling the C function.
// typedef RunWasm = void Function();

// FutureOr<void> runWasm() async {
//   ffi.DynamicLibrary dylib;
//   // Open the dynamic library that contains the C function.
//   String _file;
//   if (Platform.isMacOS || Platform.isIOS) {
//     _file = await copyAssetFile('target/debug/libadder.dylib');
//   }
//   if (Platform.isWindows) {
//     _file = await copyAssetFile('target/debug/libadder.dll');
//   }
//   if (Platform.isLinux) {
//     _file = await copyAssetFile('target/debug/libadder.so');
//   }
//   if (_file == null) {
//     print('Could Not Load File..');
//     return;
//   }
//   dylib = ffi.DynamicLibrary.open(_file);

//   // Get a reference to the C function, and put it into a variable. This code uses the typedefs defined in steps 2 and 3, along with the dynamic library variable from step 4.
//   final RunWasm run_wasm =
//       dylib.lookup<ffi.NativeFunction<run_wasm_func>>('load_wasm').asFunction();

//   // Call the C function.
//   run_wasm();
// }
