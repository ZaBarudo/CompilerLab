package main

func hello( d[9]int, n int, left int, right int) int{
   if n <= 1 {
      return
   }

   var pivot int


   pivot = d[n-1]


   for left = 0; left <= right; {
      if d[left] <= pivot {
         left = left + 1
         continue
      }

      if d[right] > pivot {
         right = right - 1
         continue
      }

      // d[left], d[right] = d[right], d[left]
      var temp int
      d[right] = temp
      d[right] = d[left]
      d[left] = temp

      left = left + 1
      right = right - 1
   }

   var temp1 int
   d[n-1] = temp1
   d[n-1] = d[left]
   d[left] = temp1

   hello(d[9], n, 0, left)
   hello(d[9], n, left+1, right)
   // e = a[0] + a[1]
}

func main() int{
   var a[9]int
   var k int
   a[0] = 1
   a[1] = 2
   a[2] = 3
   a[3] = 5
   a[4] = 6+1


   hello(a[9], k, 0, 3)

   return 0
}

