import Foundation


var result = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    dfs(numbers: numbers, target: target, sum: 0, index: 0)
    
    return result
}

// 각 배열의 인자마다 +, - 한번씩 수행 -> 재귀로 계속
func dfs(numbers: [Int], target: Int, sum: Int, index: Int) {
    
    if numbers.count <= index {
        
        if sum == target {
            print("result \(result)")
            result += 1
        }
        
        return
    }
    
    // + 수행
    dfs(numbers: numbers, target: target, sum: sum + numbers[index], index: index + 1)
    // - 수행
    dfs(numbers: numbers, target: target, sum: sum - numbers[index], index: index + 1)
}