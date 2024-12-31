import Foundation

let N = Int(readLine()!)!
var nArray = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
var mArray = readLine()!.split(separator: " ").map { Int($0)! }

nArray.sort()

for m in 0..<M {
    print(binarySearch(nArray, mArray[m]))
}

func binarySearch(_ array: [Int], _ key: Int) -> Int {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if nArray[mid] == key {
            return 1
        } else if nArray[mid] > key {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return 0
}