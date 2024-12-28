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

# 연결리스트

- 연결 리스트는 노드의 시퀸스로  구성된 데이터 구조
- 각 노드는 값을 포함하고, 리스트의 다음 노드에 대한 참조를 포함
- 연결리스트는 배열과 다르게 고정 크기가 없으며, 동적으로 늘거나 줄어들 수 있다.
- 리스트의 첫번째 노드는 헤드라고 한다. 마지막 노드는 테일이라고 함 테일 노드는 nil을 가르켜 끝을 나타낸다.
- 특정 요소 접근 시 O(n) 시간 복잡도

연결리스트 유형

- 단일 연결 리스트: 이 유형에서는 각 노드가 리스트의 다음 노드에 대한 참조만 소유
- 이중 연결 리스트: 다음 노드와 이전 노드에 대한 각 참조를 가지고 있다
- 원형 연결 리스트: 테일 노드가 헤드 노드를 가르킨다 → 원형 구조

*배열은 원소에 접근하는 것은 빠르지만 중간 삽입/삭제가 느리다. (인덱스로 접근)*

- index만 알고 있다면 O(1)의 시간복잡도로 원소에 접근
- "연속적으로 저장된다"는 개념때문에 1~n-1번째 원소를 삭제할 때 연산의 오버헤드가 발생한다는 단점
- 계속 당겨와야하기 때문이다. 삭제한 자리를 채우기 위해
- 배열은 고정 크기를 지정해야 한다. 동적 크기 확장 시 추가 메모리

*링크드 리스트는 중간 삽입/삭제가 빠르지만 원소의 탐색이 느립니다 (다음 노드의 위치를 가지고 있기 때문에 연속적으로 저장할 필요 X)*

- 링크드 리스트는 현재 노드가 다음 노드의 주소를 가지고 있다는 점
- 다음 노드의 위치를 가지고 있기 때문에 연속적으로 저장할 필요가 없다.
- 따라서 중간 삽입, 삭제를 해도 연산의 오버헤드가 발생하지 않아 O(1)의 시간복잡도 → 포인터만 변경하면 되므로 O(1)
- 하지만 index로 원소의 접근이 불가능하여 원소를 찾는데 O(n)의 시간 복잡도가 발생 (양방향 리스트도 배열보단 느림)
- 동적 크기 할당 → 메모리가 허용하는 한 계속 확장 가능

동작     | 배열    | 링크드 리스트
접근     | O(1)    | O(n)
검색     | O(n)    | O(n)
삽입     | O(n)    | O(1)
삭제     | O(n)    | O(1)

**사용 상황별 비교**

배열이 유리한 경우:

1. 빈번한 조회 작업
2. 데이터 크기가 고정적
3. 순차적 접근이 많은 경우

링크드 리스트가 유리한 경우:

1. 빈번한 삽입/삭제 작업
2. 데이터 크기가 가변적
3. 메모리 공간이 흩어져 있어도 괜찮은 경우

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

## 양방향 연결 리스트

- 양뱡향 연결 리스트를 사용하는 이유?
    - 마지막에서 역행하여 탐색할 수 있기 때문
    - 얘를 들어 길이가 10인 링크드 리스트에서 7번째 노드를 가야 한다면
    - 기존 단방향 링크드 리스트는 → 7번 이동
    - 양뱡향 리스트는 마지막부터 3번만 이동
    - 3, 1, 5번째 노드를 차례대로 탐색 → 첫 번째 3번을 탐색하고 커서를 3번으로 설정
        - 만약 단방향이였다면 다시 1번째로 이동
        - 그러나 양뱡향이기 때문에 3에서 뒤로 2번 이동
        - 그 다음 다시 5번째로 이동
        - 이전 노드를 알 수 있는 것만으로도 마지막 노드를 참조하는 것은 O(n)에서 O(1)

- **가장 첫 노드**를 가리키는 **head**와, **가장 마지막 노드**를 가리키는 **tail**을 두고, 내 **이전 노드**와, 내 **다음 노드** 두 노드를 **모두** **연결**

```swift
// 단방향과 똑같으나, 내 이전 노드를 알아야 하니, prev라는 놈이 추가
final class Node<T> {
    // prev란 내 이전 노드의 주소값
    var prev: Node?
    // data는 내 데이터를 저장
    var value: T
    // next는 내 다음 노드의 주소값
    var next: Node?
    
    init(prev: Node? = nil, value: T, next: Node? = nil) {
        self.prev = prev
        self.value = value
        self.next = next
    }
}

final class DoublyLinkedList<T: Equatable> {
    private var head: Node?
    private var tail: Node?
    private var size = 0 // 링크드 리스트의 크기
```

### **append(data:)**

- **연결 리스트 맨 마지막에 노드 추가하기**

```swift
    func append(_ value: T) {
        
        //연결 리스트가 빈 경우, Node를 생성 후 head, tail로 지정한다
        if head == nil || tail == nil {
            head = Node(value: value)
            tail = head
            return
        }
        
        let newNode = Node(value: value)
        // 현재 tail의 next에다가 newNode를 연결
        tail?.next = newNode
        // newNode의 prev를 현재 tail로 연결
        newNode.prev = tail
        // tail은 늘 마지막 노드를 가리켜야 하니, tail을 newNode로
        tail = newNode
        
        size += 1
    }
```

1. 현재 tail의 next에다가 newNode를 연결 (가장 뒤에 연결할거기 떄문)
2. newNode의 prev를 현재 tail로 연결 ( tail의 뒤에 연결 될 거기 때문에 newNode의 prev는 현재 tail)
3.  tail은 늘 마지막 노드를 가리켜야 하니, tail을 newNode로
4. size를 1 더한다.

### **insert**

- 인자로 받는 index가 head와 가까우면 head부터 next를 이용해 탐색
- tail과 가까우면 tail부터 prev를 이용해 탐색

```swift
    func insert(_ value: T, index: Int) {
        //연결 리스트가 빈 경우, Node를 생성 후 head, tail로 지정한다
        if head == nil || tail == nil {
            head = Node(value: value)
            tail = head
            return
        }
        
        if index == 0 {
            let newNode = Node(value: value)
            // newNode가 헤드가 되야 하기 때문에 newNode의 next는 한칸 앞으로간 현재 헤드
            newNode.next = head
            // 한칸 앞으로 간 헤드의 뒷방향은 newNode
            head?.prev = newNode
            // 헤드는 newNode가 된다.
            head = newNode
            
            size += 1
            return
        } else if index >= size {
            let newNode = Node(value: value)
            
            // newNode가 tail이 되어야 하기 때문에 newNode의 prev는 한칸 뒤로간 현재 tail
            newNode.prev = tail
            // 한칸 뒤로 밀려난 tail의 next는 tail이 될 newNode
            tail?.next = newNode
            // tail은 newNode
            tail = newNode
            
            size += 1
            return
        } else {
            let half = (size / 2)
            let isForward = (index <= half)
            
            var node: Node?
            
            if isForward {
                node = head
                for _ in 0..<index {
                    // 헤드의 next부터 시작
                    guard let next = node?.next else { return break }
                    node = next
                }
            } else {
                node = tail
                for _ in 0..<(size - index) {
                    guard let prev = node?.prev else { return break }
                    node = prev
                }
                
                // 노드의 다음 노드의 이전 노드는 새로운 노드
                let newNode = Node(value: vale)
                node?.next?.prev = newNode
                // 삽입할 노드의 이전 방향은 노드
                newNode.prev = node
                // 노드의 다음은 새로운 노드
                node?.next = newNode
                
                size += 1
                return
            }
            
        }
    }
```

- if index == 0  → 헤드에 바로 넣으면 된다.
- else if index >= size → tail에 바로 넣으면 된다.
- 둘다 아니라면?
    - size를 반으로 나눈 뒤 index 보다 size를 반으로 나눈 값이 같거나 더 클 경우 → 뒤부터
    - 반대라면 앞부터 순회한다.

### 중간 삽입 시 코드 이해하기

```swift

                let newNode = Node(value: vale)
                // 노드의 다음 노드의 이전 노드는 새로운 노드
                node?.next?.prev = newNode
                // 삽입할 노드의 이전 방향은 노드
                newNode.prev = node
                // 노드의 다음은 새로운 노드
                node?.next = newNode
```

A <-> B <-> C <-> D

- 현재 `node`는 B를 가리킨다
1. node?.next?.prev = newNode

```swift
// B의 다음 노드(C)의 prev를 X로 변경
A <-> B <-> C <-> D
        ↑    ↑
       node  node.next
             prev = X
```

2 . newNode.prev = node

```swift
// X의 prev를 B로 설정
A <-> B <-> C <-> D
        ↑    
       node  
        ↑    
        X
```

1. node?.next = newNode

```swift
// B의 next를 X로 설정
A <-> B <-> X <-> C <-> D

// 최종 상태
A <-> B <-> X <-> C <-> D
```

### removeAll()

```swift
    func removeAll() {
        head = nil
        tail = nil
    }
```

- head와 tail을 nil로 변경하면 모든 노드가 알아서 제거

### remove

```swift
    func remove(index: Int) {
        guard size != 0 else { return }
        
        if index == 0 {
            head = head?.next
            head?.prev = nil
            
            size -= 1
            
            if size == 0 {
                head = nil
                tail = nil
            }
        } else if index >= size {
            tail = tail?.prev
            tail?.next = nil
            
            size -= 1
            
            if size == 0 {
                head = nil
                tail = nil
            }
        } else {
            let half = size / 2
            let isForward = (index <= half)
            
            var node: Node?
            if isForward {
                node = head
                for _ in 0..<index {
                    guard let next = node?.next else { break }
                    node = next
                }
            } else {
                node = tail
                for _ in 0..<(size-index-1) {
                    guard let prev = node?.prev else { break }
                    node = prev
                }
            }
            
            // 현재 노드의 뒤에 존재하는 노드의 넥스트는 제거할 노드의 다음 노드
            node?.prev?.next = node?.next
            // 현재 노드의 다음 노드의 이전은 현재 노드의 이전
            node?.next?.prev = node?.prev
            
            size -= 1
        }
        
        if isEmpty {
            head = nil
            tail = nil
        }
    }
```

- insert와 거의 동일
- 중간 노드 일 시 중간 노드를 찾아낸 후
- 노드의 뒤에 존재하는 노드의 넥스트를 현재 노드의 넥스트로 설정
- 현재 노드의 다음 노드의 이전은 현재 노드의 이전으로 설정

</details>

# 그리디 (이코테)
<details> <summary>그리디?</summary>
그리디 알고리즘

- 그리디 (탐욕범)은 현재 상황에서 지금 당장 좋은 것만 고르는 방법과 의미
- 일반적으로 그리디가 출제가 되면 최소한의 아이디어를 떠올려야 한다
- 그러기 위해선 정당성 분석이 중요하다
    - 단순히 가장 좋아 보이는 것을 반복적으로 선택해도 최적의 해를 구할 수 있는지 검토

1. 루트 노드부터 시작하여 거쳐 가는 노드 값의 합을 최대로 만들고 싶다

<img width="1124" alt="스크린샷 2024-12-19 오후 9 39 18" src="https://github.com/user-attachments/assets/2197b87c-6bd3-431b-bc57-9679d4353033" />

- 최적의 해란? ⇒  노드 값의 합이 가장 큰 해

1. 루트 노드부터 시작하여 거쳐 가는 노드 값의 합을 최대로 만들고 싶다

<img width="1068" alt="스크린샷 2024-12-19 오후 9 38 32" src="https://github.com/user-attachments/assets/6d6622cc-e31a-4c00-8e05-29a7e715bdce" />

- 단순히 매 상황에서 가장 큰 값만 고른다면? ⇒ 5 → 10 → 4
- 다만 이 경우에는 19의 합을 구할 순 있지만 최적의 해인 21보다는 낮은 값
- 단순히 매 상황에서 가장 큰 값만 구하는 방식
- 일반적인 상황에서 그리디는 최적의 해를 보장할 수 없을 때가 많다
- 하지만 코테 그리디 대부분은 **탐욕법으로 얻은 해가 최적의 해가 되는 상황**에서, 이를 추론할 수 있어야 풀리도록 출제

### 거스름돈 문제

```swift
var money = 1000 - Int(readLine()!)!
let array = [500, 100, 50, 10, 5, 1]
var result = 0

for coin in array {
    if coin <= money {
    result += money / coin
    money = money % coin
    }
}
```

- 가장 큰 화폐 단위부터 돈을 거슬러 주는 것이 최적의 해를 보장하는 이유?
    - 가지고 있는 동전 중에서 큰 단위가 항상 작은 단위의 배수이므로 작은 단위의 동전들을 종합해 다른 해가 나올 수 없기 때문
- 만약 800원 → 화폐 단위가 500원, 400원, 100원이라면 어떻게 될까?
    - 사실 최적의 해는 400원이 2개
    - 그러나 400은 500의 배수가 아니기 때문
- 그리디에서는 문제 풀이를 위한 최소한의 아이디어를 떠올리고 이것이 정당한지 검토해야 한다.

### 1이 될 때까지

- 어떠한 수 N이 1이 될 때까지 다음의 두 과정 중 하나를 반복적으로 선택하여 수행
- 단, 두번째 연산은 N이 K로 나누어 떨어질 떄만 선택
    1. N에서 1을 뺀다
    2. N을 K로 나눈다.
- 예를 들어 N이 17, K가 4라고 가정, 이때 1번의 과정을 한번 수행하면 N은 16이 된다. 이후에 2번의 과정을 두 번 수행하면 N은 1이 된다.
- N과 K가 주어질 때 N이 1이 될 때까지 1번 혹은 2번의 과정을 수행해야 하는 최소 횟수를 구하는 프로그램을 작성

### 문제 해결 아이디어

- 주어진 N에 대하여 최대한 많이 나누기를 수행하면 된다.
    - 하나의 변수에 N을 저장하고 매번 어떤 값으로 나누고 아니라면 1를 뺀다
- N의 값을 줄일 때 2 이상의 수로 나누는 작업이 1을 빼는 작업보다 수를 훨씬 많이 줄일 수 있다

<img width="1172" alt="스크린샷 2024-12-19 오후 10 20 09" src="https://github.com/user-attachments/assets/2b557874-e2e8-4d21-80c2-2455dbcac2f2" />

- 가능하면 최대한 많이 나누는 작업이 최적의 해를 항상 보장?
- N이 아무리 큰수여도, K로 계속 나눈다면 기하급수적으로 빠르게 줄일 수 있다.
- 다시 말해 K가2 이상이기만 하면 1을 빼는거보다 항상 빠르게 줄일 수 있다.
    - 또한 N은 항상 1에 도달하게 됨
    - 애초에 N이 양의 정수라는 가정 하에 그냥 1씩 뺀다면 언젠가 1로 바뀐다.
