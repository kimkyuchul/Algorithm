//
//  짝수와 홀수.swift
//  Algorithm
//
//  Created by 김규철 on 2023/05/28.
//

func solution(_ num:Int) -> String {
    
    guard num != 0 else { return "Even" }
    
    if num % 2 == 0 {
        return "Even"
    } else {
        return "Odd"
    }
}

// return num % 2 == 0 ? "Even" : "Odd"
