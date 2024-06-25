import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    let array = Array(String(num))
    let intArray = array.map { Int(String($0)) }
    var result = 0
    
    if let i = intArray.firstIndex(where: { $0 == k }) {
        result = i + 1
    } else {
        result = -1
    }
    
    return result
}