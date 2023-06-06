//
//  배열 앞 뒤 값을 비교하고 중복되는 횟수를 카운트.swift
//  Algorithm
//
//  Created by 김규철 on 2023/06/06.
//

import Foundation

func solution(_ arr: [Int]) -> [Int] {
    var result: [Int] = []
    var countDict: [Int: Int] = [:]
    
    // arr 배열에서 숫자를 하나씩 가져온다. 이 숫자는 num 변수에 할당됩니다.
    for num in arr {
        // countDict 딕셔너리에서 현재 숫자 num을 키로 가지는 값이 있는지 확인
        if let count = countDict[num] {
            // 이미 존재하는 숫자이므로 count 변수에 1을 더하고, 이 값을 countDict 딕셔너리에 다시 할당하여 숫자의 출현 횟수를 업데이트
            countDict[num] = count + 1
        } else {
            // countDict 딕셔너리에서 현재 숫자 num을 키로 가지는 값이 존재하지 않는 경우입니다. (처음 등장하는 숫자)
            // countDict[num] = 1을 통해 해당 숫자의 출현 횟수를 1로 설정
            // 즉, [1:1]
            countDict[num] = 1
        }
    }
    print(countDict)
    
    for (_, count) in countDict {
        if count > 1 {
            result.append(count)
        }
    }
    
    return result.isEmpty ? [-1] : result
}

let arra = [1, 2, 3, 3, 3, 3, 4, 4]
let result = solution(arra)
print(result)

/*
// 1. Subscript로 추가하기
dict1["weight"] = 100                                // 해당 Key가 없다면, 추가 (insert)
dict1["height"] = 200                                // 해당 Key가 있다면, Value 덮어쓰기 (update)
 
// 2. updateValue(:forKey)
dict1.updateValue(100, forKey: "weight")             // 해당 Key가 없다면, 추가하고 nil 리턴 (insert)
dict1.updateValue(200, forKey: "height")             // 해당 Key가 있다면, Value 덮어쓰고 덮어쓰기 전 값 리턴 (update)
*/

// https://taekki-dev.tistory.com/m/117 딕셔너리 참고

