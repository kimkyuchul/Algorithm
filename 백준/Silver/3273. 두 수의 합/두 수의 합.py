n = int(input())           # 수의 개수
nums = list(map(int, input().split()))  # 숫자들
x = int(input())           # 목표값
result = 0

'''
시간초과

for i in range(n): 
    value = nums[i]
    for z in nums:
        if value + z == x:
            result += 1
        
'''

dic = {}

for i in nums:
    value = x - i
    if value in dic:
        result += 1
        
    dic[i] = True
        
print(result)
    