import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    
    for (index, item) in absolutes.enumerated() {
        if signs[index] == true {
            result += item
        } else {
            result -= item
        }
    }
    
    return result
}