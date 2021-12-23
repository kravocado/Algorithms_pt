import UIKit

//
//func quickSort<T: Comparable>(_ a: [T]) -> [T] {
//    guard a.count > 1 else { return a }
//
//    let pivot = a[a.count/2]
//    let less = a.filter { $0 < pivot }
//    let equal = a.filter { $0 == pivot }
//    let greater = a.filter { $0 > pivot }
//
//    return quickSort(less) + equal + quickSort(greater)
//}
//let list = [9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//quickSort(list)



// ----------------------------------------------------------------------------------------



func quickSortPartition<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]

    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
        }
    }
    a.swapAt(i, high)
    return i
}

func quickSort<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = quickSortPartition(&a, low: low, high: high)
        quickSort(&a, low: low, high: p - 1)
        quickSort(&a, low: p + 1, high: high)
    }
}

var list = [3,5,1,3,0,8,6,-3,-1,5,9]
quickSort(&list, low: 0, high: list.count - 1)





