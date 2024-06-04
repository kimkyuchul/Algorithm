import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let strArray1 = str1.map { String($0) }
    
    if str1.contains(str2) {
        return 1
    } else {
        return 2
    }
}