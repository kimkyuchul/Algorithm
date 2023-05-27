var num:[Int] = []

for _ in 0...8 {
    num.append(Int(readLine()!)!)
}
for i in 0...8 {
    if num[i] == num.max() {
        print(num.max()!)
        print(i+1)
    }
}
