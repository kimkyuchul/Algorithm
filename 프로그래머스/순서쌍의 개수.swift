//
//  순서쌍의 개수.swift
//  Algorithm
//
//  Created by 김규철 on 2023/05/28.
//

import Foundation

func solution(_ n:Int) -> Int {
    var a = [Int]()
    for i in 1...n {
        if n % i == 0 {
        a.append(i)
        }
    }
    
    return a.count
}
