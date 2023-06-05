//
//  서울에서 김서방 찾기.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/05.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    var index = 0
    if let i = seoul.firstIndex(of: "Kim") {
        index = i
    }
    
    return "김서방은 \(index)에 있다"
}
