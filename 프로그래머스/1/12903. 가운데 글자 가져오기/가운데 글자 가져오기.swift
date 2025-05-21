func solution(_ s:String) -> String {
    let v = Array(s)[(s.count - 1) / 2...s.count / 2]
    return String(v)
}