package main

import (
	"log"
	"net/http"
)

type httpServer struct {
	logf      func(f string, v ...interface{})
	localhost string
	files    string
}

func (s *httpServer) NewServer() {
	s.localhost = "0.0.0.0:4343"
	s.files = "./static/"
}

func main() {
	s := &httpServer{
		logf: log.Printf,
	}
	s.NewServer()
	http.Handle("/", http.FileServer(http.Dir(s.files)))

	err := http.ListenAndServe(s.localhost, nil)
	if err != nil {
		log.Fatal(err)
	}
}
