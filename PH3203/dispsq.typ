#import "imports.typ":*

#definition("Displacement Operator")[

The displacement operator is defined as
#nonum( $D(alpha) = exp([alpha a^dagger - alpha^* a])$ ) where $alpha$ is a complex number.
]
We need to show that $D(alpha)$ is unitary. Note that $D^dagger (alpha) = D(-alpha) = exp([alpha^* a - alpha a^(dagger)])$. 
Note that $[alpha^* a - alpha a^(dagger), alpha^* a + alpha a^(dagger)] = 0$.Thus we get,
$ 
D^dagger (alpha) D(alpha) &= D^(-alpha) D(alpha) \
&= exp([alpha^* a - alpha a^(dagger)]) exp([alpha a^dagger - alpha^* a]) \
&= exp([alpha^* a - alpha a^(dagger) + alpha a^dagger - alpha^* a]) \
&= exp([0]) = II 
$
Thus we say that $D(alpha)$ is unitary. There is a simpler the argument. The exponent of the exponential is anti-hermitian, so the operator is unitary. Now we move onto the squeeze operator.

#definition("Squeeze Operator")[
The squeeze operator is defined as
#nonum( $S(zeta) = exp(1/2[zeta^* a^2 - zeta a^(dagger 2)])$ ) where $zeta = r e^(i theta)$ where $r>0$.
]

Note again that $S^dagger (zeta) = S(-zeta)$. Using the same steps again, we note that the squeeze operator is unitary.(This proof uses $[zeta^* a^2 - zeta a^(dagger 2), zeta a^(dagger 2) - zeta^* a^2]$)


