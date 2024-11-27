import Foundation

func solution(_ food:[Int]) -> String {
    var foodTable: [Int] = []
    var stack: [Int] = []
    
    for (index, item) in food.enumerated() {
        if index == 0 || item == 1 {
            continue
        }
        
        for _ in 0..<(item / 2) {
            foodTable.append(index)
            stack.append(index)
        }
    } 
    
    foodTable.append(0)
    
    let reversedStack = stack.reversed()
    let result = foodTable + reversedStack
    
    return result.map { String($0) }.joined()
}