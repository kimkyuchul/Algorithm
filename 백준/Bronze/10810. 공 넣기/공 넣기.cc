#include <stdio.h>
#define MAX 101

int main() {
    int n, m;
    scanf("%d %d", &n, &m);

    int result[MAX] = {0};

    for (int t = 0; t < m; t++) {
        int i, j, k;
        scanf("%d %d %d", &i, &j, &k);

        for (int x = i - 1; x <= j - 1; x++) {
            result[x] = k;
        }
    }

    for (int i = 0; i < n; i++) {
        printf("%d ", result[i]);
    }

    return 0;
}