//
//  나누어 떨어지는 숫자 배열.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/05.
//

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    
    //arr.sorted().filter도 방법
    let countArray = arr.filter { $0 % divisor == 0 }

    return countArray.count > 0 ? countArray.sorted() : [-1]
}
