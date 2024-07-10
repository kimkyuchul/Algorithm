import Foundation

func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    var arrayString = my_string.map { String($0) }
    let num1Value = arrayString[num1]
    let num2Value = arrayString[num2]
   
    arrayString[num1] = num2Value
    arrayString[num2] = num1Value
    
    return arrayString.joined()
}