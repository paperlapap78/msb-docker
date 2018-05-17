package main

import (
	"fmt"
	"github.com/fabianlee/go-myutil/myutil"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello world!")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Simple Helloworld server is running on port 8080")
	myutil.GetBranch()
	http.ListenAndServe(":8080", nil)
}
