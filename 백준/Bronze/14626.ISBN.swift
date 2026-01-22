let isbn = readLine()!
var sum: Int = 0
var starIndex: Int = 0
var result: Int = 0

for (index, i) in isbn.enumerated() {
    let s = (index + 1) % 2 == 1 ? 1 : 3
    
    if i == "*" {
        starIndex = s
    } else {
        let value = Int(String(i))!
        sum += (value * s)
    }
}

for x in 0...9 {
    if (sum + (x * starIndex)) % 10 == 0 {
        result = x
        break
    }
}

print(result)
