
import numpy as np

def bisection(a,b,f,tol,maxiter):
    '''
        Parameters
        ----------
        a : float
            left guess
        b : float
            right guess
        f : function
            function whose roots need to be calculated
        tol : float
            error tolerance
        maxiter : int
                maximum number of iterations
        Returns
        ---------
        returns a root between 'a' and 'b' using the bisection method
    '''
    c = (a+b)/2
    err = abs(f(c))
    print("%1s %10s %10s %10s %10s"%("n", "a","b","c","f(c)"))
    count = 0
    if abs(f(a))<=tol:
        return a
    elif abs(f(b))<=tol:
        return b
    if f(a)*f(b)>0:
        print("Error")
        return None
    while err > tol:
        c = (a+b)/2 # taking a midpoint
        fa = f(a)
        fb = f(b)
        fc = f(c)
        print("%2d %10.6f %10.6f %10.6f %10.6f"%(count,a,b,c,fc))
        if fa*fc<0:# conditions
            b=c
        elif fc*fb<0:
            a=c
        elif abs(fc)<=tol:
            return c
        count+=1
        err = abs(fc)# error in numerical estimation
        if count ==maxiter:
            print("Did not converge")
            return None
    print("The root is ",c)
    return c



def secant(x0,x1,f,tol,maxiter):
    '''
    Parameters
        ----------
        x0 : float
            left guess
        x1 : float
            right guess
        f : function
            function whose root needs to be calculated.
        tol : float
            error tolerance
        maxiter : int
                maximum number of iterations
        Returns
        ---------
        returns a root between 'x0' and 'x1' using the secant method
    
    '''
    fx0 = f(x0)
    fx1 = f(x1)
    count =1
    print("%1s %10s %10s %10s %10s"%("n", "x_n-2","x_n-1","x_n","f(x_n)"))

    if abs(fx0)<tol:
        print("The root is ",a)
        return a
    elif abs(fx1)<tol:
        print("The root is ",b)
        return b
    elif abs(fx1 - fx0) < tol:
        print("The secant slope appraches 0")# flatness check
        return None
    else:
        count = 1
        x2 = x1 - fx1*((x1 - x0)/(fx1 - fx0))
        fx2 = f(x2)
        fx1 = f(x1)
        fx0 = f(x0)
        err = abs(fx2)
        while err>tol:
            fx1 = f(x1)
            fx0 = f(x0)
            fx2 = f(x2)
            print("%2d %10.6f %10.6f %10.6f %10.6f"%(count,x0,x1,x2,f(x2)))
            x2 = x1 - fx1*((x1 - x0)/(fx1 - fx0))# secant formula
            count +=1
            x0 = x1
            x1 = x2
            if abs(fx0 - fx1)<tol:
                print("Secant slope approaches 0")# flatness check
                return None
            err = abs(f(x2))
            if count == maxiter:
                print("Did not Converge")
                return None
        print("%2d %10.6f %10.6f %10.6f %10.6f"%(count,x0,x1,x2,f(x2)))
    print("The root is ",x2)
    return x2

def newtraph(x0,f, tol,maxiter, fd):
    '''
        Parameters
        ----------
        x0 : float
            Initial guess
        f: function
            function whose roots need to be calculated
        tol : float
            error tolerance
        maxiter : int
                maximum number of iterations required.
        fd : function
            derivative type, can be analytical or numerical
        Returns
        ---------
        returns a root around 'x0' using the Newton-Raphson Method
    '''
    if abs(f(x0))<=tol:
        print("The root is ",x0)
    elif abs(fd(x0))<=tol:# flatness check
        print("The reciprocal of the derivative will blow up. Pls choose a different point")
    else:
        print("%1s %10s %10s %10s"%("n", "x_n-1","x_n","f(x_n)"))
        fx0 = f(x0)
        fdx0 = fd(x0)
        x1 = x0 - fx0/fdx0# new point calculation
        err = abs(f(x1))
        count = 0
        while err > tol:
            fx0 = f(x0)
            fdx0 = fd(x0)
            x1 = x0 - fx0/fdx0# new point calculation
            fx1 = f(x1)
            print("%2d %10.6f %10.6f %10.6f"%(count,x0,x1,fx1))

            x0 = x1
            fx1 = f(x1)
            err = abs(fx1)
            count +=1
            if count == maxiter:
                print("Did not converge")
                return None
    print("%2d %10.6f %10.6f %10.6f"%(count,x0,x1,fx1))
    print("The root is ", x1)
    return x1