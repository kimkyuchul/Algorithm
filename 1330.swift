import Foundation

let valueArr = readLine()!.split(separator: " ").map({ (valueArr) -> Int in return Int(valueArr)! })
let a = valueArr[0]
let b = valueArr[1]

if a > b {
    print(">")
} else if a < b {
    print("<")
} else {
    print("==")
}
