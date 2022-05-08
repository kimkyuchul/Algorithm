import Foundation

let valueArr1 = readLine()!.split(separator: " ").map({ (valueArr) -> Int in return Int(valueArr)! })
let b = valueArr1[0]

    if b % 4 == 0 && (b % 100 != 0 || b % 400 == 0) {
        print("1")
    } else  {
        print("0")
    }
