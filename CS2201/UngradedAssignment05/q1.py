n = int(input("Enter the number of names you want to enter: "))
l =[]
for i in range(0,2*n):
    if i%2 == 0:
        l.append(input("Enter name: "))
    else:
        l.append(input("Enter age: "))
print(l)
dic ={}
for i in range(0,2*n,2):
    dic[l[i]]=l[i+1]
print(dic)
l2 = []
for i in range(0,2*n,2):
    l2.append(tuple([l[i],l[i+1]]))
print(l2)

