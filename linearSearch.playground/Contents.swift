
import UIKit

func linearSearch<T: Equatable>(_ array: [T],_ object: T) -> Int? {
    for (index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}

var list = [3,7,1,0,4,7,]
linearSearch(list, 0)
