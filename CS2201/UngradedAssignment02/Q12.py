n = int(input("Enter no. of bounces: "))
h = float(input("Enter Height(in cm): "))
def drop(bounceno,height):
    for i in range(n):
        print(height)
        height = height/2
        if height < 0.05 :
            break
drop(n,h)



