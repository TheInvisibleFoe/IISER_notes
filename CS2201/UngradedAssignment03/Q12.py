l = [6,5,4,3,2,1]
d = [l[i+1]-l[i] for i in range(len(l)-1)]
if all(v>=0 for v in d):
    print("increasing")
elif all(v<=0 for v in d):
    print("decreasing")
else:
    print("not monotonic")

