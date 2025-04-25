import numpy as np

def euler(y,x,h,f):
    '''
    Parameters
    ----------
    y : float
        initial value at (n-1) time step
    x : float
        initial value of independent variable
    h : float
        step size
    f : function
        the function on the right hand side of the differential equation
    Returns
    ---------
    returns the value of y at the next time step using the Euler method.
    '''
    yn = y +f(x,y)*h
    return yn
    
    

def midpoint(y,x, h, f):
    '''
    Parameters
    ----------
    y : float
        initial value at (n-1) time step
    x : float
        initial value of independent variable
    h : float
        step size
    f : function
        the function on the right hand side of the differential equation
    Returns
    ---------
    returns the value of y at the next time step using the midpoint method.
    '''
    k1 = h * f(x, y)
    return y + h * f(x + h / 2, y + k1 / 2)

def rk4(y,x,h,f):
    '''
    Parameters
    ----------
    y : float
        initial value at (n-1) time step
    x : float
        initial value of independent variable
    h : float
        step size
    f : function
        the function on the right hand side of the differential equation using the Runge-Kutta 4 method
    
    Returns
    ---------
    returns the value of y at the next time step using the Runge-Kutta 4 method
    
    '''
    k1 = h*f(x,y)
    k2 = h*f(x+h/2,y+k1/2)
    k3 = h*f(x+h/2,y+k2/2)
    k4 = h*f(x+h,y+k3)
    y_n = y + (k1+2*k2+2*k3+k4)/6
    return y_n

def vlt(yn, ym1, xn, h , f):
    '''
    Parameters
    ----------
    yn : float
        initial value at (n) time step
    ym1 : float
        initial value at (n-1) time step
    xn : float
        initial value of independent variable
    h : float
        step size
    f : function
        the function on the right hand side of the differential equation
        
    Returns
    ---------
    returns the value of y at the next time step using the Verlet method.
    '''
    yn = 2*yn - ym1 + f(xn, yn)*h**2
    return yn

def vel_vlt(yn, vn, x, h , f):
    '''
    Parameters
    ----------
    yn : float
        initial value at (n) time step
    vn : float
        initial value of velocity at (n) time step
    x : float
        initial value of independent variable
    h : float
        step size
    f : function
        the function on the right hand side of the differential equation
        
    Returns
    ---------
    returns the value of y at the next time step using the Velocity-Verlet  or Stormer Verlet method.
    '''
    ynp1 = yn + vn*h + 0.5*f(x, yn)*(h**2)
    vnp1 = vn + 0.5*(f(x, yn) + f(x + h, ynp1))*h
    return ynp1, vnp1

def leapfrg():
    return None


### Caller Functions

def caller(meth, a,b,N,y0,f,*args,**kwargs): # call function Discretizes and generates method
    '''
    Parameters
    ----------
    meth : function
        the numerical method to be used
        euler for Euler method
        midpoint for Midpoint method
        rk4 for Runge-Kutta 4 method
        vlt for Verlet method
        vel_vlt for Velocity-Verlet method
        leapfrg for Leapfrog method
    a : float
        start time for differential equation solver
    b : float
        end time for differential equation solver
    N : int
        number of strips for discretization
    y0 : float
        initial value of differential equation solution
    f : function
        the function on the right hand side of the differential equation
    
    Returns
    ---------
    returns the value of y at each time step using the numerical method specified.
        
    '''
    if meth==euler or meth==midpoint or meth==rk4:
        return call(meth,a,b,N,y0,f)
    elif meth==vlt:
        if args is None:
            raise ValueError("Initial velocity not provided")
        v0 = args[0]
        print(v0)
        return call_verlet(meth, a,b,N,y0,v0,f)
    elif meth==vel_vlt or meth==leapfrg:
        if args is None:
            raise ValueError("Initial velocity not provided")
        v0 = args[0]
        print(v0)
        return call_vvlt(meth,a,b,N,y0,v0,f)
    else:
        print("Method not found")
        return None

def call(meth,a,b,N,y0,f): # call function Discretizes and generates method
    '''
    Parameters
    ----------
    meth : function
        the numerical method to be used
        'euler' for Euler method
        'midpoint' for Midpoint method
        'rk4' for Runge-Kutta 4 method
    a : float
        start time for differential equation solver
    b : float
        end time for differential equation solver
    N : int
        number of strips for discretization
    y0 : float
        initial value of differential equation solution
    f : function
        the function on the right hand side of the differential equation
    
    Returns
    ---------
    returns the value of y at each time step using the numerical method specified.
        
    '''
    h = (b-a)/(N-1)
    ys = np.zeros((N, len(y0)))
    y,ys[0] = y0,y0
    xs = np.arange(a,b+h/2,h)
    for i in range(N):
        ys[i,:] = y # to allow for vector solutions
        y = meth(y,xs[i],h,f)
    return ys

def call_verlet(meth,a,b,N,y0, v0,f):
    
    '''
    Parameters
    ----------
    meth : function
        the numerical method to be used
    a : float
        start time for differential equation solver
    b : float
        end time for differential equation solver
    N : int
        number of strips for discretization
    y0 : float
        initial value of differential equation solution
    v0 : float
        initial value of velocity
    f : function
        the function on the right hand side of the differential equation
    
    Returns
    ---------
    returns the value of y at each time step using the verlet method.
        
    '''
    h = (b-a)/(N-1)
    ys = np.zeros((N, len(y0)))
    xs = np.arange(a,b+h/2,h)

    ys[0] = y0

    x0 = xs[0]

    ys[1] = y0 + v0*h + 0.5*f(x0, y0)*(h**2)
    
    y = ys[1]
    for i in range(1,N):
        ys[i,:] = y # to allow for vector solutions
        y = meth(ys[i], ys[i-1],xs[i],h,f)
    return ys

def call_vvlt(meth,a,b,N,y0,v0, f):
    
    '''
    Parameters
    ----------
    meth : function
        the numerical method to be used
        vel_vlt for Velocity-Verlet method
        leapfrg for Leapfrog method
    a : float
        start time for differential equation solver
    b : float
        end time for differential equation solver
    N : int
        number of strips for discretization
    y0 : float
        initial value of differential equation solution
    f : function
        the function on the right hand side of the differential equation
    
    Returns
    ---------
    returns the value of y at each time step using the velocity verlet method.
        
    '''
    h = (b-a)/(N-1)
    ys = np.zeros((N, len(y0)))
    xs = np.arange(a,b+h/2,h)
    vs = np.zeros((N, len(v0)))
    y,ys[0] = y0,y0
    x0 = xs[0]
    v,vs[0] = v0,v0
    for i in range(N):
        ys[i,:] = y # to allow for vector solutions
        vs[i,:] = v
        [y,v] = meth(ys[i], vs[i],xs[i],h,f)
    return ys, vs