import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Map<String, String> _cachedLibs = {};

Future<String> copyAssetFile(String path, [bool cache = false]) async {
  String _result;
  if (!cache || _cachedLibs[path] == null) {
    String _dir = Directory.current.path;
    if (Platform.isIOS) {
      _dir = await _localPath;
    }
    if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      _dir = await _localPath;
    }
    final _file = File(p.joinAll([_dir, path.split('/').last]));
    final _filePath = _file.path;
    print('File Path: $_filePath');
    if (!_file.existsSync()) await _file.createSync(recursive: true);
    final _lib = await rootBundle.load('$path');
    _file.writeAsBytesSync(_lib.buffer.asUint8List());
    _cachedLibs[path] = _filePath;
    _result = _filePath;
  }
  return _result;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
