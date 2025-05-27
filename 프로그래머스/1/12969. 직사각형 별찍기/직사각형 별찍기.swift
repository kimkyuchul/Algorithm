import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for i in 0..<b {
    for x in 0..<a {
        print("*", terminator: "")
    }
    print()
}