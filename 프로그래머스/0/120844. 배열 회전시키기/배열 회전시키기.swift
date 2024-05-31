import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    var result = numbers
    
    if direction == "right" {
        result.insert(numbers.last!, at: 0)
        result.removeLast()
    } else {
        result.append(numbers.first!)
        result.removeFirst()
    }
    
    return result
}