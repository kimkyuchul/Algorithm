import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    return Array(num_list.sorted(by: <)[0..<5])
}