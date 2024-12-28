let input = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
print("\(input[0]) \(input[1]) \(input[2])")