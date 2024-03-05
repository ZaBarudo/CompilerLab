package main

import (
	"fmt"
	"os"
	"strconv"
)

func add(x, y float64) float64 {
	return x + y
}

func subtract(x, y float64) float64 {
	return x - y
}

func multiply(x, y float64) float64 {
	return x * y
}

func divide(x, y float64) float64 {
	if y != 0 {
		return x / y
	}
	fmt.Println("Error: Cannot divide by zero.")
	os.Exit(1)
	return 0
}

func main() {
	if len(os.Args) != 4 {
		fmt.Println("Usage: calculator <number> <operator> <number>")
		os.Exit(1)
	}

	arg1, err := strconv.ParseFloat(os.Args[1], 64)
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}

	arg2, err := strconv.ParseFloat(os.Args[3], 64)
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}

	operator := os.Args[2]

	var result float64

	switch operator {
	case "+":
		result = add(arg1, arg2)
	case "-":
		result = subtract(arg1, arg2)
	case "*":
		result = multiply(arg1, arg2)
	case "/":
		result = divide(arg1, arg2)
	default:
		fmt.Println("Error: Invalid operator")
		os.Exit(1)
	}

	fmt.Printf("%.2f %s %.2f = %.2f\n", arg1, operator, arg2, result)
}
