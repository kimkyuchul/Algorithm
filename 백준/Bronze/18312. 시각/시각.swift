let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
var result = 0

(0...n).forEach { hour in
    (0...59).forEach { m in
        (0...59).forEach { s in
            if hour / 10 == k || hour % 10 == k || m / 10 == k || m % 10 == k || s / 10 == k || s % 10 == 3 {
                result += 1
            }
        }
    }
}

print(result)