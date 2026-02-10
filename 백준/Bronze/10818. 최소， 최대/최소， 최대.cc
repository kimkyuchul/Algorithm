#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;
    scanf("%d", &n);

    int *arr = (int *)malloc(sizeof(int) * n);
    int *p = arr;

    // 포인터로 
    for (int i = 0; i < n; i++)
        scanf("%d", p + i);        

    int min = *p;                  
    int max = *p;

    for (int i = 1; i < n; i++) {
        // 포인터 산술 연산 위치는 안 바뀌고, 임시로 i칸 떨어진 곳의 값을 읽기만 함
        if (*(p + i) < min) min = *(p + i);
        if (*(p + i) > max) max = *(p + i);
    }

    printf("%d %d", min, max);
    free(arr);

    return 0;
}