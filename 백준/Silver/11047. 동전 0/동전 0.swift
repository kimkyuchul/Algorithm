let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var k = input[1]

var coins: [Int] = []
var result: Int = 0

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

for coin in coins.reversed() {
    if k >= coin {
        let a = k / coin
        k = k % coin
        result += a
    }
}

print(result)