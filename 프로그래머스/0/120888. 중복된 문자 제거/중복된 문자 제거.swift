import Foundation

func solution(_ my_string:String) -> String {
    var result = my_string.map { String($0) }
    var resultString = ""

    result.forEach {
        if !resultString.contains($0) {
            resultString += $0
        }
    }
    return resultString
}