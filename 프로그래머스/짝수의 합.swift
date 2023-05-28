import Foundation

var a = 0

func 짝수의합(_ n:Int) -> Int {
    for i in 1...n {
        if i % 2 == 0 {
            a = a + i
        }
    }
    return a
}

