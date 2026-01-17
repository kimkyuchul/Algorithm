import java.util.Scanner;

class Queue {
    int[] arr = new int[100000];
    int size = 0;

    void push(int x) {
        arr[size++] = x;
        // push는 출력 없음
    }

    void pop() {
        if (size == 0) {
            System.out.println(-1);
            return;
        }

        System.out.println(arr[0]);

        // 한 칸씩 앞으로 이동 (removeFirst 느낌)
        for (int i = 1; i < size; i++) {
            arr[i - 1] = arr[i];
        }
        size--;
    }

    void size() {
        System.out.println(size);
    }

    void empty() {
        System.out.println(size == 0 ? 1 : 0);
    }

    void front() {
        if (size == 0)
            System.out.println(-1);
        else
            System.out.println(arr[0]);
    }

    void back() {
        if (size == 0)
            System.out.println(-1);
        else
            System.out.println(arr[size - 1]);
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        Queue q = new Queue();

        while (n-- > 0) {
            String cmd = sc.next();

            switch (cmd) {
                case "push":
                    int x = sc.nextInt();
                    q.push(x);
                    break;
                case "pop":
                    q.pop();
                    break;
                case "size":
                    q.size();
                    break;
                case "empty":
                    q.empty();
                    break;
                case "front":
                    q.front();
                    break;
                case "back":
                    q.back();
                    break;
            }
        }
        sc.close();
    }
}