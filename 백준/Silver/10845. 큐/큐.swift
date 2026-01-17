let n = Int(readLine()!)!
var q = Queue()

for i in 0..<n {
    let line = readLine()!.split(separator: " ")
    let cmd = line[0]
    
    switch cmd {
    case "push":
        let x = Int(line[1])!
        q.push(x)
        
    case "pop":
        q.pop()
        
    case "size":
        q.size()
        
    case "empty":
        q.empty()
        
    case "front":
        q.front()
        
    case "back":
        q.back()
        
    default:
        break
    }
}

struct Queue {
    var array: [Int] = []
    
    mutating func push(_ x: Int) {
        array.append(x)
    }
    
    mutating func pop() {
        guard !array.isEmpty else {
            print(-1)
            return
        }
        
        print(array.removeFirst())
    }
    
    func size() {
        print(array.count)
    }
    
    func empty() {
        print(array.isEmpty ? 1 : 0)
    }
        
    func front() {
        guard let first = array.first else {
            print(-1)
            return
        }
        
        print(first)
    }
    
    func back() {
        guard let last = array.last else {
            print(-1)
            return
        }
        
        print(last)
    }
}