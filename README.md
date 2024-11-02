# Stack
<details> <summary>Stack?</summary>
    
- 스택은 후입선출(Last In First Out LIFO) 원칙을 따른다.
- 마지막에 추가된 요소가 가장 먼저 제거되는 요소의 집합
- 스택에서의 연산은 요소를 스택에 추가하는 푸시와 스택의 맨위 요소를 제거하는 팝

```swift
struct Stack<T> {
    private var array: [T] = []
    
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() {
        array.popLast()
    }
}

var stack = Stack<Int>()

stack.push(123)
stack.push(23)
stack.pop()

print(stack)
```
</details>

# Queue
<details> <summary>Queue?</summary>
    
- Queue는 선입선출(FIFO)
- 가장 먼저 추가된 요소가 가장 먼저 제거된다.
- 후방에 요소를 추가하는 인큐
- 전방에 요소를 제거하는 디큐

```swift
struct Queue<T> {
    
    private var array: [T] = []
    
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        }
        
        return array.removeFirst()
    }
}

var queue = Queue<String>

queue.enqueue("gd")
queue.enqueue("gdd")
queue.enqueue("gddd")

queue.dequeue()

print(queue)

```
</details>

# 연결리스트
<details> <summary>단일연결리스트 && 이중연결리스트</summary>

- 연결 리스트는 노드의 시퀸스로  구성된 데이터 구조
- 각 노드는 값을 포함하고, 리스트의 다음 노드에 대한 참조를 포함
- 연결리스트는 배열과 다르게 고정 크기가 없으며, 동적으로 늘거나 줄어들 수 있다.
- 리스트의 첫번째 노드는 헤드라고 한다. 마지막 노드는 테일이라고 함 테일 노드는 nil을 가르켜 끝을 나타낸다.

연결리스트 유형

- 단일 연결 리스트: 이 유형에서는 각 노드가 리스트의 다음 노드에 대한 참조만 소유
- 이중 연결 리스트: 다음 노드와 이전 노드에 대한 각 참조를 가지고 있다
- 원형 연결 리스트: 테일 노드가 헤드 노드를 가르킨다 → 원형 구조

배열은 원소에 접근하는 것은 빠르지만 중간 삽입/삭제가 느리다. (인덱스로 접근)

링크드 리스트는 중간 삽입/삭제가 빠르지만 원소의 탐색이 느립니다 (다음 노드의 위치를 가지고 있기 때문에 연속적으로 저장할 필요 X)

## 단일 연결 리스트

### 노드 만들기

```swift
final class Node<T> {
    // value는 내 데이터를 저장
    var value: T
    // next는 내 다음 데이터의 주소값을
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}
```

### **append(data:)**

```swift
    func append(value: T?) {
        if head == nil {
            head = Node(value: value)
        }
        
        var node = head
        
        // append의 경우, 연결리스트의 가장 마지막 노드를 찾아내어 그 뒤에 추가해주면 되는데,
        // 노드의 가장 마지막을 찾아내는 방법은 head 노드부터 순회하며, node.next가 nil인 경우를 찾으면 됨
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = Node(value: value)
    }
```

- **연결 리스트 맨 마지막에 노드 추가**
- 노드의 가장 마지막을 찾아내는 방법은 **head 노드부터 순회**하며, **node.next가 nil인 경우**를 찾으면 됨

### **insert(data:at:)**

- **연결 리스트 중간에 노드 추가하기**

```swift
    func insert(value: T?, index: Int) {
        //head가 없는 경우 Node를 생성 후 head로 지정한다
        if head == nil {
            head = Node(data: value)
            return
        }
        
        var node = head
        // index만큼 반복하면서 head부터 계속 node를 next로 지정
        for _ in 0..<(index - 1) {
            if node?.next == nil {
                break
            }
            node = node?.next
        }
        
        let nextnode = node?.next
        // 인덱스만큼 돌려서 나온 node의 next에 insert
        node?.next = Node(data: data)
        // nextnode로 미리 저장해뒀던 (전에 연결되어있던 node) node를 next 노드의 next로 연결
        node?.next?.next = nextNode
    }
}
```

### **removeLast**

- **연결 리스트 맨 마지막 노드 삭제하기**
- delete할 노드의 **바로 이전 노드의 next를 nil로 설정하면 연결이 끊기면서 delete할 노드가 사라짐**

```swift
    // 맨 마지막 노드 제거
    func removeLast() {
        if head == nil { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        // next의 next가 nil이 아닐때
        while node?.next?.next != nil {
            node = node?.next
        }
        
        //next의 next가 nil이면 맨 마지막 친구다.
        // 어차피 맨 마지막 노드의 next는 nil일테니
        node?.next = node?.next?.next
    }
```

- **노드가 가르키는 다음 노드의 next가 nil이라면 마지막 친구**

### **remove(at:)**

```swift
    func remove(index: Int) {
        if head == nil {
            return
        }
        
        if head?.next == nil || index == 0 {
            head = head?.next
        }
        
        var node = head
        // delete할 노드의 바로 이전 노드의 next를 delete 할 노드의 next로 바꿔준다.
        for _ in 0..<(index - 1) {
            // 마지막 노드일 때
            if node?.next?.next == nil { break }
            node = node?.next
        }
        
        // delete할 노드의 바로 이전 노드의 next를 delete 할 노드의 next로 바꿔준다.
        node?.next = node?.next?.next
    }
}
```

- delete할 노드의 바로 이전 노드의 next를 delete 할 노드의 next로 바꿔준다. ← 강조

</details>
