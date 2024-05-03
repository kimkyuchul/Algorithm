let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let input1 = input[0]
var input2 = input[1]

var coins: [Int] = []
var result = 0

for _ in 1...input1 {
    coins.append(Int(readLine()!)!)
}

coins = Array(coins.reversed())

for coin in coins {
    if coin <= input2 {
       result += (input2 / coin)
       input2 = (input2 % coin)
    }
    
    if input2 == 0 {
        break
    } 
}

print(result)