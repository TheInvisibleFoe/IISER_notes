def fd(x,h,f):
    '''
    Parameters
    ----------
    x : float
        point at which derivative is to be calculated
    h : float
        step size
    f : function
        function whose derivative is to be calculated
    Returns
    ---------
    returns the derivative of the function at point x using the forward difference method
    '''
    y = (f(x+h) - f(x))/h
    return y

def bd(x,h,f):
    '''
    Parameters
    ----------
    x : float
        point at which derivative is to be calculated
    h : float
        step size
    f : function
        function whose derivative is to be calculated
    Returns
    ---------
    returns the derivative of the function at point x using the backward difference method
    '''
    y = (f(x) - f(x-h))/h
    return y

def cd(x,h,f):
    '''
    Parameters
    ----------
    x : float
        point at which derivative is to be calculated
    h : float
        step size
    f : function
        function whose derivative is to be calculated
    Returns
    ---------
    returns the derivative of the function at point x using the central difference method
    '''
    y = (f(x +h) - f(x-h))/(2*h)
    return y

def fivept(x,h,f):
    '''
    Parameters
    ----------
    x : float
        point at which derivative is to be calculated
    h : float
        step size
    f : function
        function whose derivative is to be calculated
    Returns
    ---------
    returns the derivative of the function at point x using the five point difference method
    '''
    y = - f(x + 2*h) + 8*f(x+h) -8*f(x-h) + f(x-2*h)
    y = y/(12 *h)
    return y


## Caller Function is pointless but still available if info needed

def caller(x,h,f,method):
    '''
    Parameters
    ----------
    x : float
        point at which derivative is to be calculated
    h : float
        step size
    f : function
        function whose derivative is to be calculated
    method : function
        method to be used to calculate the derivative
        fd : forward difference
        bd : backward difference
        cd : central difference
        fivept : five point difference
        
    Returns
    ---------
    returns the derivative of the function at point x using the specified method
    '''
    
    name_methods = ['fd','bd','cd','fivept']
    if method not in name_methods:
        raise AttributeError("Method not found")
    else:
        return method(x,h,f)

def info():
    methods = {'forward difference': 'fd', 'backward difference': 'bd', 'central difference': 'cd', 'five point difference': 'fivept'}
    print("The following methods are available for calculating the derivative of a function:", methods)