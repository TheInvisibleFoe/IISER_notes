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

    
