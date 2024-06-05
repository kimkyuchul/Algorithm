import Foundation

func solution(_ age:Int) -> String {
    let ageString = "abcdefghij"
    var ageArray = ageString.map { String($0) }
    
    let stringAgeArray = String(age).map { $0 } // Character 배열
    let intArray = stringAgeArray.compactMap { Int(String($0)) }
    var result = ""
    
    for item in intArray {
        result += ageArray[item]
    }
    
    return result
}