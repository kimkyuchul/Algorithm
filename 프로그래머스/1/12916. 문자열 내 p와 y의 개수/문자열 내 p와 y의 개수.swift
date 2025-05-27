import Foundation

func solution(_ s:String) -> Bool {
    var pCount = 0
    var yCount = 0
    
    let resultArray = s.lowercased.map { String($0) }.filter { $0 == "p" || $0 == "y" }
    
    print(resultArray)
    
    resultArray.forEach {
        if $0 == "p" {
            pCount += 1
        } else {
            yCount += 1
        }
    }

    return pCount == yCount
}