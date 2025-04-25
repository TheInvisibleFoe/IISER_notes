x = [i for i in range(10)]
y = [i for i in range(3,13)]
print("x = "+str([x[i] for i in range(len(x)-1,-1,-1)]))
print("odd and even indices of x = "+str([x[i] for i in range(0,len(x),2)])+" "+str([x[i] for i in range(1,len(x),2)]))
print(x[3]==y[0])
try:
    print("Index of 10 = "+str(x.index(10)))
except:
    print("10 is not in the list")
try:
    print("Index of 7 = "+str(x.index(7)))
except:
    print("7 is not in the list")
t=x+y
print(" x+y = "+str(t))
print("maximum, minimum element in t = " + str([max(t),min(t)]) )
