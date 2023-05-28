//
//  배열 자르기.swift
//  Algorithm
//
//  Created by 김규철 on 2023/05/28.
//

import Foundation

func solution(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    let arr = numbers[num1...num2]
    return Array(arr)
}
