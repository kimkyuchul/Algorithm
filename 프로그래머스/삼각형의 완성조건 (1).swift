func 삼각형의완성조건(_ sides:[Int]) -> Int {
    
    guard 0 > sides.count || sides.count < 4  else { return 2 }
    
    let max = sides.max() ?? 0
    var a = 0
    
    
    for i in 0..<sides.count {
        if max != sides[i] {
            a = a + sides[i]
        } else if max == sides[i] {
            return 1
        }
    }
    
    if max >= a {
        return 2
    } else {
        return 1
    }
}

// 삼항연산자와 sort를 사용하면 쉽게 해결 가능
