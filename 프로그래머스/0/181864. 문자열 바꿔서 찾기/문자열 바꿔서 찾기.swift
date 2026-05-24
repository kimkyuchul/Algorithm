import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
   var string = myString.map { String($0) }
    
    for i in 0..<myString.count {
        if string[i] == "A" {
           string[i] = "B" 
        } else {
           string[i] = "A" 
        }
    }
    
    return string.joined().contains(pat) ? 1 : 0
}