//
//  타입별 메모리 크기.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/15.
//

import Foundation

func solution(_ byte:[String]) -> String {
    var currentSize = 0
    var result = [Character]()
    var formattedString = ""
    
    for (_, element) in byte.enumerated() {
        switch element {
        case "BOOL":
            result += "#"
            currentSize = currentSize + 1
        case "SHORT":
            let padding = countPadding(currentSize, 2)
            
            result += String(repeating: ".", count: padding)
            result += "##"
            currentSize += 2 + padding
            
        case "FLOAT":
            let padding = countPadding(currentSize, 4)
            
            result += String(repeating: ".", count: padding)
            result += "####"
            currentSize += 4 + padding
            
        case "INT":
            let padding = countPadding(currentSize, 8)
            
            result += String(repeating: ".", count: padding)
            result += "########"
            currentSize += 8 + padding
        case "LONG":
            let padding = countPadding(currentSize, 8)
            
            result += String(repeating: ".", count: padding)
            result += "################"
            currentSize += 16 + padding
        default:
            break
        }
    }
    
    print("switch 나온 후 size = \(currentSize), result = \(result)")
    
    if currentSize % 8 != 0 {
        let sizeResult = 8 - (currentSize % 8)
        result += String(repeating: ".", count: sizeResult)
    }
        
    for (index, character) in result.enumerated() {
        formattedString.append(character)
        
        if (index + 1) % 8 == 0 && index != result.count - 1 {
            formattedString.append(",")
        }
    }
    
    return currentSize > 128 ? "HALF" : formattedString
}

func countPadding(_ currentSize: Int ,_ multiple: Int) -> Int {
    let paddingCount = currentSize % multiple == 0 ? 0 : multiple - (currentSize % multiple)
    return paddingCount
}
