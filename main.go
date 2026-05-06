package main
func main() {
}
package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/greeting", func(w http.ResponseWriter, r *http.Request) {
		name := r.URL.Query().Get("name")
		if name == "" {
			name = "World"
		}
		w.Write([]byte("Hello, " + name))
	})

	log.Fatal(http.ListenAndServe(":80", nil))
}
