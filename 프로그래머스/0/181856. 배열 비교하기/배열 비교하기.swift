import Foundation

func solution(_ arr1:[Int], _ arr2:[Int]) -> Int {
    guard arr1.count == arr2.count else {
        return arr1.count < arr2.count ? -1 : 1
    }
    
    if arr1.reduce(0, +) < arr2.reduce(0, +) {
        return -1
    } else if arr1.reduce(0, +) > arr2.reduce(0, +) {
        return 1
    } else {
        return 0
    }
}