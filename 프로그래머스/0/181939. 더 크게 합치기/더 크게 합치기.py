def solution(a, b):
    a = str(a)
    b = str(b)
    answer = int(max(a+b, b+a))
    return answer