import Foundation

func solution(_ rny_string:String) -> String {
    var result = rny_string.map { String($0) }
    
    for (index, i) in result.enumerated() {
        if i == "m" {
            result[index] = "rn"
        }
    }
    
    return result.joined()
}