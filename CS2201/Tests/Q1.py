# Author: Sabarno Saha
# Tuesday Group CS2201 
# Question 1
l = ['apple', 'apple', 'orange', 'banana', 'pineapple', 'watermelon', 'banana', 'orange']# This is the given list
dic ={}# initalize an empty dictionary
for i in l:
    if i not in dic.keys():# checking if the element is already a key of the dictionary.
        dic[i] = 1 # If the keys is not present in the dictionary the key is automatically added
    elif i in dic.keys():
        dic[i] +=1# if key is already there, we add frequency.
print(dic)
