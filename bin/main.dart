import 'dart:ffi';

typedef minha_funcao_c = Int32 Function(Int32);
typedef MinhaFuncaoDart = int Function(int);
void main(List<String> args) {
  final DynamicLibrary lib = DynamicLibrary.open('/Users/jacob/Projects/flutter_smb/src/go/golib.a');
  lib.lookupFunction<minha_funcao_c, MinhaFuncaoDart>('minha_funcao')(10);
}
