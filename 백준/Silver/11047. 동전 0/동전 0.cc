#include <stdio.h>

int main() {
    int N, K;
    scanf("%d %d", &N, &K);

    int coin[10];
    for (int i = 0; i < N; i++) {
        scanf("%d", &coin[i]);
    }

    int result = 0;

    for (int i = N - 1; i >= 0; i--) {
        if (K >= coin[i]) {
            result += K / coin[i];
            K %= coin[i];
        }
    }

    printf("%d\n", result);
    return 0;
}