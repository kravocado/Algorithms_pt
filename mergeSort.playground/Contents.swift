import UIKit

func mergeSort(_ array:[Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedIndex = [Int]()
    orderedIndex.reserveCapacity(leftPile.count + rightPile.count)
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedIndex.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedIndex.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedIndex.append(leftPile[leftIndex])
            leftIndex += 1
            orderedIndex.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        orderedIndex.append(leftPile[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightPile.count {
        orderedIndex.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    
    return orderedIndex
}



var myArray = [6,8,4,1,0,7,5,13,32]
mergeSort(myArray)
