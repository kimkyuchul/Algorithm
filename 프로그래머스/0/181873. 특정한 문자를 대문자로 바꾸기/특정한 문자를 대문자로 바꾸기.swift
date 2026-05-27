import Foundation

func solution(_ my_string:String, _ alp:String) -> String {
    var result = my_string.map { String($0) }
    
    for i in 0..<result.count {
        if result[i] == alp {
            result[i] = alp.uppercased()
        }
    }
    
    return result.joined()
}