package main

/*
#include <stdlib.h>
*/
import "C"

import (
	"flutterando.com.br/flutter_smb/internal/smb"
)

//export checkPc
func checkPc(a C.int) *C.char {
	names := smb.InternalCheckPc()
	return C.CString(names)
}

//export sum
func sum(a C.int, b C.int) C.int {
	return a + b
}

//export sum_long_running
func sum_long_running(a C.int, b C.int) C.int {
	return a + b
}

func main() {}
