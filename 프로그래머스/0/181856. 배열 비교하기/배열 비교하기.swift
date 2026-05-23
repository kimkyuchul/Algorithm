import Foundation

func solution(_ arr1:[Int], _ arr2:[Int]) -> Int {
    guard arr1.count == arr2.count else {
        return arr1.count < arr2.count ? -1 : 1
    }
    
    var a1 = 0 
    var a2 = 0
    
    for i in arr1 {
        a1 += i
    }
    
    for i in arr2 {
        a2 += i
    }
    
    if a1 < a2 {
        return -1
    } else if a1 > a2 {
        return 1
    } else {
        return 0
    }
}