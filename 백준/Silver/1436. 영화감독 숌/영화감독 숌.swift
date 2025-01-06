let N = Int(readLine()!)!
var result = 0
var resultCount = 0

while true {
    result += 1
    // 6이 3개 이상 존재하는지 확인하기 위한 인스턴스
    var sixSum = 0
    
    let stringCount = String(result)
    
    for i in stringCount {
        if String(i).contains("6") {
            sixSum += 1
        } else {
            sixSum = 0
        }
        
        if sixSum == 3 {
            resultCount += 1
        }
    }
    
    if resultCount == N {
        print(result)
        break
    }
}