dic = {"lolcat":"11235","hehe":"8585"}
uid = input("Enter name:")
if uid in dic.keys():
    pwd = input("Enter your password: ")
    if dic[uid] == pwd:
        print("Welcome to The Portal!")
        choice = input("Do you want to change your password(y/n): ")
        if choice =="y":
            pwd1 = input("Enter new password: ")
            pwd2 = input("Confirm New password: ")
            if pwd1==pwd2:
                dic[uid] = pwd1
                print(dic[uid])
            else:
                print("passwords dont match")
    else:
        print("Invalid Credentials")
else:
    print("Invalid Credentials")

