import Foundation

// 상근이가 가지고 있는 숫자 카드의 개수
let N = Int(readLine()!)!
//  숫자 카드에 적혀있는 정수
var nArray = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

let M = Int(readLine()!)!
var mArray = readLine()!.split(separator: " ").map { Int(String($0))! }

mArray.forEach {
    print(binarySearch($0), terminator: " ")
}

func binarySearch(_ key: Int) -> Int {
    var start = 0
    var end = nArray.count - 1
    var result = 0
    
    while start <= end {
        let mid = (start + end) / 2
        
        if nArray[mid] > key {
            end = mid - 1
        } else if nArray[mid] < key {
            start = mid + 1
        } else {
            result = 1
            break
        }
    }
    
    return result
}