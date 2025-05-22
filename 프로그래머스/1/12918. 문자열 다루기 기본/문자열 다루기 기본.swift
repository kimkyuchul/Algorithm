func solution(_ s:String) -> Bool {
    guard s.count == 4 || s.count == 6,
          let result = Int(s)
    else { return false }
    
    return true
}