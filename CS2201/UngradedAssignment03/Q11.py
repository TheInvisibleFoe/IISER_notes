num = input("Enter a number: ")
s= ""
d = {1 : 'ONE', 2 : 'TWO', 3 : 'THREE', 4 : 'FOUR', 5 : 'FIVE', 6 : 'SIX', 7 : 'SEVEN', 8 : 'EIGHT', 9 : 'NINE'}
for i in num:
    s+= d[int(i)]+" "
print(s)
