let n = Int(readLine()!)!
var q = CardQueue()

for i in 1...n {
    q.cards.append(i)
}

for i in 0..<q.cards.count - 1 {
    q.logic()
}

print(q.cards[q.head])

struct CardQueue {
    var cards: [Int] = []
    var head: Int = 0

    mutating func logic() {
        head += 1
        
        cards.append(cards[head])
        
        head += 1
    }
}