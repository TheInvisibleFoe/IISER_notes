#import "/src/library.typ": exercise
#import exercise: project, task, subtask
#import "imports.typ":*
#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  x: 1.5cm,
))
#set math.equation(numbering: "(1)")
#show ref: it => {
  let eq = math.equation
  let el = it.element
  // Skip all other references.
  if el == none or el.func() != eq { return it }
  // Override equation references.
  link(el.location(), numbering(
    el.numbering,
    ..counter(eq).at(el.location())
  ))
}

#let task = task.with(numbering-format: (..n) => numbering("1", ..n))
#let subtask = subtask.with(markers: ("a)", "1)"))
#set text(lang: "en")

#show: project.with(
  // no: 3,
  type: "PH4101 Assignment",
  suffix-title: [3\ 22MS037],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  box-task-title: [Problem],
  box-hint-title: [Hinweis],
  box-solution-title: [Lösung],

  university: [*Condensed Matter PH4101*],
  institute: [],
  seminar: [Sabarno Saha, 22MS037],

  date: datetime(year: 2025, month: 11, day: 16),
)

#task[Kronig Penny Model][][
  #subtask[Done in Class.]
  #subtask[
    The Kronig Penny Dispersion relation is given by
    $
      cos(k a) = cos(alpha(a-b))cosh(beta b) + ((alpha^2 - beta^2)/(2 alpha beta)) sinh(beta b) sin(alpha(a-b))
    $
    where $alpha = sqrt((2 m E)\/(hbar^2))$ and $beta = sqrt((2 m (U - E))\/(hbar^2))$.
    
    #figure(
        image("kronig_penney_bands.png", width:60%),
        caption:"The bands in the Kronig Penny Model"
    )
  ]
  #subtask[
    In the limiting case when $b --> 0$ and $E --> oo$ such that $V_0 = U b$ is constant, we have,
    $
      beta &= sqrt((2 m (U - E))/(hbar^2))  approx sqrt((2 m U)/(hbar^2)) = q \
      beta b &= sqrt((2 m (U - E) b^2)/(hbar^2))  --> 0 \
    $
    Then we can approximate the hyperbolic functions as
    $
      cosh(alpha b) approx 1 \
      sinh(alpha b) approx alpha b \
    $
    Then the dispersion relation becomes,
    $
      cos(k a) &= cos(alpha a) + 1/(2 alpha) sqrt((2 m U)/hbar^2) (beta b) sin(alpha a) \ 
     &= cos(alpha a) + (m V_0)/(hbar^2 alpha) sin(alpha a)
    $
    Note that if the RHS in the dispersion relation is greater than $1$ or less than $-1$, there are no real solutions for $k$. However, if we allow for complex $K$, we can find solutions in these regions as well. 
    
  ]
]

#task[2D tight binding][][
  The tight binding Hamiltonian for a two- dimensional square lattice is given by
  $
    H = -t sum_(n,m) [ ketbra(m+1","n,m","n) + ketbra(m","n+1,m","n) + h.c.] + eps_0 sum_(n,m) ketbra(m","n,m","n)
  $
  #subtask[
    Using Bloch's theorem, the Bloch states are given by
    $
    ket(psi(vb(k))) = 1/sqrt(N) sum_(n,m) e^(i vb(k) cdot vb(r)_(m,n)) ket(m","n) "where" vb(r)_(m,n) = m a hat(x) + n a hat(y)
    $
    where $ket(m","n)$ are the orthonormal localized basis states at site $(m,n)$ and $N$ is the total number of lattice sites. The basis states satisfy the orthonormality condition $braket(m'","n'","m","n) = delta_(m',m) delta_(n',n)$.
    Using these states we can evaluate the action of the Hamiltonian on the bloch states. Let's consider the hopping term in the $x$ direction first,
    $      -t sum_(n,m) [ ketbra(m+1","n,m","n) + h.c.] ket(psi(vb(k)))
      &= -t sum_(n,m) [ ket(m+1","n) braket(m","n,psi(vb(k))) + ket(m","n) braket(m+1","n,psi(vb(k))) ] \
      &= -t sum_(n,m) [ ket(m+1","n) (1/sqrt(N)) e^(i vb(k) cdot vb(r)_(m,n)) + ket(m","n) (1/sqrt(N)) e^(i vb(k) cdot vb(r)_(m+1,n)) ] \
      &= -t (1/sqrt(N)) sum_(n,m) [ e^(i vb(k) cdot (m+1) a hat(x) + n a hat(y)) + e^(i vb(k) cdot (m) a hat(x) + n a hat(y)) e^(i k_x a) ] ket(m","n) \
      &= -t (e^(i k_x a) + e^(-i k_x a)) (1/sqrt(N)) sum_(n,m) e^(i vb(k) cdot vb(r)_(m,n)) ket(m","n) \
      &= -2 t cos(k_x a) ket(psi(vb(k)))
    $
    Similarly, for the hopping term in the $y$ direction, we have
    $      -t sum_(n,m) [ ketbra(m","n+1,m","n) + h.c.] ket(psi(vb(k)))
      &= -2 t cos(k_y a) ket(psi(vb(k)))  
    $
    The on-site potential term gives
    $      eps_0 sum_(n,m) ketbra(m","n,m","n) ket(psi(vb(k)))
      &= eps_0 ket(psi(vb(k)))
    $
    The Time independent Schrodinger equation $H ket(psi(vb(k))) = E(vb(k)) ket(psi(vb(k)))$ then gives us the following equation,
    $
      E(vb(k)) ket(psi(vb(k))) = [ -2 t cos(k_x a) - 2 t cos(k_y a) + eps_0 ] ket(psi(vb(k)))
    $
    This gives us the dispersion relation for the two dimensional tight binding model as
    $
      E(vb(k)) = eps_0 - 2 t [ cos(k_x a) + cos(k_y a) ]
    $
    The Equal energy contours can be found by solving the equation
    #figure(
        image("equal_energy_contours.png", width:60%),
        caption:"Equal energy contours for the 2D tight binding model at various energies"
    )
  ]
  #subtask[
    The density of states can be found out using the formula,
    $
      g(E) = 1/(2 pi )^2 int_(B Z) d^2 vb(k) delta(E - E(vb(k)))
    $
    The integral is over the first Brillouin zone given by $-pi/a leq k_x, k_y leq pi/a$. The dispersion relation is given by,
    $
      delta(E - E(vb(k))) &= delta(E - eps_0 + 2 t [ cos(k_x a) + cos(k_y a) ]) \
      &= 1/(2 t) delta(Epsilon - cos(k_x a) - cos(k_y a)) "where" Epsilon = (eps_0 - E)/(2 t)
      $
    Now change the variables of integration from $k_x, k_y$ to $x = k_x a, y = k_y a$. The limits of integration change from $-pi$ to $pi$. Also note that both $cos(.)$ and $delta(.)$ are symmetric functions. The density of states becomes
    $
      g(E) &= 1/(2 pi a)^2 (1/(2t)) int_(-pi)^(pi) d x int_(-pi)^(pi) d y delta(Epsilon - cos(x) - cos(y))\
      &= 1/(2 pi a)^2 (1/(2t)) int_(-pi)^(pi) d x int_(-pi)^(pi) d y delta(cos(y) - (Epsilon - cos(x))) \
      &= 1/(2 pi a)^2 (2/(t)) int_(0)^(pi) d x [ 1/(|sin(y_0)|) ] "where" y_0 = arccos(Epsilon - cos(x))\
      &= 1/(2 pi a)^2 (2/(t)) int_(0)^(pi) d x [ 1/(sqrt(1 - (Epsilon - cos(x))^2)) ] Theta(1 - |Epsilon - cos(x)|)
    $
    where $Theta(.)$ is the Heaviside step function which is required since the $arccos(.)$ function is only defined for inputs between $-1$ and $1$. Using a variable $z=cos(x)$, we can write the density of states as
    $
      g(E) &= 1/(2 pi a)^2 (2/(t)) int_(-1)^(1) (d z)/(sqrt(1 - z^2) sqrt(1 - (Epsilon - z)^2)) Theta(1 - |Epsilon - z|) \
      &= 1/(2 pi a)^2 (2/(t)) int_(max(-1,Epsilon-1))^(min(1,Epsilon+1)) (d z)/(sqrt(1 - z^2) sqrt(1 - (Epsilon - z)^2))
    $
    and $g(E) = 0$ otherwise. The integral can be evaluated in terms of elliptic integrals. The final expression for the density of states is given by
    $
      g(E) = 1/(2 pi^2 a^2 t) K( sqrt(4 - Epsilon^2)/2 ) "for" |Epsilon| leq 2 \
      g(E) = 0 "otherwise"
    $
    #figure(
      image("density_of_states.png", width:60%),
        caption:"Density of states for the 2D tight binding model"
    )
    We can observe from the plot, that the Van Hove singularities take place at $Epsilon = 0$ or $E = eps_0$. At these energies, the density of states diverges logarithmically.
    
  ]
  #subtask[
    We now need to find the Fermi momentum and Fermi energy. Note the transformation from $vb(k) = (k_x, k_y)$ to $vb(k') = (k_x + pi/a, k_y + pi/a)$ changes the energy as
    $
      E(vb(k')) &= eps_0 - 2 t [ cos((k_x + pi/a) a) + cos((k_y + pi/a) a) ] \
      &= eps_0 - 2 t [ -cos(k_x a) - cos(k_y a) ] = 2 eps_0 - E(vb(k))
    $
    We will now show that the DOS is symmetric about $E = eps_0$. This allows us to obtain the Fermi energy and momentum without calculating the total number of states explicitly. The density of states is given by
    $
      g(E) &= 1/(2 pi )^2 int_(B Z) d^2 vb(k) delta(E - E(vb(k))) \
      &= 1/(2 pi )^2 int_(B Z) d^2 vb(k') delta(E - (2 eps_0 - E(vb(k')))) "where" vb(k') = (k_x + pi/a, k_y + pi/a) \
      &= 1/(2 pi )^2 int_(B Z) d^2 vb(k') delta((2 eps_0 - E) - E(vb(k'))) \
      &= g(2 eps_0 - E)
    $
    Let's consider the fully filled band case first. Here, the Fermi energy $E_F$ is at the top of the band. The maximum energy in the band is given by
    $
      E_max = eps_0 - 2 t [ cos(pi) + cos(pi) ] = eps_0 + 4 t
    $
    We also get 
    $
      2N = int_( eps_0 - 4 t)^(eps_0 + 4 t) g(E) d E = int_( eps_0)^(eps_0 + 4 t) g(E) d E + int_( eps_0 - 4 t)^(eps_0) g(E) d E \
    $
    Using the symmetry of the DOS about $E = eps_0$, we have
    $
      int_( eps_0 - 4 t)^(eps_0) g(E) d E = int_( eps_0)^(eps_0 + 4 t) g(E) d E
    $
    Therefore, we have,
    $
      2N = 2 int_( eps_0 - 4 t)^(eps_0 ) g(E) d E \
      ==> N = int_( eps_0 -4 t)^(eps_0) g(E) d E
    $
    Comparing this with the half filled case, we see that the Fermi energy for the half filled case is given by
    $
      E_F = eps_0
    $
    The corresponding Fermi momentum can be found by solving the equation,
    $
      E_F = eps_0 - 2 t [ cos(k_F_x a) + cos(k_F_y a) ] \
      ==> cos(k_F_x a) + cos(k_F_y a) = 0
    $
    Within the first Brillouin zone, the Fermi surface is given by the square connecting the points $(pm pi/a,0)$ and $(0, pm pi/a)$, which is given by the 4 equations,
    $
      k_F_y = pm (pi/a - k_F_x) "for" 0 leq k_F_x leq pi/a \
      k_F_y = pm (-pi/a - k_F_x) "for" -pi/a leq k_F_x leq 0
    $
    The Fermi surface is shown below.
    #figure(
      image("fermi_surface.png", width:40%),
        caption:"Fermi surface for the half filled 2D tight binding model"
    )
    
  ]
  



]
#task[Tight Binding with Staggered Potential][][
  The Hamiltonian for a one dimensional  with staggered potential is given by
  $
    H = -t sum_n [ketbra(n,n+1) + h.c.] + U sum_n  ketbra(n,n) + V sum_n (-1)^n ketbra(n,n)
  $
  We divide the chain into two sublattices A and B such that even sites belong to A and odd sites belong to B. All "A" sites have on-site potential $U+V$ and all "B" sites have on-site potential $U-V$. One other change takes place, the periodicity of the lattice changes from $a$ to $2a$. This makes the unit cell contain two sites, one from sublattice A and one from sublattice B.

  We can now rewrite the Hamiltonian as
  $
    H = -t sum_n [
      underbrace(ket(n)_A bra(n)_B +h.c.,1) + underbrace(ket(n+1)_B bra(n)_A + h.c.,2)] \
     #h(15em) + sum_n [underbrace((U+V) ket(n)_A bra(n)_A,3)] + sum_n [underbrace((U-V) ket(n)_B bra(n)_B,4)]
  $<p>
  where $n_A$ and $n_B$ denote the site index for sublattice A and B respectively. The terms (1) and (2) denote hopping between A and B sublattices while terms (3) and (4) denote on-site potentials for A and B sublattices respectively. (1) and (2) are hopping terms where (1) denotes hopping from A to B within the same unit cell while (2) denotes hopping from B to A in the next unit cell.

  #subtask[
    We now need to find the dispersion relation for this system. To do this, we write the Hamiltonian in the $k$-space basis. The position basis states can be written in terms of the $k$-space basis states as
    $
      ket(n)_A = (1/sqrt(N\/2)) sum_k e^(-i k n (2 a)) ket(k)_A
    $
    $
      ket(n)_B = (1/sqrt(N\/2)) sum_k e^(-i k n (2 a)) ket(k)_B
    $
    where $N$ is the total number of sites in the chain. Using these relations, we can rewrite each term in the Hamiltonian in the $k$-space basis. To do this we consider the Hamiltonian term by term. Note that there are only two types of terms: terms between same index sublattices and terms between different index sublattices.
    Terms (1), (3) and (4) are between same index sublattices while term (2) is between different index sublattices.

    *Term (1)*:
    $
      T_1 &= -t sum_n [ket(n)_A bra(n)_B + ket(n)_B bra(n)_A] \
      &= -t sum_(k,k') [ (1/sqrt(N\/2)) sum_n e^(-i (k - k') n (2 a)) ] ket(k)_A bra(k')_B + h.c. \
      &= -t sum_(k,k') [ delta_(k,k') ] ket(k)_A bra(k')_B + h.c. \
      &= -t sum_k [ ket(k)_A bra(k)_B + ket(k)_B bra(k)_A ]
    $

    *Term (2)*:
    $
      T_2 &= -t sum_n [ket(n+1)_B bra(n)_A + ket(n)_A bra(n+1)_B] \
      &= -t sum_(k,k') [ (1/sqrt(N\/2)) sum_n e^(-i (k - k') n (2 a)) e^(-i k' (2 a)) ] ket(k)_B bra(k')_A + h.c. \
      &= -t sum_(k,k') [ delta_(k,k') e^(-i k' (2 a)) ] ket(k)_B bra(k')_A + h.c. \
      &= -t sum_k [ e^(-i k (2 a)) ket(k)_B bra(k)_A + e^(i k (2 a)) ket(k)_A bra(k)_B ]
    $
    The Hamiltonian @p can then be written in the $k$-space basis as
    $
      H = sum_k [
        -t (1 + e^(-i k (2 a))) ket(k)_B bra(k)_A  -t( 1 + e^(i k (2 a))) ket(k)_A bra(k)_B \
        + (U+V) ket(k)_A bra(k)_A + (U-V) ket(k)_B bra(k)_B
      ]

    $
    Note that $(1+e^( pm i k (2 a))) = 2 cos(k a) e^( pm i k a)$. Using this, we can write the Hamiltonian as,
    $
      H(k) = sum_k [
        -2 t cos(k a) e^(-i k a) ket(k)_B bra(k)_A - 2 t cos(k a) e^(i k a) ket(k)_A bra(k)_B \
        + (U+V) ket(k)_A bra(k)_A + (U-V) ket(k)_B bra(k)_B
      ]
    $
    Note in our unit cell, we have two basis states, $ket(k)_B$ and $ket(k)_A$. Therefore, the Hamiltonian can be represented as a $2 times 2$ matrix in this basis ${ket(k)_B, ket(k)_A}$ as
    $
      H &= sum_k (ket(k)_B " "ket(k)_A)H(k)vec(ket(k)_B,ket(k)_A) "where" \
      H(k) &= mat(
        U-V, -2 t cos(k a) e^(i k a);
        -2 t cos(k a) e^(-i k a), U+V
      )
    $
    The dispersion relates the energy eigenvalues $E(k)$ of the Hamiltonian $H(k)$ to the momentum $k$. To find the energy eigenvalues, we need to solve the characteristic equation given by
    $
      det(H(k) - E II) = 0
    $
    We obtain,
    #set math.mat(delim:"|")
    $
      mat(U-V - E, -2 t cos(k a) e^(i k a);
        -2 t cos(k a) e^(-i k a), U+V - E
      ) = 0 \
      ==> (U+V-E)(U-V-E) - 4 t^2 cos^2(k a) = 0 \
      ==> (U-E)^2 - V^2 - 4 t^2 cos^2(k a) = 0 \
      ==> E(k) = U pm sqrt(V^2 + 4 t^2 cos^2(k a))
    $
    #set math.mat(delim:"(")
  ]
  #subtask[
    The Brillouin zone for this system is given by $-pi/(2 a) leq k leq pi/(2 a)$. This is smaller than the original Brillouin zone $-pi/a leq k leq pi/a$ due to the doubling of the unit cell size from $a$ to $2 a$.
    The energy levels in the Brillouin zone are shown below.
    #figure(
      image("coupled_orbitals_dispersion.png", width:60%),
        caption:"Energy bands for the 1D tight binding model with staggered potential"
    )
  ]

]
#task[Parallel Chains][][
  The two parallel chain system have a tight binding Hamiltonian given by
  $
    H = -t sum_n (ketbra(n","s,n+1","s) + h.c.) - t' sum_n (ketbra(n","p,n+1","p) + h.c.) \
    - Omega sum_n ketbra(n","s,n","p) + h.c. + eps_p sum_n ketbra(n","p,n","p) + eps_s sum_n ketbra(n","s,n","s)
  $
  #subtask[
    We now need transform the Hamiltonian to the $k$-space basis. The bloch states are given as
    $
      ket(k","s) = 1/sqrt(N) sum_n e^(i k n a) ket(n","s) quad ;quad
      ket(k","p) = 1/sqrt(N) sum_n e^(i k n a) ket(n","p)
    $
    Taking the inverse fourier transform, we have
    $
      ket(n","s) = 1/sqrt(N) sum_k e^(-i k n a) ket(k","s) quad;quad
      ket(n","p) = 1/sqrt(N) sum_k e^(-i k n a) ket(k","p)
    $
    We then plug these into the Hamiltonian term by term. Note that there are three types of terms: hopping within same chain, hopping between different chains and on-site potential terms.
    $
      -t sum_n (ketbra(n","s,n+1","s) + h.c.) &= -t sum_(k,k') [ (1/sqrt(N)) sum_n e^(-i (k - k') n a) e^(-i k' a) ] ket(k","s) bra(k'","s) + h.c. \
      &= -t sum_(k,k') [ delta_(k,k') e^(-i k' a) ] ket(k","s) bra(k'","s) + h.c. \
      &= -t sum_k [ e^(-i k a) ket(k","s) bra(k","s) + e^(i k a) ket(k","s) bra(k","s) ] \
      &= -2 t sum_k cos(k a) ket(k","s) bra(k","s)
    $
    Similarly, for the $p$ chain hopping term, we have
    $
      -t' sum_n (ketbra(n","p,n+1","p) + h.c.) &= -2 t' sum_k cos(k a) ket(k","p) bra(k","p)
    $
    The inter-chain hopping term gives
    $
      - Omega sum_n (ketbra(n","s,n","p) + h.c.) &= - Omega sum_(k,k') [ (1/sqrt(N)) sum_n e^(-i (k - k') n a) ] ket(k","s) bra(k'","p) + h.c. \
      &= - Omega sum_(k,k') [ delta_(k,k') ] ket(k","s) bra(k'","p) + h.c. \
      &= - Omega sum_k [ ket(k","s) bra(k","p) + ket(k","p) bra(k","s) ]
    $
    The on-site potential terms give, similarly,
    $
      eps_s sum_n ketbra(n","s,n","s) &= eps_s sum_k ket(k","s) bra(k","s) \
      eps_p sum_n ketbra(n","p,n","p) &= eps_p sum_k ket(k","p) bra(k","p)
    $
    Combining all these terms, we can write the Hamiltonian in the $k$-space
    basis as
    $
      H = sum_k [
        (-2 t cos(k a) + eps_s) ket(k","s) bra(k","s) + (-2 t' cos(k a) + eps_p) ket(k","p) bra(k","p) \
        - Omega (ket(k","s) bra(k","p) + ket(k","p) bra(k","s))
      ]
    $
    In the basis ${ket(k","s), ket(k","p)}$, the Hamiltonian can be written in a matrix form as
    $
      H = sum_k (ket(k","s) " "ket(k","p)) H(k) vec(ket(k","s), ket(k","p)) "where" \
      H(k) = mat(
        -2 t cos(k a) + eps_s, - Omega;
        - Omega, -2 t' cos(k a) + eps_p
      )
    $
  ]
  #subtask[
    Similar to the previous problem, we can find the dispersion relation by solving the characteristic equation given by
    $      det(H(k) - E II) = 0
    $. We obtain,
    #set math.mat(delim:"|")
    $      mat(-2 t cos(k a) + eps_s - E, - Omega;
        - Omega, -2 t' cos(k a) + eps_p - E
      ) = 0 \
      ==> (-2 t cos(k a) + eps_s - E)(-2 t' cos(k a) + eps_p - E) - Omega^2 = 0 \
      ==> E_pm (k) = (eps_s + eps_p - 2 (t + t') cos(k a))/2 pm sqrt(((eps_s - eps_p)/2 -  (t - t') cos(k a))^2 + Omega^2)
    $
  ]

]
#task[Bloch Theorem][][
  The wavefunction in a lattice with lattice constat $a$ can be obeys the Bloch theorem,
  $
    psi_(n,k)(x) = e^(i k x) u_(n,k)(x) "where" u_(n,k)(x + a) = u_(n,k)(x)
  $
  #subtask[
    We need to show that
    $
      h_k u_(n,k)(x) = E_(n,k) u_(n,k)(x) "where" h_k = (-(hbar^2)/(2 m)) (p_x + i k)^2 + V(x)
    $
    We start with the time independent schrodinger equation,
    $
      H psi_(n,k)(x) = E_(n,k) psi_(n,k)(x) "where" H = (-(hbar^2)/(2 m)) p_x^2 + V(x)
    $
    Note that $p_x = -i hbar pdv(,x)$. $p_x$ acting on $psi_(n,k)(x)$ gives
    $
      p_x psi_(n,k)(x) &= -i hbar pdv(,x) (e^(i k x) u_(n,k)(x)) = e^(i k x) (hbar k u_(n,k)(x) - i hbar pdv(u_(n,k)(x),x)) \
      &= e^(i k x) (hbar k + p_x) u_(n,k)(x)
    $
    Acting $p_x^2$ on $psi_(n,k)(x)$ gives
    $
      p_x^2 psi_(n,k)(x) &= p_x (e^(i k x) (hbar k + p_x) u_(n,k)(x)) \
     & = hbar k e^(i k x)(hbar k + p_x) u_(n,k)(x) + e^(i k x) p_x (hbar k + p_x) u_(n,k)(x) \
      &= e^(i k x) (hbar k + p_x)^2 u_(n,k)(x)
    $
    Thus we can see that,
    $
      & H psi_(n,k)(x) = E_(n,k) psi_(n,k)(x) \
      ==> & [ (-(hbar^2)/(2 m)) p_x^2 + V(x) ] e^(i k x) u_(n,k)(x) = E_(n,k) e^(i k x) u_(n,k)(x) \
      ==> & e^(i k x) [ (-(hbar^2)/(2 m)) (hbar k + p_x)^2 + V(x) ] u_(n,k)(x) = E_(n,k) e^(i k x) u_(n,k)(x) \
      ==> & h_k u_(n,k)(x) = E_(n,k) u_(n,k)(x)
    $
  ]
  #subtask[
    We now consider the case when $V(x)$ is a weak perturbing potential. We can write $V(x)$
    as
    $
      V(x) =  V_G_1 e^(i G_1 x) + V^*_G_1 e^(-i G_1 x)
    $
    where $G = 2 pi/a$ is the reciprocal lattice vector.
    The unperturbed Hamiltonian is just the hamiltonian of a free particle. The energy eigenvalues are given by
    $
     eps (k) = (hbar^2 k^2)/(2 m)
    $
    The energy levels are doubly degenerate since $eps_0 (k) = eps_0 (-k)$. The Perturbation $V(x)$ lifts this degeneracy, and introduces a band gap at the boundary of the Brillouin zone $k = pm pi/a$. At the boundary of the Brillouin zone, the energy is given by
    $
      eps_0 = (hbar^2 pi^2)/(2 m a^2)
    $
    Let us consider the states $ket(pm k_1) = ket(k = pm G_1/2)$.
    The diagonal elements are given by
    $
      braket(pm k_1,H,pm k_1) = eps_0
    $
    We now need to calculate the off-diagonal elements. Note that the off diagonal elements in the unperturbed hamiltonian are $0$. We have
    $
      braket(k_1, H, - k_1) &= braket(k_1, V, - k_1) \
      &= int_0^a (d x)/a e^(-i k_1 x) [ V_G_1 e^(i G_1 x) + V^*_G_1 e^(-i G_1 x) ] e^(- i k_1 x) \
      &= int_0^a (d x)/a [ V_G_1 e^(i (G_1 - G_1) x) + V^*_G_1 e^(-i (G_1 + G_1) x) ]  = V_G_1
    $
    Similarly,
    $
      braket(- k_1, H, k_1) = V^*_G_1
    $
    The matrix elements of the Hamiltonian in this block in this basis are given by,
    $
      H = mat(
        bra(k_1) H ket(k_1), bra(k_1) H ket(-k_1);
        bra(-k_1) H ket(k_1), bra(-k_1) H ket(-k_1)
      ) = mat(
        eps_0, V_G_1;
        V^*_G_1, eps_0
      )
    $
    The Energy eigenvalues are,
    $
      E = eps_0 pm |V_G_1|
    $
    The Bandgap at the boundary of the Brillouin zone is therefore given by
    $
      Delta = 2 |V_G_1|
    $
  ]
  #subtask[
    We have the periodic Gaussian potential given by
    $
      V(x) = -V_0 sum_n e^(-alpha(x - n a)^2)
    $
    The Fourier components of the potential are given by
    $
    V_G &= 1/a int_( 0)^a V(x) e^(-i G x) d x\
    &= -V_0/a sum_n int_( 0)^a e^(-alpha(x - n a)^2) e^(-i G x) d x \
    &= -V_0/a sum_n e^(-i G n a) int_( a - n a)^(n a) e^(-alpha x'^2) e^(-i G x') d x' "where" x' = x - n a \
    $
    Note that $e^(-i G n a) = 1$ since $G = 2 pi m/a$. Also note the integral goes over the interval $(a-n a,n a)$. If $n in ZZ$, then the sum of all these integrals is equal to the integral from $-oo$ to $oo$. Therefore, we have a gaussian integral,
    $
    V_G &= -V_0/a int_(-oo)^(oo) e^(-alpha x'^2) e^(-i G x') d x' \
    &= -V_0/a sqrt(pi/alpha) e^(-G^2/(4 alpha))
    $
    The bandgap at the boundary of the Brillouin zone for the weak potential approximation is therefore given by
    $
      Delta = 2 |V_G_1| = (2 V_0)/a sqrt(pi/alpha) exp(- (pi^2)/(a^2 alpha))
    $
  ]
  #subtask[
    We allow the Bloch wavevector to be complex, i.e., $k = G/2 + i chi$. The energy for a free particle is given by
    $
    eps(k) = (hbar^2 k^2)/(2 m) = (hbar^2)/(2 m) (G^2/4 - chi^2 + i G chi)
    $
    The energy at the boundary of the Brillouin zone is given by
    $
      epsilon_0^pm &= (hbar^2)/(2 m) (pm G_1/2 pm i chi)^2 = (hbar^2)/(2 m) (G_1^2/4 - chi^2 pm i G_1 chi)\
      &= underbrace(eps_0 - (hbar^2 chi^2)/(2 m),E) pm i underbrace((hbar^2 G_1 chi)/(2 m),xi) \
      &= E pm i xi
    $
    The Hamiltonian matrix in the basis ${ket(k_1), ket(-k_1)}$ is given by,
    $      H = mat(
        E + i xi, V_G_1;
        V^*_G_1, E - i xi
      )
    $
    The energy eigenvalues are given by
    $
      E^pm = E pm sqrt(|V_G_1|^2 - xi^2) = eps_0 - (hbar^2 chi^2)/(2 m) pm sqrt(|V_G_1|^2 - ((hbar^2 G_1)/(2 m))^2 chi^2)
    $
    For the energy eigenvalues to be real, we need
    $      & |V_G_1|^2 - ((hbar^2 G_1)/(2 m))^2 chi^2 geq 0 \
      ==> & |chi| leq (2 m |V_G_1|)/(hbar^2 G_1)
    $
    Over the this range of $chi$, the energy eigenvalues are real. In this range from $0$ to $chi = pm (2 m |V_G_1|)/(hbar^2 G_1)$, the energy eigenvalues vary from $eps_0 pm |V_G_1|$ to $eps_0 pm (2 m |V_G_1|^2)/(hbar^2 G_1^2)$. Thus by a suitable choice of complex wavevector, the energies within the bandgap can be obtained.
  ]
]
#task[Reciprocal Lattice Vectors][][
  #subtask[
    *Body Centred Cubic Lattice*\
    The primitive lattice vectors for a body centred cubic lattice are given by
    $
      vb(a_1) = a/2 (1,1,-1) quad;quad
      vb(a_2) = a/2 (-1,1,1) quad;quad
      vb(a_3) = a/2 (1,-1,1)
    $
    The volume of the primitive cell is given by
    $
      V_c = vb(a_1) cdot (vb(a_2) times vb(a_3)) = a^3/2
    $
    The reciprocal lattice vectors are given by
    $
      vb(b_1) = 2 pi (vb(a_2) times vb(a_3))/(vb(a_1) cdot (vb(a_2) times vb(a_3))) = (2 pi)/a (1,1,0)\
      vb(b_2) = 2 pi (vb(a_3) times vb(a_1))/(vb(a_2) cdot (vb(a_3) times vb(a_1))) = (2 pi)/a (0,1,1)\
      vb(b_3) = 2 pi (vb(a_1) times vb(a_2))/(vb(a_3) cdot (vb(a_1) times vb(a_2))) = (2 pi)/a (1,0,1)
    $
    These correspond to the primitive vectors of an face centred cubic lattice.
  ]
  #subtask[
    *Two Dimensional Equilateral Triangular Lattice*\
    The primitive lattice vectors for a two dimensional equilateral triangular lattice are given by
    $
      vb(a_1) = a (1,0) quad;quad
      vb(a_2) = a (1/2,sqrt(3)/2)
    $
    The area of the primitive cell is given by
    $      A_c = |vb(a_1) times vb(a_2)| = (sqrt(3) a^2)/2
    $
    The reciprocal lattice vectors are given by
    $      vb(b_1) = 2 pi (hat(z) times vb(a_2))/(vb(a_1) cdot (hat(z) times vb(a_2))) = (2 pi)/(a) (1,-1/sqrt(3))\
      vb(b_2) = 2 pi (hat(z) times vb(a_1))/(vb(a_2) cdot (hat(z) times vb(a_1))) = (2 pi)/(a) (0,2/sqrt(3))
    $
    These correspond to the primitive vectors of a two dimensional hexagonal lattice.
  ]

]
#task[Ultracold atoms][][
  The given periodic potential is
  $
    V(x) = V_0 (cos^2((pi x)/a) = V_0/2 (1+cos((2 pi x)/a))
  $
  We note that the potential has minima at $x = (n+1/2) a$ where $n in ZZ$. So near each lattice site, we can approximate the potential as a harmonic oscillator potential. Quantifying $xi_n = (x-x_n)$ to be small displacement. Near the minima, we can expand the potential as,
  $
    V(x) &approx (pi^2 V_0)/(a^2) xi_n^2 + O(xi_n^4)
  $
  So the total potential can be written as a sum over harmonic oscillator potentials at each lattice site,
  $
    V(x) &approx sum_n ( (pi^2 V_0)/(a^2) (x - x_n)^2 )
  $
  with the oscillation frequency given by
  $    omega = sqrt((2 pi^2 V_0)/(m a^2))
  $

  #subtask[
    The ground state wavefunction of a harmonic oscillator potential is given by
    $
      psi_0 (xi_n) = ((m omega)/(pi hbar))^(1/4) exp(-(m omega xi_n^2)/(2 hbar))
    $
    In our case, the ground state wavefunction localized at the $n^(t h)$ lattice site is given by
    $
      w_n (x) = ((m omega)/(pi hbar))^(1/4) exp(-(m omega (x - x_n)^2)/(2 hbar)) = 1/(pi s^2)^(1/4) exp(-((x - x_n)^2)/(2 s^2)) "where" s = sqrt(hbar/(m omega))
    $
    where $x_n = (n + 1/2) a$ is the position of the $n^(t h)$ lattice site. The bloch wavefunction can then be written as a superposition of these localized wavefunctions as
    $
      psi_k (x) = 1/sqrt(N) sum_n e^(i k x_n) w_n (x)
    $
  ]
  #subtask[
    We also need to find the nearest neighbour hopping amplitude $t$. The hopping amplitude is given by
    $
      t = - int d x w^*_(n+1) (x) [ -(hbar^2)/(2 m) d^2/d x^2 + V(x) ] w_(n) (x)
    $
    For our localized functions with Gaussian tails, the major contribution only arises from the sites $n$ and $n+1$. Therefore, we can approximate the potential $V(x)$ between these two sites as a harmonic oscillator potential averaged over the sites. The potential can be approximated as
    $     
    V(x) &approx 1/2 m omega^2 (x-x_n)^2 + 1/2 m omega^2 (x - x_(n+1))^2 \
    $
    Note that $x_(n+1)-x_n =a$.We changing variable to $xi = x - x_n$. Also note that the Wannier functions are represented in terms of the Harmonic oscillator eigenfunctions $phi_0(x)$. This gives us,
    $
      t &= - int_(-oo)^oo d xi phi_0 (xi - a) [ -(hbar^2)/(2 m) d^2/d xi^2 + 1/2 m omega^2 xi^2 + 1/2 m omega^2 (xi - a)^2 ] phi_0 (xi) \
    $
    After completing the algebra, the hopping term comes out to be,
    $
      t = - (hbar pi)/(2 a) sqrt(V_0/m) (3/2 + pi/4 sqrt((2 m V_0 a^2)/(hbar^2))) exp(- (pi^2)/(4) sqrt(V_0 m a^2/hbar^2))
    $

  ]
]
