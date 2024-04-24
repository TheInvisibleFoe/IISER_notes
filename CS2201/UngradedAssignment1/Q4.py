ls1 = [1,1,1,1,1,2,3]
ls2 = [4,6,8,7]
def chk(lst1,lst2):
    for i in lst1:
        for j in lst2:
            if i==j:
                print("True")
                exit()
            else:
                print("False")
                exit()
chk(ls1,ls2)
