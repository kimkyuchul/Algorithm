import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
// 방 바닥의 세로 크기N
let N = input[0]
// 방 바닥의 가로 크기M
let M = input[1]

// 방 바닥 2중배열
var board: [[Character]] = []

// 방바닥 문양
let Horizontal: Character = "-"
let Vertical: Character = "|"

// 방문 여부 확인
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

// 방 바닥을 장식하는데 필요한 나무 판자의 개수를 출력
var count = 0

for _ in 0..<N {
    let input = Array(readLine()!)
    board.append(input)
}

for i in 0..<N {
    for j in 0..<M {
        if !visited[i][j] {
            // 어떤 DFS 함수를 호출할지 결정하는 용도
            if board[i][j] == Horizontal {
                dfs(x: i, y: j, boardString: Horizontal)
                count += 1
            } else if board[i][j] == Vertical {
                dfs(x: i, y: j, boardString: Vertical)
                count += 1
            }
        }
    }
}

func dfs(x: Int, y: Int, boardString: Character) {
    if x >= N || y >= M || visited[x][y] || board[x][y] != boardString {
        return
    }
    
    visited[x][y] = true
    // -(Horizontal) 이면 0, |(Vertical) 이면 1
    let newX = boardString == Horizontal ? x : x + 1
    // -(Horizontal) 이면 1, |(Vertical) 이면 0
    let newY = boardString == Vertical ? y : y + 1
    dfs(x: newX, y: newY, boardString: boardString)
}

print(count)