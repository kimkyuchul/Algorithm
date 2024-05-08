import Foundation

func solution(_ n:Int) -> Int {
    if n <= 7 {
        return 1
    } else if n % 7 == 0 {
        return n / 7
    } else {
     return n / 7 + 1   
    }
}