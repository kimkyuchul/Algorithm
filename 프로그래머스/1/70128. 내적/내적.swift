import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    
    for (index, item) in a.enumerated() {
        result += (b[index] * item)
    }
    
    return result
}