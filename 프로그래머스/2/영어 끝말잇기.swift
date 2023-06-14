//
//  영어 끝말잇기.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/14.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var arr = [String]()
    
    for (i, word) in words.enumerated() {
        if !arr.isEmpty && (arr.contains(word) || arr[i-1].last != word.first) {
            return [(arr.count % n) + 1, (arr.count / n) + 1]
        } else {
            arr.append(word)
        }
    }
    
    return [0,0]
}
