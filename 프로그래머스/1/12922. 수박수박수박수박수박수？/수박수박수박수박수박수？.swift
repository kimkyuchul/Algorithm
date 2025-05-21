func solution(_ n:Int) -> String {
    var subak: [String] = ["수"]
    
    for i in 1..<n {
        if subak.last == "수" {
            subak.append("박")
        } else {
            subak.append("수")
        }
    }
    return subak.joined()
}