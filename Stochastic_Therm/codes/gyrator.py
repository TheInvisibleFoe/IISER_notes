import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from matplotlib.patches import Circle
import matplotlib
from numba import njit 
# import scienceplots
# plt.style.use(['science'])
# plt.rcParams.update({'font.size': 20, 'font.weight': 'bold', 'font.family': 'sans-serif'})

# euler maryuma for simulating a brownian gyrator, with a more general potential.
@njit
def brownian_gyrator(k, alpha, T, eta, ini, dt, nsteps):
    """
    brownian_gyrator 
    
    Simulation of a Brownian gyrator as done by the original paper. 
    An anisotropic harmonic potential is rotated by an angle.add()

    Parameters
    ----------
    k : float array(2x1)
        The stiffness of the harmonic potential in x and y direction.
    alpha : float
        The rotation angle of the potential.
    T : float array(2x1)
         The temperatures of the two heat baths in x and y direction.
    eta : float array(2x1)
        The friction coefficients in x and y direction.
    ini : float array(2x1)
        The initial position of the particle.
    dt : float
        The time step.
    nsteps : int
        The number of steps in the simulation.

    Returns
    -------
    tuple of arrays
        The x and y coordinates of the particle over time.
    """
    x = np.zeros(nsteps)
    y = np.zeros(nsteps)
    kx = k[0]
    ky = k[1]
    x[0] = ini[0]
    y[0] = ini[1]
    eta_x = eta[0]
    eta_y = eta[1]
    Tx = T[0]
    Ty = T[1]
    for i in range(1, nsteps):
        x[i] = x[i-1] + dt*(-1/eta_x)*(kx*(np.cos(alpha)*x[i-1] + ky*np.sin(alpha)*y[i-1])*np.cos(alpha) - ky*(np.cos(alpha)*y[i-1] - np.sin(alpha)*x[i-1])*np.sin(alpha)) + np.sqrt(2*Tx/eta_x)*np.random.normal(0, np.sqrt(dt))
        y[i] = y[i-1] + dt*(-1/eta_y)*(-kx*(np.cos(alpha)*x[i-1] + ky*np.sin(alpha)*y[i-1])*np.sin(alpha) + ky*(np.cos(alpha)*y[i-1] - np.sin(alpha)*x[i-1])*np.cos(alpha)) + np.sqrt(2*Ty/eta_y)*np.random.normal(0, np.sqrt(dt))
    
    return x, y

# new brownian gyrator with a constraint. 
@njit
def bgyrator(k,alpha,T,eta,ini,dt,nsteps):
    x = np.zeros((nsteps,2))
    A = np.zeros((2,2))
    B = np.zeros((2,2))
    A[0,0] = k/eta
    A[0,1] = alpha/eta
    A[1,0] = alpha/eta
    A[1,1] = k/eta
    
    B[0,0] = np.sqrt(2*T[0]/eta)
    B[1,1] = np.sqrt(2*T[1]/eta)
    
    x[0] = ini
    
    for i in range(1,nsteps):
        xi = np.random.normal(0,np.sqrt(dt),(2,))
        x[i] = x[i-1] - dt*(A @ x[i-1]) + B @ xi
    return x
# Underdamped brownian gyrator 
@njit
def ubgyrator(k,alpha,m,T,eta,ini,dt,nsteps):
    A = np.zeros((4,4))
    B = np.zeros((4,4))
    x = np.zeros((nsteps,4))
    A[0,2] = 1/m
    A[1,3] = 1/m
    A[2,0] = -k
    A[2,1] = -alpha
    A[2,2] = -eta/m
    A[3,0] = -alpha
    A[3,1] = -k
    A[3,3] = -eta/m
    B[2,2] = np.sqrt(2*T[0]*eta/m**2)
    B[3,3] = np.sqrt(2*T[1]*eta/m**2)
    x[0] = ini
    for i in range(1,nsteps):
        xi = np.random.normal(0,np.sqrt(dt),(4,))
        x[i] = x[i-1] + dt*(A @ x[i-1]) + B @ xi
    return x,A,B
    
# Underdamped brownian gyrator 
@njit
def ubgyrator_imp(k,u,m,T,eta,ini,dt,nsteps):
    F = np.zeros((4,4))
    B = np.zeros((4,4))
    x = np.zeros((nsteps,4))
    xt = np.zeros((nsteps,4))
    F[0,2] = k
    
    B[2,2] = np.sqrt(2*T[0]*eta/m**2)
    B[3,3] = np.sqrt(2*T[1]*eta/m**2)
    x[0] = ini
    alpha = 1-np.exp(-eta*dt)
    for i in range(1,nsteps):
        xi = np.random.normal(0,np.sqrt(dt),(4,))
        
        x[i] = x[i-1] - dt*(F @ x[i-1]) + B @ xi
    return x,F,B
    
# Define the potential function for the Brownian gyrator
@njit
def potentialbr(x, y, k, alpha):
    """
    Potential for Brownian gyrator: U(x,y) = (1/2)k(x² + y²) + αxy
    """
    return 0.5 * k * (x**2 + y**2) + alpha * x * y

# Generate potential contour data
@njit
def generate_potential_grid(k, alpha, x_range, y_range, n_points=100):
    """
    Generate grid for potential contour plot
    """
    x = np.linspace(x_range[0], x_range[1], n_points)
    y = np.linspace(y_range[0], y_range[1], n_points)
    X, Y = np.meshgrid(x, y)
    Z = potentialbr(X, Y, k, alpha)
    return X, Y, Z

@njit
def angularmomentum(trajectory):
    x = trajectory[:, 0]
    y = trajectory[:, 1]
    px = trajectory[:, 2]
    py = trajectory[:, 3]
    L = x*py - y*px
    return L

# @njit
def odangularmomentum(x,y,dt):
    vx = np.diff(x)/dt
    vy = np.diff(y)/dt
    L = x[:-1]*vy - y[:-1]*vx
    return L

def theoangularmomentum(k, u, eta, m, T):
    T1 = T[0]
    T2 = T[1]
    diffT = T2 - T1
    L = (eta*m*u*diffT)/(eta*k*eta + u*u*m )
    return L
def potentialbr(x, y, k, alpha):
    """
    Potential for Brownian gyrator: U(x,y) = (1/2)k(x² + y²) + αxy
    """
    return 0.5 * k * (x**2 + y**2) + alpha * x * y

# Generate potential contour data
def generate_potential_grid(k, alpha, x_range, y_range, n_points=100):
    """
    Generate grid for potential contour plot
    """
    x = np.linspace(x_range[0], x_range[1], n_points)
    y = np.linspace(y_range[0], y_range[1], n_points)
    X, Y = np.meshgrid(x, y)
    Z = potentialbr(X, Y, k, alpha)
    return X, Y, Z


##================================================================================================
##------------ SOME SHIT FROM CHATGPT, ON EXACT SIMS USING CHOLESKY -----------------------------=
##================================================================================================

# import numpy as np
import scipy.linalg
# from numba import njit

def exact_ubgyrator(k, alpha, m, T, eta, ini, dt, nsteps):
    """
    Exact simulation of the underdamped Brownian gyrator.
    
    Parameters
    ----------
    k : float
        Stiffness of the isotropic harmonic part.
    alpha : float
        Coupling strength (off‑diagonal potential term).
    m : float
        Mass of the particle.
    T : array_like (2,)
        Temperatures [Tx, Ty] of the two heat baths.
    eta : float
        Friction coefficient (same for both directions).
    ini : array_like (4,)
        Initial state [x, y, vx, vy].
    dt : float
        Time step.
    nsteps : int
        Number of steps.

    Returns
    -------
    traj : ndarray, shape (nsteps, 4)
        Trajectory containing [x, y, vx, vy] at each time step.
    """
    # --- Build the drift matrix A and diffusion matrix B ---
    A = np.zeros((4, 4))
    A[0, 2] = 1.0 / m
    A[1, 3] = 1.0 / m
    A[2, 0] = -k
    A[2, 1] = -alpha
    A[2, 2] = -eta / m
    A[3, 0] = -alpha
    A[3, 1] = -k
    A[3, 3] = -eta / m

    B = np.zeros((4, 4))
    B[2, 2] = np.sqrt(2.0 * T[0] * eta) / m
    B[3, 3] = np.sqrt(2.0 * T[1] * eta) / m

    # --- Precompute the exact discrete-time matrices ---
    # 1. Matrix exponential of A * dt
    M = scipy.linalg.expm(A * dt)

    # 2. Stationary covariance of the continuous process (solve Lyapunov equation)
    #    A @ Sigma_inf + Sigma_inf @ A.T + B @ B.T = 0
    Q = B @ B.T
    Sigma_inf = scipy.linalg.solve_continuous_lyapunov(A, -Q)

    # 3. Covariance of the discrete noise: Sigma_zeta = Sigma_inf - M @ Sigma_inf @ M.T
    Sigma_zeta = Sigma_inf - M @ Sigma_inf @ M.T

    # 4. Cholesky factor of Sigma_zeta (for fast noise generation)
    #    Add a tiny diagonal to guard against near-singularity
    try:
        L_zeta = np.linalg.cholesky(Sigma_zeta)
    except np.linalg.LinAlgError:
        eps = 1e-12
        L_zeta = np.linalg.cholesky(Sigma_zeta + eps * np.eye(4))

    # --- JIT-compiled simulation loop ---
    # @njit
   

    return M , L_zeta

@njit
def simulate(ini, M, L_zeta, nsteps):
    traj = np.zeros((nsteps, 4))
    ini = np.array(ini)
    traj[0] = ini
    state = ini.copy()
    for i in range(1, nsteps):
        xi = np.random.normal(0,1,(4,))              # standard normal vector
        noise = L_zeta @ xi
        state = M @ state + noise
        traj[i] = state
    return traj 
    