import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = nm[0]
let M = nm[1]

var treeHeightArray = readLine()!.split(separator: " ").map { Int($0)! }

var start = 1
var end = treeHeightArray.max()!
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var countHeight = 0
    
    treeHeightArray.forEach {
        if $0 > mid {
            countHeight += $0 - mid
        }
    }
    
    if countHeight >= M {
        result = mid    // 여기로 이동
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)