ls = ["Aurum","sodium","potassium","yourmomium"]
mx = [0,""]
for i in ls:
    if len(i)>mx[0]:
        mx[0] = len(i)
        mx[1] = i
t = "{st}--length{length}"
print(t.format(st=mx[1],length=mx[0]))
