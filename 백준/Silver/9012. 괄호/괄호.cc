#include <stdio.h>
#include <string.h>

int main() {
    int n;
    scanf("%d", &n);

    char p[1001];

    for (int i = 0; i < n; i++) {
        scanf("%s", p);  

        int cnt = 0;     
        int isValid = 1; 


        for (int j = 0; p[j] != '\0'; j++) {
            if (p[j] == '(') {
                cnt++;   
            } else {      
                if (cnt == 0) {
                    isValid = 0;
                    break;
                }
                cnt--;
            }
        }

        if (cnt != 0) {
            isValid = 0;
        }

        if (isValid)
            printf("YES\n");
        else
            printf("NO\n");
    }

    return 0;
}