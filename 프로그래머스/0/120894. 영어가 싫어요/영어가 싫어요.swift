import Foundation

func solution(_ numbers:String) -> Int64 {
    let item = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var numberString = ""
    var result = ""
    
    for i in numbers {
        numberString += String(i)
        if let a = item.firstIndex(of: numberString) {
            result += String(a)
            numberString = ""
        }
    }
    
    return Int64(result)!
}