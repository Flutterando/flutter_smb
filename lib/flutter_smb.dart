import 'dart:ffi';
import 'dart:io';

import 'flutter_smb_bindings_generated.dart';

void sum() => _bindings.MinhaFuncao();

const String _libName = 'flutter_smb';

/// The dynamic library in which the symbols for [FlutterSmbBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final FlutterSmbBindings _bindings = FlutterSmbBindings(_dylib);
