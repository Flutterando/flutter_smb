package main

import (
	"fmt"
 	"net"
 	"github.com/hirochachacha/go-smb2"
)

import "C"

//export MinhaFuncao
func MinhaFuncao() {
	conn, err := net.Dial("tcp", "192.168.31.212:445")
	if err != nil {
		panic(err)
	}
	defer conn.Close()

	d := &smb2.Dialer{
		Initiator: &smb2.NTLMInitiator{
			User:     "jacob",
			Password: "2204043",
		},
	}

	s, err := d.Dial(conn)
	if err != nil {
		panic(err)
	}
	defer s.Logoff()

	names, err := s.ListSharenames()
	if err != nil {
		panic(err)
	}

	for _, name := range names {
		fmt.Println(name)
	}
}

//export enforce_binding
func enforce_binding() {}

func main() {}