import Foundation

let N = Int(readLine()!)!

// 맵 2중 배열
var map: [[Int]] = []

// 방문 여부 확인
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

// 도착 가능 여부
var canJump = false

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
}

func dfs(x: Int, y: Int) {
    if x <= -1 || x >= N || y <= -1 || y >= N || visited[x][y] {
        return
    }
    
    if map[x][y] == -1 {
        canJump = true
        return
    }
    
    visited[x][y] = true
    
    let location = map[x][y]
    
    // 오른쪽으로 칸 정수만큼 이동
    dfs(x: x + location, y: y)
    // 아래쪽으로 칸 정수만큼 이동
    dfs(x: x, y: y + location)
}

dfs(x: 0, y: 0)

print(canJump ? "HaruHaru" : "Hing")
