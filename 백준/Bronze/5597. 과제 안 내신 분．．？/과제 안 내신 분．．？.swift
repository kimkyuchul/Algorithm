import Foundation

var students: [Int] = []

for i in 0..<28 {
    let n = Int(readLine()!)!
    students.append(n)
}

for student in (1...30).map({ $0 }) {
    if !students.contains(student) {
        print(student)
    }
}

/*
var nums: Set<Int> = []
for _ in 1...28 {
    nums.insert(Int(readLine()!)!)
}

for i in 1...30 {
    if !nums.contains(i) {
        print(i)
    }
}
*/