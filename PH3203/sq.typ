#import "imports.typ":*
== Introduction to Squeezed States

Before we move onto the core topic of our term paper report, we must give an introduction to what we squeezed states are. The time dependent electric field operator is some specififc polarization direction for one single mode is given by @Dirac1958:
$ E(t) = lambda (hat(a)e^(-i omega t) + hat(a)^dagger e^(i omega t)) $ where $lambda$ is a constant that contains information about the spatial wave functions. The operators $a, a^dagger$ obey boson commutation relations ($[a, a^dagger] = 1$). For more modes, we add up multiple different hilbert spaces of SHO, with different frequencies. We then write 
$ a = X_1 + i X_2 $ where we can see from the SHO equations, $X_1$ and $X_2$ are rescaled versions of the position and momentum operators, which obey the commutation relation $[X_1, X_2] = i/2$. We can then write the electric field operator as
$ E(t) = lambda/2 (X_1 cos(omega t) + X_2 sin(omega t)) $  where $X_1, X_2$ are the amplitudes of the two quadratures of the field. 

We use the generalized Heisenberg uncertainity principle to define the uncertainty in the two quadratures of the field. We can write the uncertainty in the two quadratures as
$ Delta X_1 Delta X_2 >= 1/4 $ where $Delta X_i = sqrt(expval(X_i^2) - expval(X_i)^2)$. 

We are interested in a states with minimum uncertainty. To do that we must have,
$Delta X_1 Delta X_2 = 1/4$. A class of these states are the states with $Delta X_1 = Delta X_2 = 1/2$ and $V(X_1) = V(X_2) = 1/4$, where $V(X)$ is the variance of the operator X. These are our coherent states, which are the eigenstates of the anhilation operator in the quantized electric field description. 

A larger class is by taking the variance in one quadrature to be lower than $1/4$ and the variance in the other quadrature to be more than that. These class of states are the called the squeezed states. We are interested in squeezed states which can be defined by the condition $V(X_i)<1/4$ where $i = 1$ or $2$. We are dealing with a single mode of the field. For multiple modes, it is quite convinient to use a constrant on the normally ordered Variance of on the quadrature phases. We can write the variance of the quadrature phase as
$V(X_i) = expval(X_i^2) - expval(X_i)^2$. Lets define what our normally order variance is. We can write the normally ordered variance as
$ V(X_i) = expval(:X_i^2:) - expval(:X_i:)^2 $ where $:A:$ is the normally ordered operator. For our case, we can say 
#claim("Normally ordered variance of the quadrature phase")[
    The normally ordered variance of the quadrature phase is given by
    $ :V(X_i): + 1/4 = V(X_i) $
    This implies that for squeezed states, $:V(X_i): < 0$ for $i=1$ or $2$.
]
*Proof*: 
We can write the normally ordered variance as
$ :V(X_i): &= expval(:X_i^2:) - expval(:X_i:)^2 \
&= 1/4[expval(:a^2 + (a^dagger)^2 + a a^dagger + a^dagger a):) - expval(:a + a^dagger:)^2] \
&= 1/4[expval(a^2 + (a^dagger)^2 + 2 a^dagger a) - expval(:a + a^dagger:)^2]
 \
&= 1/4[expval(a^2 + (a^dagger)^2 + 2 a^dagger a + 1) - expval(a + a^dagger)^2 - 1] \
&= V(X_i) - 1/4 
$
Thus we have $:V(X_i): + 1/4 = V(X_i)$, which implies that for squeezed states, $:V(X_i): < 0$ for $i=1$ or $2$.

#h(1fr) #qe 


We now see how these states are generated and what some of their mathematical properties are,

A light field with sub-poissonian statistics will exhibit an effect known as photon antibunching. The Glauber 
Sudarshan P representation of the density operator for a light field is given by
$ rho = integral d^2 alpha P(alpha) ket(alpha) bra(alpha) $ where $P(alpha)$ is the Glauber-Sudarshan P function, and
$d^2 alpha = d Re(alpha) d Im(alpha)$. More about this is given in Appendix A.

The quantum mechanical average resemble classical averaging procedures when the P function is positive non singular function. We show that photon antibunching is a quantum effect by showing there is no positive non singular P function. Note that we generate squeezed states by reducing the variance in one quadrature, which we choose here to be $X_1$.

#claim("Variance of Squeezed States(P representation)")[

    The Variance of the $X_1$ operator. the glauber sudarshan P representation of the squeezed state is given by
    $ V(X_1) = 1/4 [1 + integral d^2 alpha P(alpha) {(alpha + alpha^*) - (expval(a) + expval(a^dagger))}^2] $
]
Proof:
We can write the variance of the $X_1$ operator as $V(X_1) = expval(X_1^2) - expval(X_1)^2$ where $expval(A) = Tr(rho A)$.
We can write the density operator in the Glauber-Sudarshan P representation as
$ rho = integral d^2 alpha P(alpha) ket(alpha) bra(alpha) $
Recall the completeness relation $sum_n ketbra(n,n) = II$. We can write the expectation value of the $X_1$ operator as
$ expval(X_1) = Tr(rho X_1) &= sum_n integral d^2 alpha P(alpha) braket(n,alpha)braket(alpha,X_1,n)\ 
&= sum_n integral d^2 alpha P(alpha) braket(alpha,X_1,n) braket(n,alpha)
 = integral d^2 alpha P(alpha) braket(alpha,X_1,alpha) \
 & = 1/2 integral d^2 alpha P(alpha) (alpha + alpha^*) \
& = 1/2 [expval(a) + expval(a^dagger)]
$
where the last equality is obtained by taking $expval(a) = Tr(rho a) = integral d^2 alpha P(alpha) braket(alpha,a, alpha) = integral d^alpha P(alpha) alpha$.
We now find the expectation value of the $X_1^2$ operator. We can write the expectation value of the $X_1^2$ operator as
$ expval(X_1^2) = Tr(rho X_1^2) &= sum_n integral d^2 alpha P(alpha) braket(n,alpha)braket(alpha,X_1^2,n) \
&= sum_n integral d^2 alpha P(alpha) braket(n,X_1^2,alpha) braket(alpha,n) \
&= integral d^2 alpha P(alpha) braket(alpha,X_1^2,alpha) \
&= 1/4 integral d^2 alpha P(alpha) braket(alpha,a^2 + a a^dagger + a^dagger a + (a^dagger)^2 ,alpha) \
& = 1/4 integral d^2 alpha P(alpha) [alpha^2 + (alpha^*)^2 + 2 alpha alpha^* + 1] \
$
We note that the P-function is a quasiprobability distribution, which doesnt satisfy all the Kolmogorov axioms, but still satifies $integral P(alpha) d^2 alpha = 1$. 
Then the variance is given by 
$ V(X_1) = expval(X_1^2) - expval(X_1)^2 &= 1/4 [1 + integral d^2 alpha P(alpha) (alpha^2 + (alpha^*)^2 + 2 |alpha|^2 ) - (expval(a) + expval(a^dagger))^2] \
&= 1/4 [1 + integral d^2 alpha P(alpha) (alpha + alpha^*)^2] + (expval(a) + expval(a^dagger))^2 - 2(expval(a) + expval(a^dagger))(expval(a) + expval(a^dagger))\

&= 1/4 [1 + integral d^2 alpha P(alpha) [(alpha + alpha^*)^2 + (expval(a) + 
expval(a^dagger))^2 - 2( alpha + alpha^*)(expval(a) + expval(a^dagger)])\
&= 1/4 [1 + integral d^2 alpha P(alpha) {(alpha + alpha^*) - (expval(a) + expval(a^dagger))}^2] 
$
#h(1fr) #qe

We know that a squeezed has $V(X_1)<1/4$ in one quadrature, and $V(X_2)>1/4$ in the other quadrature. We can see that the squeezed state has a negative P function, which is a signature of nonclassicality.

 

#include "squeezedmath.typ"
