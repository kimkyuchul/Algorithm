import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int]()
    
    numbers.forEach {
        result.append( $0 * 2)
    }
    
    return result
}