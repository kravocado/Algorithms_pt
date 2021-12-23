import UIKit


////  while문
func insertionSort(_ array: [Int]) -> [Int] {
    var sortedArray = array
    for index in 1..<sortedArray.count {
        var currentIndex = index
        while currentIndex > 0 && sortedArray[currentIndex] < sortedArray[currentIndex - 1] {
            sortedArray.swapAt(currentIndex - 1, currentIndex)
            currentIndex -= 1
        }
    }
    return sortedArray
}

let list = [ 9, -1, 3, 7, 2, 11, -123]
insertionSort(list)
//
//
//// for문
//var arrayOne: [Int] = [5,-2,4,5,6,7,8,9,11,444,55,-33]
//
//func insertionSort (unSortedArray: inout [Int]) -> [Int] {
//    for index in 1..<unSortedArray.count {
//        for index2 in (1...index).reversed() {
//            if unSortedArray[index2] < unSortedArray[index2 - 1] {
//                unSortedArray.swapAt(index2, index2 - 1)
//            } else {
//                break
//            }
//        }
//    }
//    return unSortedArray
//}
//
//insertionSort(unSortedArray: &arrayOne)


func insertionSort(_ array: [Int]) -> [Int] {
    var arr = array
    
    for i in 1..<arr.count {
        var j = i
        while j > 0 && arr[j] < arr[j-1] {
            arr.swapAt(j, j-1)
            j-1
        }
    }
    return arr
}
        




