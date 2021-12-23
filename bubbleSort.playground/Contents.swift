import UIKit

var myArray = [9,8,7,6,5,4]

func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count {
        for j in 1..<arr.count - i {
            if arr[j] < arr[j-1] {
                arr.swapAt(j, j-1)
            }
        }
    }
    return arr
}
bubbleSort(myArray)
