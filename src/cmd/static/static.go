package main

/*
#include <stdlib.h>
*/
import "C"

import (
	"flutterando.com.br/flutter_smb/internal/smb"
)

//export goCheckPc
func goCheckPc(a C.int) *C.char {
	names := smb.InternalCheckPc()
	return C.CString(names)
}

func main() {}
