
import numpy as np
def trap(n,a,b,f):
    '''
    Parameters
    ----------
    n : int
        number of points
    a : float
        lower limit of integration
    b : float
        upper limit of integration
    f : function
        function to be integrated
        
    Returns
    ---------
    returns the integral of the function from a to b using the trapezoidal rule
    '''
    
    h = np.abs(b-a)/(n-1)
    x = np.arange(a,b+h/2,h)
    y = f(x)
    integral = 2*sum(y)-y[0]-y[-1]
    integral = integral*h/2
    return integral

def simpquad(n,a,b,f):
    '''
    Parameters
    ----------
    n : int
        number of points
    a : float
        lower limit of integration
    b : float
        upper limit of integration
    f : function
        function to be integrated
        
    Returns
    ---------
    returns the integral of the function from a to b using the Simpsons 1/3 rule
    '''
    if n%2 ==0:
        n = n-1
    h = np.abs(b-a)/(n-1)
    x = np.arange(a,b+h/2,h)
    y = f(x)
    integral = 2*sum(y[0::2])+4*sum(y[1::2])-y[0]-y[-1]
    integral = integral*h/3
    return integral

def simpcube(n,a,b,f):
    '''
    Parameters
    ----------
    n : int
        number of points
    a : float
        lower limit of integration
    b : float
        upper limit of integration
    f : function
        function to be integrated
        
    Returns
    ---------
    returns the integral of the function from a to b using the Simpsons 3/8 rule
    '''
    n = 3*(n//3) + 1
    h = np.abs(b-a)/(n-1)
    x = np.arange(a,b+h/2,h)
    y = f(x)
    integral = y[0] + 3*sum(y[1:-2:3])+3*sum(y[2:-1:3])+2*sum(y[3:-3:3]) + y[-1]
    integral = integral*(3*h)/8
    return integral

def bode(n,a,b,f):
    '''
    Parameters
    ----------
    n : int
        number of points
    a : float
        lower limit of integration
    b : float
        upper limit of integration
    f : function
        function to be integrated
        
    Returns
    ---------
    returns the integral of the function from a to b using the boole's rule
    '''
    n = 4*(n//4) + 1
    h = np.abs(b-a)/(n-1)
    x = np.arange(a,b+h/2,h)
    y = f(x)
    integral = 7*y[0] + 7*y[-1] +32*sum(y[1:-1:2]) + 12*sum(y[2:-2:4]) + 14 *sum(y[4:-4:4])
    integral = integral*(2*h)/45

    return integral

# info function for all methods
def info():
    methods = {'trapezoidal':trap, 'simpsons 1/3':simpquad, 'simpsons 3/8':simpcube, 'booles':bode}
    print("The available methods are:", methods)
    