//배열로 해보다가 실패
/*
var num:[Int] = []
var num1:[Int] = []

for _ in 0...10 {
    num.append(Int(readLine()!)!)
}
for i in 0...10 {
    if ((num[i] % 42) != 0) {
        num1.append(i)
    }
    print(num1.count)
}
*/

// SET이 중요하구만... Set는 배열과 유사하기는 하지만, 고유한 값들을 갖는 컬렉션 타입의 하나이다.
var num: Set<Int> = []
for _ in 1...10 {
    num.insert(Int(readLine()!)! % 42)
}
print(num.count)
