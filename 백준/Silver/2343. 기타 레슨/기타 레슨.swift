import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
// 강의의 수
let N = input[0]
// 블루레이 갯수
let M = input[1]

// 기타 강의의 길이가 강의 순서대로 분 단위로(자연수) ex( [1,2,3,4,5,6,7]
let lectures = readLine()!.split(separator: " ").map { Int(String($0))! }
var start = lectures.max()!
var end = lectures.reduce(0, +)

while start < end {
    let mid = (start + end) / 2
    
    var blueRayCount = 1
    var blueRaySize = 0
    
    for lecture in lectures {
        // 현재 강의를 담았을 때 블루레이 용량을 초과하는지 체크
        if blueRaySize + lecture > mid {
            // 새로운 블루레이 사용
            blueRayCount += 1
            // 새 블루레이를 사용하므로 사이즈를 원복 시킨다
            blueRaySize = lecture  // 수정된 부분
        } else {
            // 현재 강의를 블루레이에 추가
            blueRaySize += lecture
        }
    }
    
    if blueRayCount <= M {
        end = mid
    } else {
        start = mid + 1
    }
}

print(start)