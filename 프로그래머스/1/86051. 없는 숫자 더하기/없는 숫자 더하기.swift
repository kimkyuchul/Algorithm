import Foundation

func solution(_ numbers:[Int]) -> Int {
    var result = 0
    
    numbers.forEach {
        result += $0
    }
    
    return 45 - result
}