
import UIKit

class Heap<T: Comparable> {
    
    var count: Int { items.count - sortedElementCount }
    var isEmpty: Bool { return items.isEmpty }
    var sortedElementCount: Int = 0
    
    var items: [T] = []
    
    
    func getParentIndex(_ index: Int) -> Int { return (index - 1) / 2 }
    func getLeftChildIndex(_ index: Int) -> Int { return 2 * index + 1 }
    func getRightChildIndex(_ index: Int) -> Int { return 2 * index + 2 }
    
    func hasParentindex(_ index: Int) -> Bool { return getParentIndex(index) >= 0 }
    func hasLeftChildIndex(_ index: Int) -> Bool { return getLeftChildIndex(index) < count }
    func hasRightChildIndex(_ index: Int) -> Bool { return getRightChildIndex(index) < count}
    
    func parent(_ index: Int) -> T { return items[getParentIndex(index)] }
    func leftChild(_ index: Int) -> T { return items[getLeftChildIndex(index)] }
    func rightChild(_ index: Int) -> T { return items[getRightChildIndex(index)] }
    
    
    func peek() -> T? {
        return items[0]
    }
    
    func poll() -> T? {
        if count == 0 { return nil }
        let item = items[0]
        items[0] = items.removeLast()
        heapifyDown()
        return item
    }
    
    func add(_ item: T) {
        items.append(item)
        heapifyUp()
    }
    
    func printHeap() {
        for i in 0..<items.count {
            print("\(items[i])", terminator: " ")
        }
        print("")
    }
    
    func heapifyUp() {
        if isEmpty { return }
        var index = count - 1
        while hasParentindex(index) && parent(index) < items[index] {
            items.swapAt(index, getParentIndex(index))
            index = getParentIndex(index)
        }
    }
    
    func heapifyDown() {
        if isEmpty { return }
        var index = 0
        var biggestChildIndex: Int
        
        
        while hasLeftChildIndex(index) {
            biggestChildIndex = getLeftChildIndex(index)
            if hasRightChildIndex(index) && leftChild(index) < rightChild(index) {
                biggestChildIndex = getRightChildIndex(index)
            }
            
            if items[index] > items[biggestChildIndex] { break }
            
            items.swapAt(index, biggestChildIndex)
            index = biggestChildIndex
        }
    }
    
    func heapSort() {
        for _ in 0..<count - 1 {
            items.swapAt(0, count - 1)
            sortedElementCount += 1
            heapifyDown()
        }
    }
}


let heap = Heap<Int>()
heap.add(10)
heap.printHeap()
heap.add(20)
heap.printHeap()
heap.add(30)
heap.printHeap()
heap.add(9)
heap.printHeap()
heap.add(8)
heap.printHeap()
heap.add(32)
heap.printHeap()
heap.add(2)
heap.printHeap()

heap.heapSort()

heap.printHeap()


















