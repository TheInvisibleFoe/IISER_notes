'''

	author: sabarno saha
	Created: 24 Apr 2024
	Python code to interpolate sensex data

'''
import math

# calculating u mentioned in the formula
def u_cal(u, n):

	temp = u
	for i in range(1, n):
		temp = temp * (u - i)
	return temp

# calculating factorial of given number n
def fact(n):
	f = 1
	for i in range(2, n + 1):
		f *= i
	return f

# Driver Code

# Values are input here
n = 5
x = [2014, 2016, 2018, 2020, 2022 ]
	
# y[][] is used for difference table
# with y[][0] used for input
y = [[0 for i in range(n)]
		for j in range(n)]



# the y values are set here
y[0][0] = 19 
y[1][0] = -9
y[2][0] = 11
y[3][0] = -24
y[4][0] = 18


# Calculating the forward difference
# table

for i in range(1, n):
	for j in range(n - i):
		y[j][i] = y[j + 1][i - 1] - y[j][i - 1]
	

# Displaying the forward difference table
for i in range(n):
	print(x[i], end = "\t")
	for j in range(n - i):
		print(y[i][j], end = "\t")
	print("")
	

# Value to interpolate at
value = 2015

# initializing u and sum
yout = []
sum = y[0][0]
yout.append(sum)
u = (value - x[0]) / (x[1] - x[0])
for i in range(1,n):
	sum = sum + (u_cal(u, i) * y[0][i]) / fact(i)

print("\nValue at", value,
	"is", round(sum, 6));

