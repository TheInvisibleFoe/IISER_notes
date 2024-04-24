l =[1,3,5,7]
l.insert(1,2)
l.insert(3,4)
l.insert(5,6)
print(l)
l.pop()
print(l)
def Push(L,x):
    L.append(x)
    return L
print(Push(l,3))
def Pop(L):
    return L.pop()
print(Pop(l))
print(l)

