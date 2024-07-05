import Foundation

func solution(_ s:String) -> Int {
    let array = s.split(separator: " ").map { String($0) }
    var result = 0
    var stack: [Int] = []
    
    array.forEach {
        if let c = Int($0) {
            result += c
            stack.append(c)
        } else if $0 == "Z", let last = stack.popLast() {
            result -= last
        }
    }
    
    return result
}