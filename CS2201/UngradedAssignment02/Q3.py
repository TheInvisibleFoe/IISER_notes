name = "Vikash Kumar hehehehe lolcat" 
initials = ""
for i in range(len(name)):
    if i ==0 and name[i]!= " ":
        initials += name[i]+". "
    if (name[i] == " " and name[i+1] != " "):
        initials += name[i+1]+". "
print(initials)
