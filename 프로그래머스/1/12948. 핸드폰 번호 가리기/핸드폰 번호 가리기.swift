func solution(_ phone_number:String) -> String {
    // let phone = phone_number.map { String($0) }
    let lastPhone = phone_number.suffix(4)
    var result = ""
    
    for i in 0..<phone_number.count - 4 {
        result += "*"
    }

    return result + lastPhone
}