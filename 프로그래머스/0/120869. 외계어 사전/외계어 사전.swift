import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
    let dicItem = dic.map { String($0).sorted() }
    
    if dicItem.contains(spell.joined().sorted()) {
        return 1
    }
    
    return 2
}
