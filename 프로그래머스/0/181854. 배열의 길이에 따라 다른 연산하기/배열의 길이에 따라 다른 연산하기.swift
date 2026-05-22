import Foundation

func solution(_ arr:[Int], _ n:Int) -> [Int] {
    let flag = arr.count % 2 == 0
    var index = 0
    var result: [Int] = []
    
    for i in arr {
        if flag {
            if index % 2 != 0 {
                result.append(i + n)
            } else {
                result.append(i)
            }
        } else {
            if index % 2 == 0 {
                result.append(i + n)
            } else {
                 result.append(i)
            }
        }
        
        index += 1
    }
    
    return result
}