//
//  점의 위치 구하기.swift
//  Algorithm
//
//  Created by 김규철 on 2023/05/28.
//

import Foundation

func solution(_ dot:[Int]) -> Int {
    if dot[0] > 0 && dot[1] > 0 {
        return 1
    } else if dot[0] < 0 && dot[1] > 0 {
        return 2
    } else if dot[0] < 0 && dot[1] < 0 {
        return 3
    } else {
        return 4
    }
}
