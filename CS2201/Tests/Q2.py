#Author Sabarno Saha
# Question 2
l1 = [1,3,5,7,9 ,25,29,2,4] # given list
a =29# element to be added
l1.sort() # sorting the list, also changes the initial list
l2 = [i-a for i in l1]# subtracting all the elements by the given number to see the point where it reaches a positive number
ind = len(l1)# default value is the fact that the given number is greater than the max of the given list
for i in range(0,len(l2)):
    if l2[i] >= 0:
        ind = i # checks the index where it turns positive
        break
l1.insert(ind,a)# Insert adds a to index ind
print(l1)
