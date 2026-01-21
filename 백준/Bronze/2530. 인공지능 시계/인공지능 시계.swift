let input = readLine()!.split(separator: " ").map { Int($0)! }
let h = input[0]
let m = input[1]
let s = input[2]

let time = Int(readLine()!)!

let totalSeconds = h * 3600 + m * 60 + s + time
// 3600 = 60 * 60  => 1분 = 60초, 1시간 = 60분 (60 × 60 = 3600초)
let resultHour = (totalSeconds/3600) % 24
let resultMin = (totalSeconds%3600) / 60
let resultSecond = totalSeconds % 60

print("\(resultHour) \(resultMin) \(resultSecond)")