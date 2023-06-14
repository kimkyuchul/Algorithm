//
//  짝지어 제거하기 .swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/14.
//

import Foundation

func solution(_ s:String) -> Int{
    var stack = [Character]()
    
    for i in s {
        if let top = stack.last, top == i {
            stack.removeLast()
        } else {
            stack.append(i)
            }
        }
    
    return stack.isEmpty ? 1 : 0
}
