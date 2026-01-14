let n = Int(readLine()!)!
var numbers = [Int]()

for i in 1...n {
    let m = Int(readLine()!)!
    numbers.append(m)
}

numbers.sort()

for i in numbers {
    print(i)
}