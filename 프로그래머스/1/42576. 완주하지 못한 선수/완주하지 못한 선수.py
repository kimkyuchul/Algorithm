def solution(participant, completion):
    answer = ''
    dic = {}
    
    for p in participant:
        if p in dic:
            dic[p] += 1   # 이미 있으면 +1 
        else:
            dic[p] = 1    # 처음 나오면 1
        
    for x in completion:
        if x in dic:
            dic[x] -= 1
            
    for key, value in dic.items():
        if value != 0:
            answer = key
    
    return answer