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

</details>
 
# 구현, 시뮬레이션 (이코테)
<details> <summary>구현, 시뮬레이션?</summary>

### 구현 예시

- 알고리즘이 간단한데, 코드 양이 많아지는 문제
- 실수 연산을 다루고, 특정 소수점 자리까지 출력해야 하는 문제
- 문자열을 특정 기준에 따라 끊어 처리해야 하는 문제
- 적절한 라이브러리를 찾아 해결해야 하는 문제

### 행렬

<img width="483" alt="스크린샷 2024-12-28 오후 5 37 08" src="https://github.com/user-attachments/assets/a9e43886-5261-4f3f-b02c-0a757b95a1b4" />

- 알고리즘 문제에서의 2차원 공간은 행렬(Matrix)의 의미로 사용
- 프로그래밍 언어에서는 2차원 배열이라고 부른다
- 시뮬레이션 및 완전 탐색에서는 2차원 공간에서의 방향 벡터가 자주 활용

```swift
// 현재 위치
var x = 2
var y = 2

// 4방향 이동 (북, 남, 동, 서)
let dx4 = [0, 0, -1, 1]  // x축 이동
let dy4 = [-1, 1, 0, 0]  // y축 이동

// 8방향 이동 (상, 하, 좌, 우, 좌상, 좌하, 우상, 우하)
let dx8 = [0, 0, -1, 1, -1, -1, 1, 1]
let dy8 = [-1, 1, 0, 0, -1, 1, -1, 1]

// 4방향 이동 예시
for i in 0..<4 {
    let nx = x + dx4[i]  // 다음 x 좌표
    let ny = y + dy4[i]  // 다음 y 좌표
    print("이동 후 위치: (\(nx), \(ny))")
}

// 이동 후 위치: (2, 1)  // 상
// 이동 후 위치: (2, 3)  // 하
// 이동 후 위치: (1, 2)  // 좌
// 이동 후 위치: (3, 2)  // 우
```

1. i = 0일 때:
    - dx4[0] = 0, dy4[0] = -1
    - nx = 2 + 0 = 2
    - ny = 2 + (-1) = 1
    - 결과: (2, 1) -> 위로 한 칸 이동
2. i = 1일 때:
    - dx4[1] = 0, dy4[1] = 1
    - nx = 2 + 0 = 2
    - ny = 2 + 1 = 3
    - 결과: (2, 3) -> 아래로 한 칸 이동
3. i = 2일 때:
    - dx4[2] = -1, dy4[2] = 0
    - nx = 2 + (-1) = 1
    - ny = 2 + 0 = 2
    - 결과: (1, 2) -> 왼쪽으로 한 칸 이동
4. i = 3일 때:
    - dx4[3] = 1, dy4[3] = 0
    - nx = 2 + 1 = 3
    - ny = 2 + 0 = 2
    - 결과: (3, 2) -> 오른쪽으로 한 칸 이동

### 상하좌우

```swift
import Foundation

let n = 5
let plans = ["R","R","R","U","D","D"]

// 현재 위치를 가르킴
var x = 1
var y = 1

var nx = 1
var ny = 1

// L, R, U, D에 따른 이동
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

// 움직일 타입
let moveTypes = ["L", "R", "U", "D"]

// 이동 계획을 하나 씩 확인 하기
for plan in plans {
    // 이동 후 좌표 구하기
    for i in 0..<moveTypes.count {
        if String(plan) == moveTypes[i] {
            nx = x + dx[i]
            ny = y + dy[i]
        }
        
        if nx < 1 || ny < 1 || nx > n || ny > n {
            continue
        }
        
        x = nx
        y = ny
    }
}

print(x, y)

(1,1) (1,2) (1,3) (1,4) (1,5)
(2,1) (2,2) (2,3) (2,4) (2,5)
(3,1) (3,2) (3,3) (3,4) (3,5)
(4,1) (4,2) (4,3) (4,4) (4,5)
(5,1) (5,2) (5,3) (5,4) (5,5)

// nx > n || ny > n을 비교하는 이유는:
// 현재 위치에서 dx, dy를 더했을 때 좌표가 격자의 최대 범위(n)를 넘어가면 안되기 때문입니다
// 예를 들어 (5,5) 위치에서 오른쪽으로 이동하려고 하면 (6,5)가 되는데, 이는 5x5 격자를 벗어나는 잘못된 위치입니다
// 이런 잘못된 좌표로의 이동을 막기 위해 nx > n || ny > n 조건으로 체크합니다
```

### 시각

```swift
let n = 5
let k = 3

var result = 0

(0...n).forEach { hour in
    (0...59).forEach { m in
        (0...59).forEach { s in
            if hour / 10 == 3 || hour % 10 == 3 || m / 10 == 3 || m % 10 == 3 || s / 10 == 3 || s % 10 == 3 {
                result += 1
            }
        }
    }
}

print(result)
```

- hour / 10 == 3, m / 10 == 3과 s / 10 == 3은 십의 자리에 3이 있는지를 확인하는 조건입니다.
    - 예를 들어 시간이 12:35:47이라고 할 때:
    - 분(m)이 35인 경우:
        - m / 10 = 3 (35를 10으로 나누면 3)
        - m % 10 = 5 (35를 10으로 나눈 나머지는 5)
    - 초(s)가 47인 경우:
        - s / 10 = 4 (47을 10으로 나누면 4)
        - s % 10 = 7 (47을 10으로 나눈 나머지는 7)
    - 따라서:
        - m / 10 == 3: 분의 십의 자리가 3인지 체크 (30~39분)
        - m % 10 == 3: 분의 일의 자리가 3인지 체크 (03, 13, 23, 33, 43, 53분)
        - s / 10 == 3: 초의 십의 자리가 3인지 체크 (30~39초)
        - s % 10 == 3: 초의 일의 자리가 3인지 체크 (03, 13, 23, 33, 43, 53초)

왕실의 나이트

```swift
// 현재 나이트의 위치 입력받기
if let inputData = readLine() {
    let row = Int(String(inputData[inputData.index(inputData.startIndex, offsetBy: 1)]))!
    let column = Int(inputData[inputData.startIndex].asciiValue! - Character("a").asciiValue! + 1)
    
    // 나이트가 이동할 수 있는 8가지 방향 정의
    let steps = [(-2, -1), (-1, -2), (1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1)]
    
    // 8가지 방향에 대하여 각 위치로 이동이 가능한지 확인
    var result = 0
    
    for step in steps {
        // 이동하고자 하는 위치 확인
        let nextRow = row + step.0
        let nextColumn = column + step.1
        
        // 해당 위치로 이동이 가능하다면 카운트 증가
        if nextRow >= 1 && nextRow <= 8 && nextColumn >= 1 && nextColumn <= 8 {
            result += 1
        }
    }
    
    print(result)
}
```

</details>

# 이진탐색
<details> <summary>이진탐색?</summary>

### 이진 탐색

```swift
let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

numbers.indexOf(43)  // returns 15

// indexOf를 실제로 구현 했을 때
func linearSearch<T: Equatable>(_ a: [T], _ key: T) -> Int? {
    for i in 0 ..< a.count {
        if a[i] == key {
            return i
        }
    }
    return nil
}
```

- 배열에 숫자가 있고 배열에 특정 숫자가 있는지와 인덱스 위치를 확인하려한다고 가정 했을 때 swift에서는 IndexOf를 활용하면 된다.
- 내장된indexOf() 함수는 [선형 검색(linear search)](https://github.com/kodecocodes/swift-algorithm-club/tree/master/Linear%20Search)을 수행합니다.
- linearSearch는 찾고자 하는 요소를 찾을 때까지, 처음부터 배열 전체를 반복한다. 최악의 경우 배열 내에 값은 없고 모든 작업은 수행되지 않음
- 선형 검색 알고리즘은 배열의 값 절반을 조사 → 느리다

### *바이너리 검색(binary search)*

- 값을 찾을때까지 배열을 반으로 나누는 *바이너리 검색을 통해  속도를 높일 수 있다.*
- n크기의 배열에 대해, 성능이 선형(linear) 검색처럼O(n)이 아니라O(log n)
- 이진 검색을 사용할때 단점 → **무조건 정렬이 되어 있어야 한다.**

### 이진 검색 동작 방법

- 배열의 절반을 나누고 찾고자 하는 것이 검색(search) 키 왼쪽에 있는지 오른쪽에 있는지 확인
- **검색 키의 절반을 어떻게 결정 →  배열을 먼저 정렬했으므로 간단하게 `<`나 `>`로 비교**
- 검색 키가 왼쪽 절반에 있다면, 그쪽을 반복해서 처리 왼쪽 절반을 두개로 나누고 검색키가 어디에 있는지 확인 (오른쪽 절반에 있을때에도 마찬가지)
- 검색 키가 발견될때까지 반복  배열을 더 이상 나눌수 없을때, 유감스럽지만 배열내에 검색키가 없다는 결론을 내려야 한다.

```swift
let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

//numbers.indexOf(37)  // returns 15

func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil

    } else {
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        print("midIndex \(midIndex)")

        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)

        // Is the search key in the right half?
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)

        // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}

print(binarySearch(numbers, key: 43, range: 0 ..< numbers.count))  // gives 13
```

- 처음에는 lowerBound = 0과 upperBound = 19 범위.
- 이러한 값들을 채우면,midIndex는 0 + (19 - 0)/2 = 19/2 = 9
- 실제로9.5이지만 정수를 사용하기에 반올림

```swift
[ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67 ]
                                  *
                                  
if a[midIndex] > key {
    // use left half
    return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
} else if a[midIndex] < key {
    // use right half
    return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
} else {
    return midIndex
}
```

- a[midIndex] = 29 검색 키(43)보다 작기 때문에, 검색키가 배열의 왼쪽 절반에 없다는 결론을 내릴수 있다. 따라서 검색키는 오른쪽 절반 어디에 있어야 함
- a[midIndex] > key  → range.lowerBound ..< midIndex(0..<9)까지 다시 재귀적으로 실행
- a[midIndex] < key → midIndex = 10 + (19 - 10)/2 = 14

[https://github.com/kodecocodes/swift-algorithm-club/tree/master/Binary Search](https://github.com/kodecocodes/swift-algorithm-club/tree/master/Binary%20Search)

### 재귀 말고 반복문으로 쉽게 표현

```swift

// 반복문으로 구현하기
func binarySearch(_ array: [Int], num: Int) -> Bool {
    var start = 0
    var end = (array.count - 1)
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == num { return true }
        if array[mid] > num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return false
}

```

- 처음에 mid로 반을 쪼갠다 → (0 + 9) / 2 = 5
- array[mid] > num → end = 4
    - 다시 mid로 쪼갠다 → (0+4) / 2 = 2
- array[mid] < num → Start = 6
    - 다시 mid로 쪼갠다 → (6+9) / 2 = 8

### 백준 수찾기 (이진탐색)

```swift
import Foundation

let N = Int(readLine()!)!
var nArray = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
var mArray = readLine()!.split(separator: " ").map { Int($0)! }

nArray.sort()

for m in 0..<M {
    print(binarySearch(nArray, mArray[m]))
}

func binarySearch(_ array: [Int], _ key: Int) -> Int {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if nArray[mid] == key {
            return 1
        } else if nArray[mid] > key {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return 0
}

// 5
// 4 1 5 2 3
// 정렬 후
// 1, 2, 3, 4, 5
// 5
// 1 3 5 7 9

// 첫째 줄에 자연수 N(1 ≤ N ≤ 100,000)이 주어진다. 다음 줄에는 N개의 정수 A[1], A[2], …, A[N]이 주어진다. 다음 줄에는 M(1 ≤ M ≤ 100,000)이 주어진다. 다음 줄에는 M개의 수들이 주어지는데, 이 수들이 A안에 존재하는지 알아내면 된다

// N을 정렬하고 해당 배열을 이분 탐색 해야 함
// nArray.sort()로 정렬
// for m in 0..<M { -> M 만큼(M어레이의 카운트) 반복문을 돌면서 mArray[i] 를 키로 지정
// 이분 탐색의 시작은 0, end는 nArray의 길이 - 1 (그냥 N을 써도 됨)
// mid는 (0+4) / 2 = 2

// while 문 시작
// if nArray[mid](2) == key와 같다면 1을 방출 (nArray[2] = 3, key = 1)
//  else if nArray[2](3) > key(1) 라면 -> end(4) = mid(2) - 1 == 1
//  let mid = (start + end) / 2 -> mid는 (0+1) / 2 == 1

// while 문 시작
// if nArray[mid](1) == key ==> nArray[mid](1)는 2, key는 1
//  else if nArray[mid](1)(값: 2) > key(값: 1) { ==> end(1) = mid(1) - 1 == 0
// let mid = (start + end) / 2 -> mid는 (0+0) / 2 == 0

// while 문 시작
// if nArray[mid](0) == key ==> nArray[mid](0)는 1, key는 1
// return 1이 된다.
```
### 숫자 카드 2

```swift
 다음과 같이 구현 시 시간 초과
for i in 0..<M {
    result.append(binarySearch(mArray[i]))
}

func binarySearch(_ key: Int) -> Int {
    var start = 0
    var end = nArray.count - 1
    var sum = 0
    
    while start <= end {
        let mid = (start + end) / 2
        
        if nArray[mid] == key {
            sum += 1
        } else if nArray[mid] < key {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return sum
}

print(result.map{String($0)}.joined(separator: " "))
```

- 위와같이 첫번째 풀이로 풀이 시 시간초과가 발생
- 그 이유는 만약 n이 50만이고, 모든 값이 1이라고 하고  m도 최댓값을 가지고 전부 1을 찾는다고 가정
- 중앙으로 부터 25만번을 좌우로 각각 움직입니다. 매번 찾고나서 m번이 매번 50번씩 움직여야 하는데 그것이 너무 비효율적
- 특정 값이 나오는 시작점과 끝점을 구해서 빼면 일일이 움직이면서 확인하지 않고, 끝점 - 시작점을 통해서 몇개인지 알 수 있다.

```swift
// 상근이가 가지고 있는 숫자 카드의 개수
let N = Int(readLine()!)!
//  숫자 카드에 적혀있는 정수
var nValues = readLine()!.split(separator: " ")

let M = Int(readLine()!)!
// 상근이가 몇 개 가지고 있는 숫자 카드인지 구해야 할 M개의 정수
var mValues = readLine()!.split(separator: " ")

// 이진탐색 할 배열
let nArray = nValues.map { Int(String($0))! }.sorted()
// 키 값으로 쓸 배열
let mArray = mValues.map { Int(String($0))! }
var answer = ""

// 중복된 값들 중에 가장 앞에 있는 인덱스 (first)
func lowerBound(_ key: Int) -> Int {
    var start = 0
    var end = nArray.count
    
    while start < end {
        let mid = (start + end) / 2
        
        // nArray는 정렬한 상태이기 때문에 1,2,3,4,5 이런 형식으로 구성
        if nArray[mid] < key { // 중간값이 찾는 값보다 작으면
            start = mid + 1 // 시작점을 중간 다음으로
        } else { // 중간값이 찾는 값보다 크거나 같으면
            end = mid // 끝점을 중간으로
        }
    }
    
    return end // 찾는 값 이상이 처음 나타나는 위치! ex 1,2,2,3,4이면 index 1이 반환
}

// 중복된 값들 중에 가장 뒤에 있는 인덱스의 + 1 (last + 1)
func upperBound(_ key: Int) -> Int {
    var start = 0
    var end = nArray.count
    
    while start < end {
        let mid = (start + end) / 2
        
        if nArray[mid] <= key { // 중간값이 찾는 값보다 작거나 같으면
            start = mid + 1 // 시작점을 중간 다음으로
        } else { // 중간값이 찾는 값보다 크면
            end = mid
        }
    }
    
    return end // 찾는 값보다 큰 값이 처음 나타나는 위치 ! ex 1,2,2,3,4이면 index 4를 반환
}

mArray.forEach { num in
    answer += "\(upperBound(num) - lowerBound(num)) "
}

print(answer)
```

- 특정 숫자의 개수 = (초과하는 첫 위치) - (이상인 첫 위치)
- 예: [1, 2, 2, 2, 3]에서 2의 개수
    - upperBound(2) = 4 (3의 위치)
    - lowerBound(2) = 1 (첫 번째 2의 위치)
    - 4 - 1 = 3 (2의 개수)

```swift
이진 탐색에서 end = nArray.count - 1과 while start <= end를 
사용하면 시간 초과가 발생하는 이유는 경계 조건(boundary condition) 처리 때문
```

```swift
배열: [1, 2, 2, 2, 3]
찾으려는 값: 2

```

 `end = nArray.count - 1`과 `while start <= end` 사용 시

- start와 end가 같은 위치를 가리킬 때도 계속 반복
- mid 위치의 값이 찾는 값과 같을 때 end = mid로 설정하면
- 다음 반복에서도 같은 위치를 계속 검사하게 됨
- 무한 루프는 아니지만 불필요한 반복이 발생

`end = nArray.count`와 `while start < end` 사용 시

- start와 end 사이의 범위를 계속 줄여나감
- mid 위치의 값이 찾는 값과 같을 때 end = mid로 설정하면
- 다음 반복에서는 반드시 검사 범위가 줄어듦
- 불필요한 반복이 없음


</details>

# 파라메트릭 서치
<details> <summary>파라메트릭 서치?</summary>

### 이분 탐색 (Binary Search)을 써야 할 때

- "특정 값을 찾아라" → ex) "정렬된 배열에서 특정 숫자의 위치를 찾아라”
- 정렬된 배열에서 값의 존재 여부나 위치를 찾는 문제 → ex) "정렬된 배열에서 특정 숫자가 처음 등장하는 위치를 찾아라”
- 답이 정확히 있거나 없음

### 파라메트릭 서치 문제의 특징:

- "조건을 만족하는 최대/최소값을 찾아라" → ex) "N개의 랜선을 잘라서 M개를 만들 수 있는 최대 길이는?”
- 답이 가능한 범위 내에서 최적값을 찾는 문제 → ex) “심사관이 모든 사람을 심사하는데 걸리는 최소 시간은?”
- Yes/No 판단으로 좁혀갈 수 있음 → ex) "M개의 블루레이에 강의를 담을 때 가능한 최소 크기는?”

### 파라메트릭과 이분 탐색 (Binary Search) 와 차이점

- 1) while 조건이 < 로 바뀐다. ( start < end )
- 2) end = mid 로 +1 을 하지 않는다. ( 조건문에 따라서 달라짐 )
- 3) 끝으로 end 를 return 한다.

```swift
// 일반적인 이진 탐색
func binarySearch(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    
    while start <= end {               // 1. <= 사용
        let mid = (start + end) / 2
        
        if arr[mid] == target {
            return mid
        } else if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1             // 2. end = mid - 1
        }
    }
    return -1                         // 3. 못 찾으면 -1 반환
}

// 파라메트릭 서치
func parametricSearch(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.max()!
    
    while start < end {               // 1. < 사용
        let mid = (start + end) / 2
        var sum = 0
        
        for x in arr {
            // 조건 검사 예시
            if x > mid {
                sum += mid
            } else {
                sum += x
            }
        }
        
        if sum <= target {
            start = mid + 1
        } else {
            end = mid                 // 2. end = mid
        }
    }
    return end                        // 3. end 반환
}
```

각 차이점의 이유:

1. `while start < end` 사용:
    - 파라메트릭 서치는 "최적값"을 찾는 것이 목적
    - 범위가 하나로 수렴할 때까지 실행
    - start와 end가 같아지는 지점이 바로 답이 됨
2. `end = mid` 사용:
    - 파라메트릭 서치에서는 현재 mid값이 조건을 만족할 수 있는 후보가 될 수 있음
    - mid값을 포함시켜야 하므로 -1을 하지 않음
    - 범위를 좁혀가면서 최적값을 찾음
3. `return end` 사용:
    - while문이 종료될 때 start와 end가 같아짐
    - 이 지점이 바로 조건을 만족하는 최적값
    - start나 end 둘 다 같은 값을 가리키므로 어느 것을 반환해도 됨

```swift
func cutTree(_ trees: [Int], _ target: Int) -> Int {
    var start = 0
    var end = trees.max()!
    
    while start < end {
        let mid = (start + end + 1) / 2
        var sum = 0
        
        // 나무를 mid 높이로 잘랐을 때 얻을 수 있는 나무의 양 계산
        for tree in trees {
            if tree > mid {
                sum += tree - mid
            }
        }
        
        if sum >= target {
            start = mid    // 더 높은 높이로 잘라볼 수 있음
        } else {
            end = mid - 1  // 높이를 낮춰야 함
        }
    }
    return end
}

// 사용 예시
let trees = [20, 15, 10, 17]
let target = 7
print(cutTree(trees, target))  // 나무를 잘라서 target 길이를 얻을 수 있는 최대 높이
```

- 예시 나무 자르기

### 파라매틱 서치에서 <=를 쓰는 경우

```swift
// 예: 예산 문제 (백준 2512)
while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    
    for budget in budgets {
        sum += min(budget, mid)
    }
    
    if sum <= M {
        answer = mid    // 가능한 값을 따로 저장
        start = mid + 1
    } else {
        end = mid - 1
    }
}
```

- 정확한 값을 찾아야 하는 경우

```swift
// 예: 최소/최대값을 정확히 찾아야 하는 경우
while start <= end {
    let mid = (start + end) / 2
    
    if isValid(mid) {
        result = mid     // 현재 값 저장 필요
        start = mid + 1  // 더 큰 값이 있는지 확인
    } else {
        end = mid - 1
    }
}
```

- 마지막 값까지 확인이 필요한 경우
- 값을 저장해야 하는 경우
    - 중간 결과를 별도 변수(answer)에 저장
    - 마지막으로 저장된 값이 최종 답이 됨
    

주의사항:

- `<=`를 사용할 때는 반드시 answer 같은 별도 변수에 결과 저장 필요
- `mid + 1`, `mid - 1`로 범위를 좁혀야 함
- 무한루프 가능성 주의

</details>

# 그래프 탐색 알고리즘: DFS (이코테)
<details> <summary>DFS?</summary>

그래프 탐색 알고리즘?

- 탐색이란 많은 양의 데이터 중에서 원하는 데이터를 찾는 과정
- 대표적인 그래프 탐색 알고리즘 → DFS와 BFS

## 스택 자료구조

![스크린샷 2025-01-07 오후 10.44.18.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/6be02357-49ae-4e4c-ad92-7c265d12ed72/25489161-85a0-4ca5-bb9a-949ed177b3b1/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2025-01-07_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.44.18.png)

- 먼저 들어 온 데이터가 나중에 나가는 형식(선입후출)
- 입구와 출구가 동일한 형태로 스택을 시각화

### 백준 제로 문제

```swift
import Foundation

let k = Int(readLine()!)!

var stack: [Int] = []
var result = 0

for _ in 0..<k {
    let input = Int(readLine()!)!
    
    if input != 0 {
        stack.append(input)
    } else {
        stack.popLast()
    }
}

for i in stack {
    result += i
}

print(result)
```

- 스택의 대표적인 문제

## 큐 자료구조

![스크린샷 2025-01-07 오후 10.49.28.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/6be02357-49ae-4e4c-ad92-7c265d12ed72/1d1bfe7f-e01c-4475-b829-493dad0c19a6/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2025-01-07_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.49.28.png)

- 먼저 들어온 데이터가 먼저 나가는 형식(산입선출)의 자료구조
- 큐는 입구와 출구가 모두 뚫려 있는 터널과 같은 형태로 시각화

### swift 큐 자료구조

```swift
struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head <= queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

// 더블 스택 큐
struct DoubleStackQueue<Element>: Queueable {
    private var inStack = [Element]()
    private var outStack = [Element]()
    
    mutating func enqueue(_ newElement: Element) {
        inStack.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        
        return outStack.popLast()
    }
}
```

## 재귀 함수

- 자기 자신을 다시 호출하는 함수
- 재귀 함수를 문제 풀이에서 사용할 때는 재귀 함수의 종료 조건을 반드시 명시해야 한다.
- 종료 조건을 명시하지 않으먄 무한히 호출된다.
    
    ```swift
    func recursive(_ i: Int) {
    	if i == 100 {
    		return
    	}
    
    	print("재귀")
    	recursive(i + 1)
    }
    
    recursive(1)
    ```
    

## 팩토리얼

- n! = 1 X 2 X 3 X … X(n-1) X n
- 수학적으로 0!과 1!의 값은 1이다.
    
    ```swift
    func factorial(_ n: Int) -> Int {
        if n <= 1 {
            return 1 // n이 1이하인 경우 1을 반환
        }
        // n! = n * n(n - 1)!를 그대로 코드로 작성
        return n * factorial(n - 1)
    }
    
    print(factorial(5))
    ```
    

## 최대공약수 계산 (유클리드 호재법)

- 두개의 자연수에 대한 최대 공약수(두개 자연수의 공통된 약수중에 가장 큰 값)를 구하는 대표적인 알고리즘

### 유클리드 호재법

- 두 자연수 a, b에 대하여 (A > B) A를 B로 나눈 나머지를 R이라고 하자
- 이때 A와 B의 최대공약수는 B와 R의 최대공약수와 같다
    
    ```swift
    func gcd(_ a: Int, _ b: Int) -> Int {
    		// a가 b의 배수라면 b를 반환
        if a % b == 0 {
            return b
        } else {
    		    // b와 a를 b로 나눈 나머지를 인자로 하여 재귀한다.
            return gcd(b, a % b)
        }
    }
    
    // a, b의 순서가 바뀌어도 상관 없음
    print(gcd(192, 162)) // 실행 결과 6
    ```
    
    - 재귀 함수를 잘 활용하면 복잡한 알고리즘을 간결하게 사용 가능
    - 모든 재귀 함수는 반복문으로 이용하여 동일한 기능을 구현 가능
    - 재귀 함수가 반복문보다 유리할수도 불리한 경우도 있다.
    - 컴퓨터가 함수를 연속적으로 호출하면 컴퓨터 메모리 내부의 스택 프레임에 쌓인다.
        - 스택을 사용해야 할 때 스택 라이브러리 대신 재귀 함수를 이용하는 경우가 많다. → DFS

## DFS

- 깊이 우선 탐색이라고 부르며 그래프에서 깊은 부분을 우선적으로 탐색
- DFS는 스택 자료구조(혹은 재귀)를 이용
    1. 탐색 시작 노드를 스택에 삽입하고 방문 처리 한다.
    2. 스택의 최상단 노드에 방문하지 않은 인접한 노드가 하나라도 있으면 그 노드를 스택에 넣고 방문 처리 한다. 방문하지 않은 인접 노드가 없으면 스택에서 최상단 노드를 꺼낸다.
    3. 더 이상 2번의 과정을 수행할 수 없을 때까지 반복
        
        ![스크린샷 2025-01-07 오후 11.18.58.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/6be02357-49ae-4e4c-ad92-7c265d12ed72/7f11ed07-3362-4e85-9ef6-0fc14d713930/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2025-01-07_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_11.18.58.png)
        

### 나동빈 파이썬 to Swift DFS

```swift
// DFS 메서드 정의
func dfs(graph: [[Int]], v: Int, visited: inout [Bool]) {
    // 현재 노드를 방문 처리
    visited[v] = true
    print(v, terminator: " ")
    
    // 현재 노드와 연결된 다른 노드를 재귀적으로 방문
    for i in graph[v] {
        if !visited[i] {
            dfs(graph: graph, v: i, visited: &visited)
        }
    }
}

// 각 노드가 연결된 정보를 표현 (2차원 리스트)
let graph: [[Int]] = [
    [], // 0번 노드는 사용하지 않음
    [2, 3, 8], // 1번 노드
    [1, 7],    // 2번 노드
    [1, 4, 5], // 3번 노드
    [3, 5],    // 4번 노드
    [3, 4],    // 5번 노드
    [7],       // 6번 노드
    [2, 6, 8], // 7번 노드
    [1, 7]     // 8번 노드
]

// 각 노드가 방문된 정보를 표현 (1차원 리스트)
var visited = Array(repeating: false, count: 9)

// 정의된 DFS 함수 호출
dfs(graph: graph, v: 1, visited: &visited)
```

1. **첫 번째 실행 (v=1)**
    
    ```swift
    graph[1] = [2, 3, 8]
    ```
    
    - i는 순서대로 2, 3, 8을 순회합니다
    - visited[2]가 false이므로 dfs(v=2) 호출
2. **두 번째 실행 (v=2)**
    
    ```swift
    graph[2] = [1, 7]
    ```
    
    - i는 1, 7을 순회
    - visited[1]은 true라서 건너뜀
    - visited[7]이 false이므로 dfs(v=7) 호출
3. **세 번째 실행 (v=7)**
    
    ```swift
    graph[7] = [2, 6, 8]
    ```
    
    - i는 2, 6, 8을 순회
    - visited[2]는 true라서 건너뜀
    - visited[6]이 false이므로 dfs(v=6) 호출

### 나동빈 - 음료수 얼려먹기 Swift

```swift
import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]
var iceFrame = [[Int]]()

for _ in 0..<n {
    iceFrame.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// 방향키: 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

private func dfs(x: Int, y: Int) -> Bool {

    // 범위 벗어나면 끝
    if x < 0 || y < 0 || x >= n || y >= m {
        return false
    }

    // 방문처리 안된 곳이라면 더 파고들어서 인접 노드 확인
    if iceFrame[x][y] == 0 {
        iceFrame[x][y] = 1
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            dfs(x: nx, y: ny)
        }
        return true
    }
    return false
}

var result = 0
for i in 0..<n {
    for j in 0..<m {
        if dfs(x: i, y: j) {
            result += 1
        }
    }
}

print(result)
```

- if x < 0 || y < 0 || x >= n || y >= m 조건을 막는 이유
    
    ```swift
    (0,0) (0,1) (0,2)
    (1,0) (1,1) (1,2)
    (2,0) (2,1) (2,2)
    
    let dx = [-1, 1, 0, 0]  // 상하좌우
    let dy = [0, 0, -1, 1]  // 상하좌우
    
    현재 위치 = (0,0)
    위로 이동: 
    nx = 0 + dx[0] = 0 + (-1) = -1
    ny = 0 + dy[0] = 0 + 0 = 0
    새로운 위치 = (-1,0) ← 이건 배열에 존재하지 않는 위치!
    ```
    
    - `x < 0`: 배열의 위쪽 경계를 넘어갈 때
    - `y < 0`: 배열의 왼쪽 경계를 넘어갈 때
    - `x >= n`: 배열의 아래쪽 경계를 넘어갈 때
    - `y >= m`: 배열의 오른쪽 경계를 넘어갈 때
- 방문처리 안된 곳이라면 더 파고들어서 인접 노드 확인 과정

```swift
1) iceFrame[0][0] == 0 인지 체크 
   -> 0이므로 조건문 실행

2) iceFrame[0][0] = 1로 변경 (방문 처리)
   1 0 1 1 0
   0 0 0 1 1
   1 1 1 1 1
   0 0 0 0 0

3) 상하좌우 체크 시작 (i가 0부터 3까지):
   i=0 (상): nx = 0+(-1)=-1, ny = 0+0=0
   -> 범위 벗어나서 false 반환

   i=1 (하): nx = 0+1=1, ny = 0+0=0
   -> (1,0) 위치 DFS 시작
      iceFrame[1][0] == 0이므로 1로 변경
      1 0 1 1 0
      1 0 0 1 1
      1 1 1 1 1
      0 0 0 0 0

   i=2 (좌): nx = 0+0=0, ny = 0+(-1)=-1
   -> 범위 벗어나서 false 반환

   i=3 (우): nx = 0+0=0, ny = 0+1=1
   -> (0,1) 위치 DFS 시작
      iceFrame[0][1] == 0이므로 1로 변경
      1 1 1 1 0
      1 0 0 1 1
      1 1 1 1 1
      0 0 0 0 0
```

</details>
