#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int *data;      // 동적 배열
    int cap;        // 용량
    int front;      // 다음에 뺄 위치
    int rear;       // 다음에 넣을 위치
    int size;       // 현재 원소 개수
} Queue;

void initQueue(Queue *q, int cap) {
    q->data = (int *)malloc(sizeof(int) * cap); // alloc: 그 크기만큼 RAM에서 메모리 & sizeof(int) * cap : 정수 cap개 저장할 공간
    q->cap = cap;
    q->front = 0;
    q->rear = 0;
    q->size = 0;
}

void freeQueue(Queue *q) {
    free(q->data);
}

void push(Queue *q, int x) {
    // q->data = 배열 시작 주소
    // q->rear 칸 만큼 이동하려면: q->data + q->rear
    // 그 위치의 값을 쓰려면 *로 역참조 -> *(q->data + q->rear)
    *(q->data + q->rear) = x;              // q->data[q->rear]와 같음 
    q->rear = (q->rear + 1) % q->cap;      // 원형 이동
    q->size++;
}

int pop(Queue *q) {
    int x = *(q->data + q->front);         // q->data[q->front]와 동일
    q->front = (q->front + 1) % q->cap;    // 원형 이동
    q->size--;
    return x;
}

int main(void) {
    int N;
    scanf("%d", &N);

    Queue q;
    initQueue(&q, N);

    // 1..N enqueue
    for (int i = 1; i <= N; i++) push(&q, i);

    // 카드가 1장 남을 때까지:
    while (q.size > 1) {
        pop(&q);                // 1) 맨 위 버림
        int x = pop(&q);        // 2) 그 다음 맨 위
        push(&q, x);            //    맨 아래로
    }

    printf("%d\n", pop(&q));
    freeQueue(&q);
    return 0;
}