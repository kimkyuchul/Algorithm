//
//  모의고사.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/19.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let a = [1,2,3,4,5]
    let b = [2, 1, 2, 3, 2, 4, 2, 5]
    let c = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var dic = [Int: Int]()
    
    for i in 0..<answers.count {
        // a[i] <- 이런식으로 하게되면 당연히 a 배열보다 긴 답이 들어오게되면 실행 오류가 나게 됨
        if answers[i] == a[i % a.count] { dic[1] = (dic[1] ?? 0) + 1 }
        if answers[i] == b[i % b.count] { dic[2] = (dic[2] ?? 0) + 1 }
        if answers[i] == c[i % c.count] { dic[3] = (dic[3] ?? 0) + 1 }
    }
    
    let max = dic.values.max()!
    
    return dic.filter { $0.value == max }.keys.sorted()
}
