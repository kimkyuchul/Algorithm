import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let sortD = d.sorted()
    var bBudget = budget
    var result = 0
    
    for i in sortD {
        if i <= bBudget {
            result += 1
            bBudget -= i
        }
    }
    
    return result
}