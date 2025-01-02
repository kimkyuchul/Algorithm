import Foundation

// 상근이가 가지고 있는 숫자 카드의 개수
let N = Int(readLine()!)!
//  숫자 카드에 적혀있는 정수
var nValues = readLine()!.split(separator: " ")

let M = Int(readLine()!)!
// 상근이가 몇 개 가지고 있는 숫자 카드인지 구해야 할 M개의 정수
var mValues = readLine()!.split(separator: " ")

// 이진탐색 할 배열
let nArray = nValues.map { Int(String($0))! }.sorted()
// 키 값으로 쓸 배열
let mArray = mValues.map { Int(String($0))! }
var answer = ""

// 중복된 값들 중에 가장 앞에 있는 인덱스 (first)
func lowerBound(_ key: Int) -> Int {
    var start = 0
    var end = nArray.count
    
    while start < end {
        let mid = (start + end) / 2
        
        // nArray는 정렬한 상태이기 때문에 1,2,3,4,5 이런 형식으로 구성
        if nArray[mid] < key { // 중간값이 찾는 값보다 작으면
            start = mid + 1 // 시작점을 중간 다음으로
        } else { // 중간값이 찾는 값보다 크거나 같으면
            end = mid // 끝점을 중간으로
        }
    }
    
    return end // 찾는 값 이상이 처음 나타나는 위치! ex 1,2,2,3,4이면 index 1이 반환
}

// 중복된 값들 중에 가장 뒤에 있는 인덱스의 + 1 (last + 1)
func upperBound(_ key: Int) -> Int {
    var start = 0
    var end = nArray.count
    
    while start < end {
        let mid = (start + end) / 2
        
        if nArray[mid] <= key { // 중간값이 찾는 값보다 작거나 같으면
            start = mid + 1 // 시작점을 중간 다음으로
        } else { // 중간값이 찾는 값보다 크면
            end = mid
        }
    }
    
    return end // 찾는 값보다 큰 값이 처음 나타나는 위치 ! ex 1,2,2,3,4이면 index 4를 반환
}

mArray.forEach { num in
    answer += "\(upperBound(num) - lowerBound(num)) "
}

print(answer)