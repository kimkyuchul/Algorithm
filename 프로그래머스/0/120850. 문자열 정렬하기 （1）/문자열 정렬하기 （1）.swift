import Foundation

func solution(_ my_string:String) -> [Int] {
    var result = my_string.compactMap { Int(String($0)) }
    
    return result.sorted()
}