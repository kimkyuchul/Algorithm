import Foundation

func solution(_ myString:String) -> String {
    return myString.map {
        if String($0) == "a" {
            return $0.uppercased()
        }
        
       if String($0) == "A" {
           return "A"
       }
        
        return $0.lowercased()
    }.joined()
}