import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!

@IBAction func group(_ sender: UIButton) {
    let group = DispatchGroup()
    
    DispatchQueue.global(qos: .background).async(group: group) {
        for i in 1...50 {
            print(i, terminator: " ")
        }
        print("\nBackground 완료")
