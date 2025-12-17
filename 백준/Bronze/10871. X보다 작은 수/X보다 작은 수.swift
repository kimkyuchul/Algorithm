let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x) = (input[0], input[1])

let numbers = readLine()!.split(separator: " ").map { Int($0)! }

var result = numbers.filter { $0 < x }.map { String($0) }.joined(separator: " ")

print(result)
