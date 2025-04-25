import math
def f(x):
    return math.sin(x)+x**2-1
h=0
interval = [0,1]
d = 0.05
while h<1:
    if f(h)*f(h+d)<0:
        interval[0]= h
        interval[1] = h+d
        break
    h += d
print(interval)
tole = 0.000001
i1= interval[0]
i2= interval[1]
def bisc(a,b,tol):
    c=0
    eps = tol+1
    while eps>tol:
        c= (a+b)/2
        if f(c)==0:
            return str(c) + " is a root of f(x)"
        elif f(c)*f(a)<0:
            b= c
        elif f(c)*f(b)<0:
            a=c
        eps = abs(b-a)
    return str(c)+ " is a root of of f(x)"
print(bisc(i1,i2,tole))

