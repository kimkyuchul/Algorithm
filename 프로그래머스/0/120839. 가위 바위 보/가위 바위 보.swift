import Foundation

func solution(_ rsp:String) -> String {
    let rspArray = Array(rsp)
    var result: [String] = []
    
    rspArray.forEach {
        if $0 == "2" {
            result.append("0")
        } else if $0 == "0" {
            result.append("5")
        } else if $0 == "5" {
            result.append("2")
        }
    }
    
    return result.joined()
}