import Foundation

let T = Int(readLine()!)!
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func testCase() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let M = input[0]
    let N = input[1]
    let K = input[2]
    
    var baechu = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    var result = 0
    
    for _ in 0..<K {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = row[0]
        let y = row[1]
        baechu[y][x] = 1
    }
    
    for y in 0..<N {
        for x in 0..<M {
            if baechu[y][x] == 1 {
                dfs(x: x, y: y, baechu: &baechu, M: M, N: N)
                result += 1
            }
        }
    }
    
    print(result)
}

func dfs(x: Int, y: Int, baechu: inout [[Int]], M: Int, N: Int) {
    // 방문 표시를 위해 값을 2로 변경
    baechu[y][x] = 2
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0 && nx < M && ny >= 0 && ny < N {
            if baechu[ny][nx] == 1 {  // 아직 방문하지 않은 배추인 경우
                dfs(x: nx, y: ny, baechu: &baechu, M: M, N: N)
            }
        }
    }
}

for _ in 0..<T {
    testCase()
}