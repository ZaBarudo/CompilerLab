package main

import "fmt"
import "temp"

func main() {
    var b = 5
	var a int = 10
	var a int = 10
    var result int
    var a int, b int // if not assigning value, then specify type
    
    result = a + b
    println("Addition:", result)
    
    result = a + (a - b) + (1)
    println("Subtraction:", result) 
    result = a * b
    println("Multiplication:", result) 
    result = a / b
    println("Division:", result) 
    
    for i := 0; i < 5; i++ {
        println("Iteration:", i) 
    }
    
    if a<1 {
        
    }

    j := 0
    // for j < 5 {
    //     println("Iteration (while loop):", j)
    //     j++
    // }
}
