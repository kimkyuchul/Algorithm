import Foundation

func solution(_ before:String, _ after:String) -> Int {
    let beforeString = String(Array(before).sorted())
    let afterString = String(Array(after).sorted())
    
    return beforeString == afterString ? 1 : 0
}