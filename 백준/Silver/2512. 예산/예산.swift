import Foundation

let N = Int(readLine()!)!

var nArray = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

let M = Int(readLine()!)!

var start = 0
var end = nArray.max()!
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    
    for n in nArray {
        // 110 < 135
        if n < mid {
            sum += n
        } else {
            sum += mid
        }
    }
    
    // 484 <= 485
    if sum <= M {
        start = mid + 1
    } else {
        end = mid - 1
    }
    
    result = end
}

print(result)