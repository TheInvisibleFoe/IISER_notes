print("Hello World")
# Hey ho this is a comment
l = ["Name: ","Age: ","Roll no: "]
s=[]
for i in l:
    s.append(str(input("Enter your "+i)))
print(s[0]+" "+s[1]+" "+s[2]+" ")
print("Hello! My name is %s. I am %s years old. My roll number is %s" %(s[0],s[1],s[2]))
s1 = input("Enter st1: ")
s2 = input("Enter st2: ")
print("The sum is %d" %(float(s1)+float(s2)))
s1 = int(input("Enter st1: "))
s2 = int(input("Enter st2: "))
print("The sum is %d" %(s1+s2))
print("It's good to learn Python")
print("The man asked, \"Where to meet you?\" I said, \"Well, use Google Meet!\"") 
i = 2
m = 2.0909090
c = 'c'
print(type(i))
print(type(m))
print(type(c))

l1 = ["Name: "]
s1=[]
for i in l1:
    s1.append(str(input("Enter your "+i)))
print("Hello! My name is %s." %(s1[0]))
