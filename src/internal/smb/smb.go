package smb

import (
	"net"
	"strings"

	"github.com/hirochachacha/go-smb2"
)

func InternalCheckPc() string {
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

	return strings.Join(names, "\n")

}
