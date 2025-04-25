import numpy as np
s = 'x + 2y + 3z = 2, 4x + 8y +66z = 3, 7x + 81y + 9z = 4'
l = s.split(',')
print(l)
l2 = [[],[]]
ct =0 
for i in l:
    i.replace("x+ ", "?").replace("y+ ","?").replace("z = ","?")
    m = i.split("?")
    l2.append([])
    l2[ct].append(m)
    ct+=1
print(l2)
