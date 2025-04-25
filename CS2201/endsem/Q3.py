'''
	author: sabarno saha
	Created on 24 Apr 2024
	Escape code
'''

import random

coin = [0,1]
def escape():
	print("Let's try today!")
	n = random.random()
	gate = 0
	if n <= 0.5:
		gate = 1
	elif n> 0.5:
		gate = 2
	print(f"Gate %d chosen" %(gate))
	if gate == 1:
		a1 =False
		a2 =False
		a3 = False
		a4 = False
		ans1 = random.uniform(0,1)
		if ans1 <= 0.95:
			print("Answer 1 is correct")
			a1 = True
		ans2 = random.uniform(0,1)
		if ans2 <= 0.90 and a1 == True:
			print("Answer 2 is correct")
			a2 = True
		ans3 = random.uniform(0,1)
		if ans3 <= 0.85 and a1 == True and a2 == True:
			print("Answer 3 is correct")
			a3 =  True
		ans4 = random.uniform(0,1)
		if ans4 <= 0.80 and a1 == True and a2 == True and a3 == True:
			print("Answer 4 is correct")
			a4 =  True
		if a1 == a2 == a3 == a4 == True:
			print("Congrats!")
		else :
			print("alas no escape")
	elif gate == 2:
		a1 = False
		a2 =False
		ans1 = random.uniform(0,1)
		if ans1 <= 0.70:
			print("Answer 1 is correct")
			a1 = True
		ans2 = random.uniform(0,1)
		if ans2 <= 0.50 and a1 == True:
			print("Answer 2 is correct")
			a2 = True
		if a1 ==  a2 == True:
			print("Congrats!")
		else :
			print("alas no escape")
escape()
