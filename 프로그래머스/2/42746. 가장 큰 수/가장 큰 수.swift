import Foundation

func solution(_ numbers:[Int]) -> String {
// 삽입정렬은 시간초과
//     var resultArray: [Int] = []
    
//     for i in numbers {
//          var inserted = false
        
//        for j in 0..<resultArray.count {
//             let firstString = String(resultArray[j]) + String(i)
//             let lastString = String(i) + String(resultArray[j])
            
//             if Int(firstString)! < Int(lastString)! {
//                 resultArray.insert(i, at: j)
//                 inserted = true
//                 break
//             }
//         }
        
//          if !inserted {
//             resultArray.append(i)
//         }
//     }
    
//     var result = resultArray.map { String($0) }
      
//     return result.joined()
    
     let sortedResultArray = numbers.sorted { a, b in
        let ab = String(a) + String(b)
        let ba = String(b) + String(a)
        return ab > ba
    }
    
    let result = sortedResultArray.map { String($0) }.joined()
    
    if result.first == "0" {
        return "0"
    }
    
    return result
}