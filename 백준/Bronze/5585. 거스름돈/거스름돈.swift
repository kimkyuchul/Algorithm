var money = 1000 - Int(readLine()!)!
let array = [500, 100, 50, 10, 5, 1]
var result = 0

for coin in array {
    if coin <= money {
    result += money / coin
    money = money % coin
    }
}

print(result)