import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var sortArray = num_list.sorted(by: <)
    var result: [Int] = []
    
    for (index, i) in sortArray.enumerated() {
        if index < 5 {
            continue
        }
        result.append(i)
    }
    return result
}