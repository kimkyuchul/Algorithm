func solution(_ arr:[Int]) -> [Int] {
    if arr.count < 2 {
        return [-1]
    }
    
    var result = arr
    let a = arr.sorted().first!
    
    result.removeAll { $0 == a }
    
    return result
}