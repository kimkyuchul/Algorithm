import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    var resultArray: [Int] = []
    
    array.forEach {
        if $0 == n {
            resultArray.append($0)
        }
    }
    
    return resultArray.count
}