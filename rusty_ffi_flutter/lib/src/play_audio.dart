// Import dart:ffi.
import 'dart:async';
import 'dart:ffi' as ffi;
// Utilities for working with ffi like String
import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';

import 'dart:io' show File, Platform;

import 'package:path_provider/path_provider.dart';

// Create a typedef with the FFI type signature of the C function.
// Commonly used types defined by dart:ffi library include Double, Int32, NativeFunction, Pointer, Struct, Uint8, and Void.
typedef play_once_func = ffi.Void Function(ffi.Pointer<Utf8>);

// Create a typedef for the variable that you’ll use when calling the C function.
typedef PlayOnce = void Function(ffi.Pointer<Utf8>);

FutureOr<void> playAudio(String pathToAudio) async {
  ffi.DynamicLibrary dylib;
  // Open the dynamic library that contains the C function.
  if (Platform.isMacOS) {
    String _file = await _copyAssetFile('target/debug/libplay_once.dylib');
    dylib = ffi.DynamicLibrary.open(_file);
  }

  if (Platform.isWindows) {
    String _file = await _copyAssetFile('target/debug/libplay_once.dll');
    dylib = ffi.DynamicLibrary.open(_file);
  }

  if (Platform.isLinux) {
    String _file = await _copyAssetFile('target/debug/libplay_once.so');
    dylib = ffi.DynamicLibrary.open(_file);
  }

  // Get a reference to the C function, and put it into a variable. This code uses the typedefs defined in steps 2 and 3, along with the dynamic library variable from step 4.
  final PlayOnce play_once = dylib
      .lookup<ffi.NativeFunction<play_once_func>>('play_once')
      .asFunction();

  // Convert a Dart [String] to a Utf8-encoded null-terminated C string.
  String _file = await _copyAssetFile(pathToAudio);
  final ffi.Pointer<Utf8> song = Utf8.toUtf8(_file).cast();

  // Call the C function.
  play_once(song);
}

Map<String, bool> _cachedLibs = {};

Future<String> _copyAssetFile(String path) async {
  final _path = await getApplicationDocumentsDirectory();
  final _file = File('"${_path.path}/${path.split('/').last}"');
  final _filePath = _file.path;
  if (_cachedLibs[_filePath] != null && _cachedLibs[_filePath]) {
    if (!_file.existsSync()) await _file.createSync(recursive: true);
    final _lib = await rootBundle.load('$path');
    _file.writeAsBytesSync(_lib.buffer.asUint8List());
    _cachedLibs[_filePath] = true;
  }
  return _filePath;
}
