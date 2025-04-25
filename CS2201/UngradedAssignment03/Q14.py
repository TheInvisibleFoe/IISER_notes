import random
d = {"What is the name of the largest bay? ":[("Hudson Bay",0,0),("Bay of bengal",1,4),("Bay of pigs",0,0),("lol bay",0,0)],"What is the smllest living organism? ":[("Mycoplasma Gallicepticum",1,5),("Valonia valonia",0,0)]}
jd = {"How many stars does our solar system have? ":"1"}
l = list(d.keys())
c=0
c2=1
thr = 6
score=0
print("---------Welcome to Proshnobaan---------")
print("Lets begin, shall we.")
print(l)
random.shuffle(l)
def jackpot():
    jdk = list(jd.keys())
    print("Here is your jackpot question? ")
    a = input((jdk[0]))
    if a == jd[jdk[0]]:
        print("congratulations, Thanks for playing")
    else:
        print("sorry you got the jackpot questions right")

for i in l:
    print("Here is question %d"%c)
    c+=1
    print(i)
    for j in d[i]:
        print(str(c2)+". "+j[0])
        c2+=1
    c2 =1
    ans=int(input("Enter option number: "))
    if d[i][(ans-1)][1] ==1:
        print("Correct Answer")
        score += d[i][ans-1][2]
    else:
        print("Incorrect Answer")
    print("Your current score is %d"%score)

if score>=thr:
    jackpot()
else:
    print("Better luck next time")

