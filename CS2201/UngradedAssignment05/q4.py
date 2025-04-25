def d2b(n):
    b = ""
    while n>=1:
        m = n%2
        print(m)
        n -= m
        n /= 2
        b  = b+str(int(m))
    return b[::-1]
print(d2b(12))

