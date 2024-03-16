import math
#l=[]

for i in range(460,818):
    y=int((math.e)**(i/100))
    #l.append(y)
    print( y, end=";")



'''

General form of function:
y=e^(x/k),
replace k with a value such that rate of change of zoom% will be same
everywhere and is equal to rate at zoom%=k%



Here, y=e^(x/100)
slope when y=100 is 1, so rate of change of zoom at any position is the
same as it was when zoom=100%

values of y:
2.17 at x=100
100 at x=460
3500 at x=817


'''
