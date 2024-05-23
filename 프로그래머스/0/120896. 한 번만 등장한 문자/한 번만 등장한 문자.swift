import Foundation

func solution(_ s:String) -> String {
    var dic = [String: Int]()
    let stringArray = s.map { String($0) }
    
    for i in stringArray {
        dic[i, default: 0] += 1
    }
    
    return dic.filter { $0.value == 1 }.keys.sorted().joined()
}