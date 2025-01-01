import Foundation

// 어떤 것을 이분 탐색 해야 하는가? -> 구해야 할 것은 시간의 최솟 값 즉, 1부터 심사가 걸리는 최댓값을 기준으로 이분탐색을 진행해야 함
func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let sortTimes = times.sorted()
    // 모든 사람이 심사를 받는 최소 시간
    var start = 1
    // 모든 사람이 심사를 받는 최대 시간 (times 배열의 가장 큰 수와 심사받을 사람의 수를 곱한 값)
    var end = sortTimes.max()! * n
    var result = 0
    
    // 최소 시간이 최대 시간과 같거나 더 커질때까지 진행
    while start <= end {
        // 기준 시간 (1 + 60) / 2 = 30
        let mid = (start + end) / 2
        
        // 30분이 지났을 때 검사가 끝난 사람들은 몇명인지 저장하는 변수
        var p = 0
        
        // 0 += (30 / 7) => 4 += (30 / 10) -> 7
        // 주어진 시간(mid) 동안 처리 가능한 사람의 수 
        sortTimes.forEach {
            p += (mid / $0)
        }
        
        
        if p < n { // p보다 n이 클 시 검사 범위를 16 ~ 29로 만듬
            start = mid + 1
        } else { // n보다 p(중간 시간에서 검사가 끝난 사람들의 수)가 클 시 검사범위를 1 ~ 29로 줄임 
            end = mid - 1
            result = mid
        }
    }
    
    return Int64(result)
}