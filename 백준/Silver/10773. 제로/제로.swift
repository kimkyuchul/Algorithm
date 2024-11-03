import Foundation

let k = Int(readLine()!)!

var stack: [Int] = []
var result = 0

for _ in 0..<k {
    let input = Int(readLine()!)!
    
    if input != 0 {
        stack.append(input)
    } else {
        stack.popLast()
    }
}

for i in stack {
    result += i
}

print(result)