import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    let cipherArr = Array(cipher)
    var result: [Character] = []
    
     for (index, text) in cipherArr.enumerated() {
         if (index + 1) % code == 0 {
             result.append(text)
         }
     }  
    
    return String(result)
}