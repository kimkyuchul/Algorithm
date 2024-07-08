import Foundation

func solution(_ n:Int) -> Int {
    let nn = Array(String(n))
    var result = 0
    
    nn.forEach {
        result += Int(String($0))!
    }
    
    return result
}