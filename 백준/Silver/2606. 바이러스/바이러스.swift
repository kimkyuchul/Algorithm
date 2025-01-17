import Foundation

// 컴퓨터의 수
let computerCount = Int(readLine()!)!
// 네트워크 상에서 직접 연결되어 있는 컴퓨터 쌍의 수
let networkCount  = Int(readLine()!)!

// count: computerCount + 1 -> 바이러스가 무조건 1부터 시작하기 때문에 배열은 0부터 시작하니 1 추가 해줌
/*
 [
     [], // 빈 배열
     [], // 빈 배열
     [], // 빈 배열
     [], // 빈 배열
     [], // 빈 배열
     [], // 빈 배열
     [], // 빈 배열
     []  // 빈 배열
 ]
 */
var network = Array(repeating: [Int](), count: computerCount + 1)

var visited = Array(repeating: false, count: computerCount + 1)

var result = 0

for _ in 0..<networkCount {
    // ex) [1, 2]
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let a = row[0]
    let b = row[1]
    
    network[a].append(b)
    network[b].append(a)
}

func dfs(node: Int) {
    visited[node] = true
    
    for i in network[node] {
        if !visited[i] {
            dfs(node: i)
            result += 1
        }
    }
}

dfs(node: 1)
print(result)