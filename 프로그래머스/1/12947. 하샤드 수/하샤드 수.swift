func solution(_ x:Int) -> Bool {
    let hi = String(x)
    
    let aa = hi.map { Int(String($0))! }
    
    var result = 0
    
    for a in aa {
        result += a
    }
    
    // let first = aa[0]
    // let second = aa[1]
    
    return x % result == 0 ? true : false
}