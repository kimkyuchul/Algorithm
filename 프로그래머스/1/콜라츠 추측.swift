//
//  콜라츠 추축.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/08.
//

import Foundation

func odd(_ n: Int) -> Int {
    return n * 3 + 1
}

func even(_ n: Int) -> Int {
    return n / 2
}

// 주어진 수가 6이라면 6 → 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1 이 되어 총 8번 만에 1

func solution(_ num:Int) -> Int {
    var ans = num
    var count = 0
    while ans != 1 && count < 500 {
        ans = ans % 2 == 0 ? even(ans) : odd(ans)
        count += 1
    }
    return count >= 500 ? -1 : count
}

