import Foundation


let n: Int = Int(readLine()!)!
let valueArr = readLine()!.split(separator: " ").map({ (valueArr) -> Int in return Int(valueArr)! })
print(valueArr.min()!, valueArr.max()!)
