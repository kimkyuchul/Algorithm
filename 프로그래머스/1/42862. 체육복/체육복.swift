func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let lostArray = lost.filter{ !reserve.contains($0) }.sorted()
    let reserveArray = reserve.filter{ !lost.contains($0) }.sorted()
    var result = n - lostArray.count
    var borrowed = [Int]()
    
    for i in reserveArray {
        if lostArray.contains(i - 1) && !borrowed.contains(i - 1) {
            borrowed.append(i - 1)
            result += 1
        } else if lostArray.contains(i + 1) && !borrowed.contains(i + 1) {
            borrowed.append(i + 1)
            result += 1
        }
    }
    
    return result
}