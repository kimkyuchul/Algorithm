import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    
    let array = Array(i...j).flatMap { String($0) }

    
    return array.filter{ String($0) == "\(k)" }.count
}