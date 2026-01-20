let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var result: [Int] = Array(repeating: 0, count: n)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let i = edge[0] - 1
    let j = edge[1] - 1
    let k = edge[2]
    
    for x in i...j {
        result[x] = k
    }
}

print(result.map(String.init).joined(separator: " "))