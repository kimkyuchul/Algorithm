//
//  최솟값 만들기.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/16.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    var a = A.sorted()
    var b = B.sorted(by: >)
    
    for i in 0..<A.count {
        ans = ans + (a[i] * b[i])
    }
    return ans
}
