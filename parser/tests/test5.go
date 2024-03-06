package main

import "fmt"

func main() {
    var b int = 5
	var a int = 10
    var result int
    
    result = a + b
    println("Addition:", result)
    
    result = a - b
    println("Subtraction:", result) 
    result = a * b
    println("Multiplication:", result) 
    result = a / b
    println("Division:", result) 
    
    for i := 0; i < 5; i++ {
        println("Iteration:", i) 
    }
    
    j := 0
    for j < 5 {
        println("Iteration (while loop):", j)
        j++
    }
}
