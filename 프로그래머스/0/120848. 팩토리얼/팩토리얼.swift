import Foundation

func solution(_ n:Int) -> Int {
       var i = 1 
       var fact = 1    
    
    while true {
        let c = fact * (i + 1)
        if c > n { break }
        fact = c
        i += 1
    }
    
    return i
}