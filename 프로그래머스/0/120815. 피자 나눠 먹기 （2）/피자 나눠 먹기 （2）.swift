import Foundation

func solution(_ n:Int) -> Int {
    var result = 1
    
    for i in 1...n {
        if (i*6) % n == 0 {
            result = i
            break
        } 
    }
    
    return result
}