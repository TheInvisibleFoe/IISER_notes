
#import "imports.typ": *

#let sn = "sn"
#let cn = "cn"
#let dn = "dn"
#let pm = $plus.minus$
#let mp = $minus.plus$
#let phia = $phi.alt$
#let am = "Am"

= Elliptic Functions

A large list of identities for the elliptic functions can be found in Chapter 15 @baxter1982. The relevant ones for the calculation of the 2D ising model shall be outlined here.

#definition("Doubly Periodic")[
  A function $f(u)$ is said to be doubly periodic if it satisfies the following relations,
  $
    f(u + 2 I) &= pm f(u) \
    f(u + 2 i I') &= pm f(u)
  $
  where $I$ and $I'$ are the half periods functions. Any upright rectangle of height $2i I'$ and width $2I$ in the complex plane is called the period rectangle.
]
The elliptic functions are functions of two variables the _Nome_ $q$ and the _argument_ $u$. In our case the Nome $q$ is real and restricted to $0<q<1$. The Half periods of the Jacobian elliptic functions are given by,
$
  I &= pi/2  product_(n=1)^oo [(1+ q^(2n-1))/(1-q^(2n-1)) dot (1-q^(2n))/(1+q^(2n))]^2 \
  I' &= pi^(-1) I ln(q^(-1))
$
and thus $q$ is given by,
$
  q = exp(- pi I' \/ I) 
$

The modulus $k$ and the conjugate modulus $k'$ are then defined as,
$
  k & = 4 q^(1/2) product_(n=1)^oo [(1+ q^(2n))/(1+q^(2n-1))]^4 \ 
  k' &= product_(n=1)^oo [(1- q^(2n-1))/(1+q^(2n-1))]^4 \
$
In the 2D Ising model we will identify the modulus with @commcondk. The  theta functions are defined in EQ.15.1.5 of Chapter 15 in @baxter1982. Using those the Jacobian elliptic functions are then defined as,
$
  sn(u) &= k^(-1/2) H(u)/Theta(u)\
  cn(u) &= (k'/k)^(1/2) H_1(u)/Theta(u)\
  dn(u) &= k'^(1/2) (Theta_1 (u))/Theta(u)  
$<elliptheta>
where $k'$ is the conjugate modulus and $k$ is the modulus. These are doubly periodic or anti-periodic, as we shall see a few identities below. 

The zeros of the theta functions are given by,
$
  H(u) &= 0 quad "when" quad u = 2 m I + 2 n i I' \
  Theta(u) &= 0 quad "when" quad u = 2 m I + (2n+1) i I' \
$
where $m,n$ are any integers. Thus, the Jacobian elliptic functions are meropmorphic whose only singularities are poles which are zeros of the theta functions.

The theta function $H(u)$ satisfies the quasi-periodic relations,
$
  H(u + 2 I) &= -H(u) \
  H(u + 2 i I') &= - q^(-1) e^(- pi i u \/ 2 I') H(u) \
$
The other theta functions are related to $H(u)$ by the following relations,
$
  H_1(u) &= H(u + I') \
  Theta_1(u) &=  Theta(u + I) \
  Theta(u) &= -i q^(1/4) e^(pi i u \/ 2 I') H(u + i I') \
  Theta_1(u) &= q^(1/4) e^(pi i u \/ 2 I') H(u +I+ i I') \
$<thetaperiod>
Using this, sn, cn and dn satisfy the following relations,
$
  & sn(-u) = -sn(u) , quad cn(-u) = cn(u) , quad dn(-u) = dn(u) \
  & sn(u + 2 I) = -sn(u)  \ 
  & cn(u + 2 I) = -cn(u) \
  & dn(u + 2 I) = dn(u) \
  & sn(u + 2 i I') = sn(u) \
  & cn(u + 2 i I') = - cn(u) \
  & dn(u + 2 i I') = - dn(u) \
$<ellipdoubperiod>
and they satisfy the half period relations,
$
  & sn(u + i I') = (k sn(u))^(-1) \
  & cn(u + i I') = - i dn(u) \/ k sn(u) \
  & dn(u + i I') = -i cn(u) \/ sn(u)
$<elliphalfperiod>

Before we move on, we can see a visualization of the Jacobian elliptic functions in the complex plane. The Jacobian elliptic functions are periodic in the complex plane, and they can be visualized as a lattice in the complex plane. The period rectangle is defined by the half periods $2I$ and $2i I'$, and the functions repeat their values in this rectangle. 

#figure(
  image("assets/snelliptic.png", width:50%),
  caption : [The Elliptic Sine Function with modulus $k = 0.8$. The half periods $I$ and $I'$ are given by $1.995$ and $1.75$. (Source: Wikipedia, Attribution: By Nschloe - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=111308860)]
)

#figure(
  image("assets/cnelliptic.png", width:50%),
  caption : [The Elliptic Cosine Function with modulus $k = 0.8$. The half periods $I$ and $I'$ are given by $1.995$ and $1.75$. (Source: Wikipedia, Attribution: By Nschloe - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=111308860)]
)
#figure(
  image("assets/dnelliptic.png", width:50%),
  caption : [The Elliptic Function "dn" with modulus $k = 0.8$. The half periods $I$ and $I'$ are given by $1.995$ and $1.75$. (Source: Wikipedia, Attribution: By Nschloe - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=111308860)]
)
// K = 1.995
// K' = 1.75


Two important algebraic identities of Jacobian elliptic functions are,
$
  sn^2(u) + cn^2(u) &= 1 \
  dn^2(u) + k^2 sn^2(u) &= 1
$<elliptrig>
The derivations of these identities can be found in Chapter 15 of @baxter1982.
The elliptic sine function $sn$ satisfies the following addition theorem,
$
  sn( u -v) = (sn(u) cn(v) dn(v) - sn(v) cn(u) dn(u) )/
  (1 - k^2 sn^2(u) sn^2(v))
$<additiontheorem>

== The modified Amplitude Function 

The modified amplitude function is defined as,
$
  am(u) = -i ln(i k^(1/2) sn(u - i/2 I'))
$<ampfunc>
For real $u$, this function is real, odd and monotonic increasing. Later on we see that $am(u)$ goes from $-pi/2$ to $pi/2$ as $u$ goes from $-I$ to $I$. This property is useful in showing that different choices of the argument $u$ leads to different roots. 

== General Theorems

#theorem("Liouville's Theorem")[
  If a function is entire and bounded, then it is constant. A corollary of this theorem is that if a function is doubly periodic or anti-periodic and is analytic inside a period rectangle, then it is constant inside the rectangle.
]<liou1>
#theorem("Poles and Zeros")[
  If a function $f(u)$ is doubly periodic or anti-periodic and meromorphic, and has $n$ poles per period rectangle, then it also has $n$ zeros per period rectangle.(Multiple poles or zeros of order $r$ are counted as $r$ poles or zeros.)
]<liou2>
#theorem("General Fundamental theorem of Algebra")[

  If a function $f(u)$ is meromorphic and satisfies the (anti-) periodic relations, 
  $
    f(u + 2I) &= (-1)^s f(u) \
    f(u + 2 i I') &= (-1)^r f(u) \
  $
  where $r,s$ are integers, and if $f(u)$ has just $n$ poles per period rectangle, at $u_1,..., u_n$(counting a pole of order $r$ as $r$ coincident simple poles), then
  $
    f(u) = C e^(i lambda u) product_(j=1)^n H(u - v_j)/H(u - u_j)
  $
  where $C, lambda, v_j$ satisfy the constraint relations,
  $
    sum_(j=1)^n v_j &= sum_(j=1)^n u_j + (r + 2m) I - i(s+2n)I' \
    lambda &= 1/2 pi (s+2 n)/I
  $
  where $m,n$ are integers.
]<liou3>

//Spellcheck Done

