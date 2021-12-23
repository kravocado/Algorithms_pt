
import UIKit

func radixSort(_ array: inout [Int]) -> [Int] {
    let radix = 10
    var done = false
    var index: Int
    var digit = 1
    
    while !done {
        done = true
        var buckets: [[Int]] = []
        for _ in 1...radix {
            buckets.append([])
        }
        
        for number in array {
            index = number / digit
            buckets[index % radix].append(number)
            if done && index > 0 {
                done = false
            }
        }
        var i = 0
        
        for j in 0..<radix {
            let bucket = buckets[j]
            for number in bucket {
                array[i] = number
                i += 1
            }
        }
        digit *= radix
    }
    return array
}

var list = [10,302,4854,5,0]
print(radixSort(&list))
