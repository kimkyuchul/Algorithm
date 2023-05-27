let valueArr = readLine()!.split(separator: " ").map { Int(String($0.reversed()))! }
print(valueArr.max()!)
