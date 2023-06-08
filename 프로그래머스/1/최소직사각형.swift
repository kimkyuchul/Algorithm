//
//  최소직사각형.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/08.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var size = sizes
    let count = sizes.count
    var x :[Int] = []
    var y :[Int] = []
    
    for i in 0..<count {
        //내림차순
        size[i].sort()
        print(size[i].sort())
        x.append(size[i][0])
        y.append(size[i][1])
    }
    
    return (x.max()!) * (y.max()!)
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))

// 가로의 가장 큰 수와 세로의 가장 큰 수를 찾으면 되는 문제
