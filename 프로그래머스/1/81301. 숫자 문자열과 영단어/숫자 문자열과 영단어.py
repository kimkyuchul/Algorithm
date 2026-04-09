def solution(s):
    dic = {"zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"}
    
    for key, value in dic.items():
        # Swift는 파라미터가 기본적으로 상수(let)라 변경 불가예
        # Python은 파라미터도 그냥 변수처럼 재할당 가능
        # 주의할 점은 원본은 안 바뀌고 함수 안에서만 바뀐다.
        s = s.replace(key, value)
    
    return int(s)