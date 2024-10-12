import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    let totalNeeded = needMoney(price, count)
    let result = totalNeeded - Int64(money)
    
    // 주어진 돈이 충분하면 0을 반환
    return result > 0 ? result : 0
}

private func needMoney(_ price: Int, _ count: Int) -> Int64 {
    var needMoney = Int64(0)
    
    for i in 1...count {
        needMoney += Int64(price * i)
    }
    
    return needMoney
}