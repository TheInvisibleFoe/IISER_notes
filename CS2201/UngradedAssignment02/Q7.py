nm = "12345"
#nm =""
#nm =[nm + str(i) for i in range(10)]
for i in range(len(nm)):
    print(nm[:len(nm)-i-1:])
