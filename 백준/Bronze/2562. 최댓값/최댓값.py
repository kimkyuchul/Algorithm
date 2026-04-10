nums = [int(input()) for _ in range(9)]
# max(3, 7, 2)     # → 7
# max(nums)        # 리스트
# max(3, 7, nums)  # ❌ 이건 안됨
print(max(nums))
print(nums.index(max(nums)) + 1)