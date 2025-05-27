import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let resultCount = t.count - p.count + 1
    var result = 0
    
    for i in 0...t.count - p.count {
        let a = t.dropFirst(i).prefix(p.count)
        
        if Int(a)! <= Int(p)! {
            result += 1
        }
    }
    
    return result
}