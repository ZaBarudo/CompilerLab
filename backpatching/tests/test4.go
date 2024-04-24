package main

func main() {
    var b int 
    b = 5
	var a int 
    a = 10
	
    var result int
    result = a + b
    println("Addition: ")
    println(result)
    result = a - b
    println("Subtraction: ") 
    println(result)
    result = a * b
    println("Multiplication: ") 
    println(result)
    result = a / b
    println("Division: ") 
    println(result)
    for i = 0; i < 5; i++ {
        println("Iteration ") 
        println(i)
    }

}
