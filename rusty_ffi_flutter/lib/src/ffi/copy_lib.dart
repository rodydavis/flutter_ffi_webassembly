import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Map<String, String> _cachedLibs = {};

Future<String> copyAssetFile(String path, [bool cache = false]) async {
  String _result;
  if (!cache || _cachedLibs[path] == null) {
    final _path = await getApplicationDocumentsDirectory();
    final _file = File('"${_path.path}/${path.split('/').last}"');
    final _filePath = _file.path;
    if (!_file.existsSync()) await _file.createSync(recursive: true);
    final _lib = await rootBundle.load('$path');
    _file.writeAsBytesSync(_lib.buffer.asUint8List());
    _cachedLibs[path] = _filePath;
    _result = _filePath;
  }
  return _result;
}
