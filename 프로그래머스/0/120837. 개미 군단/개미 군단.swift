import Foundation

func solution(_ hp:Int) -> Int {
    var hpResult = hp
    var result = 0
    
   while true {
       if hpResult < 5 {
           break
       }
       
       hpResult -= 5
       result += 1
   }
    
     while true {
       if hpResult < 3 {
           break
       }
       
       hpResult -= 3
       result += 1
   }
    
       while true {
       if hpResult < 1 {
           break
       }
       
       hpResult -= 1
       result += 1
   }
    
    return result
}