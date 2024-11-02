//: [Previous](@previous)

import Foundation

let input = Int(readLine()!)!

var queue: [Int] = []

func push(_ v: Int) {
    queue.append(v)
}

func pop() -> Int {
    if queue.isEmpty {
        return -1
    } else {
        return queue.removeFirst()
    }
}

func size() -> Int {
    return queue.count
}

func empty() -> Int {
    if queue.isEmpty {
        return 1
    } else {
        return 0
    }
}


func front() -> Int {
    return queue.first ?? -1
}

func back() -> Int {
    return queue.last ?? -1
}

for _ in 0..<input {
    let result = readLine()!.split(separator: " ").map { String($0) }
    
    
    switch result[0] {
    case "push":
        push(Int(result[1])!)
        
    case "pop":
        print(pop())
        
    case "size":
        print(size())
        
    case "empty":
        print(empty())
        
    case "front":
        print(front())
        
    case "back":
        print(back())
    
    default:
        break
    }
}

