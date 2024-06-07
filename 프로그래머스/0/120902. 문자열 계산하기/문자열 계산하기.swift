import Foundation

func solution(_ my_string:String) -> Int {
    var result = my_string.components(separatedBy: " ")
    
    var answer = Int(result[0])!
    
    for i in 1..<result.count {
        if result[i] == "+" {
            answer += Int(result[i+1])!
        } else if result[i] == "-"  {
             answer -= Int(result[i+1])!
        }
    }
    
    return answer
}