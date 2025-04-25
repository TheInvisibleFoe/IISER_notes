'''
	author: sabarno saha
	Created: 24 Apr 2024
	Python code to solve a system of equations
'''
import numpy as np


# defining the coefficient array
a = np.array([[3, -2, 1], [1, 1, 1], [1,-1, 1]])
# defining the answer array
X = ['x', 'y', 'z']
b = np.array([17, 16, 6])


# defining a function that checks if the system of equations is solvable and if it is, returns the solution using np.linalg.solve
def solver(A,B):
	detA = np.linalg.det(A)
	if detA == 0:
		print("The solution to the equation is not possible")
		# returns an all null array if the determinant is 0
		return np.array([None])
	sol = np.linalg.solve(A,B)
	return sol 
solution = solver(a,b)
# checks if the return value is null and exits the program is there is a null value
if solution.any() ==  None:
	exit()

print("The solution to the system of equations are: ")
print(f"There are %d dark chocolates" %(solution[0])) 
print(f"There are %d white chocolates" %(solution[1])) 
print(f"There are %d hazelnut chocolates" %(solution[2])) 
