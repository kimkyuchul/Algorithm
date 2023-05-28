import Foundation

func 양꼬치(_ n:Int, _ k:Int) -> Int {
    var a = 0
    
    for i in 1...n {
        if i % 10 == 0 {
            a = a - 2000
        }
        a = a + 12000
    }
    return (k * 2000) + a
}
