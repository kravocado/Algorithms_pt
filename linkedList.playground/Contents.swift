import UIKit

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    private var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let nextNode = node.next {
            node = nextNode
            count += 1
        }
        return count
    }
    
    public func append(_ value: T) {
        let node = Node(value: value)
        
        if let prevTail = tail {
            node.previous = prevTail
            prevTail.next = node
            tail = node
        } else {
            head = node
            tail = node
        }
    }
    
    public func node(at index: Int) -> Node? {
        guard index >= 0 && index < count else {
            return nil
        }
        
        if index == 0 { return head }
        else if index == count - 1 { return tail }
        else {
            var node: Node? = nil
            
            if index < count / 2 {
                node = head!.next
                for _ in 1 ..< index { node = node!.next }
            } else {
                node = tail!.previous
                for _ in index + 2 ..< count { node = node!.previous }
            }
            return node
        }
    }
    
    public subscript (index: Int) -> T? {
        return node(at: index)?.value
    }
    
    @discardableResult
    public func insert(_ value: T, at index: Int) -> Bool {
        let newNode = Node(value: value)
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else if index == count - 1 {
            append(value)
        } else {
            guard let prevNode = self.node(at: index - 1) else { return false }
            let next = prevNode.next
            
            newNode.previous = prevNode
            newNode.next = prevNode.next
            prevNode.next = newNode
            next?.previous = newNode
        }
        return true
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node) -> T {
        let prevNode = node.previous
        let nextNode = node.next
        
        if let prevNode = prevNode {
            prevNode.next = nextNode
        } else {
            head = nextNode
        }
        
        if nextNode == nil { tail = prevNode }
        nextNode?.previous = prevNode
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    public func remove(_ index: Int) -> T? {
        guard let removeNode = node(at: index) else { return nil }
        return remove(node: removeNode)
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var str = "["
        var node = head
        
        while node != nil {
            str += "\(node!.value)"
            
            node = node!.next
            if node != nil { str += ", "}
        }
        return str + "]"
    }
}

let linkedList = LinkedList<String>()
linkedList.append("A")
linkedList.append("B")
linkedList.append("C")
linkedList.append("D")
linkedList.append("E")
linkedList.append("F")
linkedList.append("G")
linkedList.append("H")

print(linkedList)
print(linkedList.count)
print(linkedList.first!.value)
print(linkedList.last!.value)
print(linkedList.node(at: 6)!.value)
print(linkedList.insert("Z", at: 4))
print(linkedList)
print(linkedList.remove(2)!)
print(linkedList.remove(2)!)
print(linkedList.remove(2)!)
print(linkedList)

