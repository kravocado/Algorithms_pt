import UIKit

func selectionSort(_ array:[Int]) -> [Int] {
    guard array.count > 0 else { return array }
    
    var arr = array
    for i in 0..<arr.count-1 {
        var min = i
        for j in min+1..<arr.count {
            if arr[j] < arr[min] {
                min = j
            }
        }
        if i != min {
            arr.swapAt(i, min)
        }
    }
    return arr
}



var myArray = [7,5,0,4,6,5]
selectionSort(myArray)
