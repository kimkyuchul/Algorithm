//
//  콜라 문제.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/17.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    
    var count = 0
    var n = n
    
    while n >= a {
        n = n - a + b
        count += b
    }
    
    return count
}
