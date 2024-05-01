package main

func quickSort(arr []int) {
    if len(arr) <= 1 {
        return
    }

    pivot := arr[len(arr)-1]
    left := 0
    right := len(arr) - 2

    for left <= right {
        if arr[left] <= pivot {
            left++
            continue
        }

        if arr[right] > pivot {
            right--
            continue
        }

        arr[left], arr[right] = arr[right], arr[left]
        left++
        right--
    }

    arr[left], arr[len(arr)-1] = arr[len(arr)-1], arr[left]

    quickSort(arr[:left])
    quickSort(arr[left+1:])
}

func main() {
    var arr [9]int
    arr = [9]int {3, 7, 2, 8, 1, 9, 4, 5, 6}
    println("Unsorted array:", arr)

    quickSort(arr)
    println("Sorted array:", arr)
}