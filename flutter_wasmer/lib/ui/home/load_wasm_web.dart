// Import dart:ffi.
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:wasm_interop/wasm_interop.dart';

Instance _wasm;

Future<int> addOne(int value) async {
  if (_wasm == null) {
    final _data = await rootBundle.load('src/add.wasm');
    _wasm = await Instance.fromBufferAsync(_data.buffer);
  }
  final _func = _wasm.functions['add_one'];
  final _result = _func.call(value);
  print('Result: $_result');
  return _result;
}
