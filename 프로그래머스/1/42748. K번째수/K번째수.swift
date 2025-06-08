import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for i in commands {
        let firstRange = i[0] - 1
        let lastRange = i[1] - 1
        let sort = i[2] - 1
        
        let resultArray = array[firstRange...lastRange].sorted()
        let sortArray = resultArray[sort]
        
        result.append(sortArray)
    }
    return result
}