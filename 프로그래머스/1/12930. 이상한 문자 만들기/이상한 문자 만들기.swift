func solution(_ s:String) -> String {
    var a = s.components(separatedBy:" ")
    // var result = ""
    
    for (index, item) in a.enumerated() {
        var result = ""
        for i in 0..<item.count {
            if i % 2 == 0 {
                result += Array(item)[i].uppercased()
            } else {
                 result += Array(item)[i].lowercased()
            }
        }
        
        a[index] = result
    }
    
    return a.joined(separator: " ")
}