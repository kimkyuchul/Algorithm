import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!

if a >= 1 && b >= 1 {
    print("1")
} else if  a <= -1 && b >= 1 {
    print("2")
} else if a <= -1 && b <= -1 {
    print("3")
} else if a >= 1 && b <= -1 {
    print("4")
}

// 다른 머리가 좋은 방법

    if a >= 1 {
        if b >= 1 {
            print(1)
        }else {
            print(4)
        }
    } else {
        if b >= 1 {
            print(2)
        } else {
            print(3)
        }
    }
