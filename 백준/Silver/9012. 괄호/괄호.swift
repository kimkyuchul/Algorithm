let n = Int(readLine()!)!
var ps: [String] = []

for i in 1...n {
    let s = readLine()!
    ps.append(s)
}

for p in ps {
    var cnt: Int = 0
    var isValid = true
    
    for ch in p {
        if ch == "(" {
            cnt += 1
        } else {
            if cnt == 0 {
                isValid = false
                break
            }
            cnt -= 1
        }
    }
    
    if cnt != 0 {
        isValid = false
    }
    
    print(isValid ? "YES" : "NO")
}