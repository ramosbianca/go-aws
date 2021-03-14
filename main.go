package main

import (
	"fmt"
	"math/rand"
	"net/http"
	"strconv"

)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		points := rand.Intn(40)
		var m string
		if points > 1 {
			m = "points"
		} else {
			m = "point"
		}
		fmt.Fprintf(w, "Hey! You win "+strconv.Itoa(points)+" "+m)
	})

	
	//http.ListenAndServeTLS(":8081", "cert.pem", "keyg.key", nil)
	//http.ListenAndServeTLS( "127.0.0.1:8080", "cert.pem", "keyg.key", nil );

	http.ListenAndServe("127.0.0.1:8080", nil)
	
}
