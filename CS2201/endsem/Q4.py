'''
	author: sabarno saha
	Created on 24 Apr 2024
	Python autocomplete
'''

# We can append this to a file to make this so that the question bank gets updates

import numpy as np
qbank = [ "how to dance","how to make coffee", "how to write c program", "how to cook", "how to cook pasta", "how to write a formal letter"]

inpt = input("Search query: ")
inpt = inpt.lower().strip()
flag = False
# prefix based matching for the first part
for i in qbank:
	if inpt == i[:len(inpt):]:
		print(i)
		flag = True
# if prefix based matching doesnt completely work we implement maximum match
if flag == False:
	# stores the threshold for minimum match reqd
	m = 1
	for i in qbank:
		s = np.array(i.split())
		l = np.array(inpt.split())
		isect = np.intersect1d(s,l)
		m = max(m,len(isect))
	for i in qbank:
		s = np.array(i.split())
		l =np.array(inpt.split())
		isect = np.intersect1d(s,l)
		if m == len(isect) and s[0] == l[0] and s[1] == l[1]:
			print(i)
			flag = True
if flag == False:
	print("No autocompletions found")
