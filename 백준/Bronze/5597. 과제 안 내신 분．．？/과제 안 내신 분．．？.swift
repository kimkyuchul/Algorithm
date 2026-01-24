
import Foundation

var students: [Int] = []
var defaultStudents = (1...30).map { $0 }

for i in 0..<28 {
    let n = Int(readLine()!)!
    students.append(n)
}

for student in defaultStudents {
    if students.contains(student) {
        defaultStudents.removeAll(where: { $0 == student })
    }
}

for i in defaultStudents.sorted() {
    print(i)
}