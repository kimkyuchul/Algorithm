//
//  올바른 괄호.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/16.
//

import Foundation

func solution(_ s:String) -> Bool {
    
    var ans:Bool = true
    var count = 0
    
    // map을 쓰면 시간초과
    // var arr = s.map { String($0) }
    // guard !arr.isEmpty && arr.first != ")" else { return false }
      
    for i in s {
        if i == "(" {
            count += 1
        } else if i == ")" && count <= 0 {
            ans = false
            break
        }  else {
            count -= 1
        }
    }
    
    return count == 0 && ans
}
