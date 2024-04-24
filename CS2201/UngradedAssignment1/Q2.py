x = "The quick brown fox jumps over the lazy dog"
try:
    m = x.index("fox")
    print("fox found at "+str(m))
except:
    print("fox not found")
print("string in reverse order: "+ x[::-1])
print(x[::3])
print(x[::4])
print(len(x))
y = x[:4:]
z = x[:-4:-1]
print(y+z)
print(y*10)
