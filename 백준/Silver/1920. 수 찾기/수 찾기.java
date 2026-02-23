import java.util.Arrays;
import java.util.Scanner;

public class Main {

    static int bs(int[] arr, int target, int st, int end) {
        if (st > end) return 0;           // 못 찾

        int mid = (st + end) / 2;

        if (arr[mid] == target) {
            return 1;                      // 찾
        } else if (arr[mid] > target) {
            return bs(arr, target, st, mid - 1);   // 왼쪽
        } else {
            return bs(arr, target, mid + 1, end);  // 오른쪽
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        Arrays.sort(arr);

        int m = sc.nextInt();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < m; i++) {
            int target = sc.nextInt();
            sb.append(bs(arr, target, 0, n - 1)).append("\n");
        }

        System.out.print(sb);
    }
}