import math
a=0
b=0
m=int(input("Enter a number: "))
t=m
c=0
while t>1:
    a = a + (t//10**(int(math.log(t,10))))*10**(c)
    t = t-10**(int(math.log(t,10)))*(t//10**(int(math.log(t,10))))
    c +=1
print(a)

