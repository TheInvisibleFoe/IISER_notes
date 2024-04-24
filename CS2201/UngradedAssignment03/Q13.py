import numpy as np
import matplotlib.pyplot as plt
import sympy as smp
from sympy import init_printing
init_printing()

x = smp.symbols("x",real = True)
y = (x+2)*(x-3)*(x-4)*(x+2)
#y= x**3 -2*x+2

def f(x):
    return (x+2)*(x-3)
d = smp.diff(y,x)
d

y.subs(x,0.1)

def newtraph(eps,a,num):
    root = 0
    xpt = []
    xpt.append(a)
    t= eps+1
    while t > eps:
        if y.subs(x,xpt[-1]) == 0:
            return xpt
        xpt.append(xpt[-1] - float(y.subs(x,xpt[-1])/d.subs(x,xpt[-1])))
        t = abs(xpt[-1]-xpt[-2])
        if len(xpt) > num:
            return xpt
    return xpt

ep = 0.001
x1 = 2
print(newtraph(ep,x1,5000))
