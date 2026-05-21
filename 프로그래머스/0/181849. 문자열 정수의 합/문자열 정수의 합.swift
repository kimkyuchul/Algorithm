import Foundation

func solution(_ num_str:String) -> Int {
    var result = 0
    for i in num_str {
        let v = Int(String(i))!
        result += v
    }
    return result
}