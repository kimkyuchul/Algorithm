import Foundation

func solution(_ my_string:String) -> Int {
    let stringArray = my_string.map { String($0) }
    var newArray = [Int]()
    var result = 0
    
    for i in stringArray {
        if let a = Int(i) {
            newArray.append(a)
        }
    }
    
    for i in newArray {
        result += i
    }
    
    return result
}