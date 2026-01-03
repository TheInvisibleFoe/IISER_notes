
#import "imports.typ":*

The Glauber Sudarshan P representation of the density operator for a light field is given by @carmichael2002
$ rho = integral d^2 alpha P(alpha) ket(alpha) bra(alpha) $ where $P(alpha)$ is the Glauber-Sudarshan P function, and
$d^2 alpha = d Re(alpha) d Im(alpha)$

If we find a function that is positive and non singular, we can write the density operator in the form of a classical statistical ensemble. The quantum mechanical average resemble classical averaging procedures when the P function is positive non singular function. Then for normal ordered operators the classical statistical averaging is same as the quantum mechanical averaging. 

Note that the function $P$ has the property that the density matrix $rho$ is diagonal in the coherent state basis${ket(alpha)}$.

This representation of the P function is quite nice since we can interpret $P$ as a quasi-probability distribution. Lets start by observing that the $P$ function is indeed normalized.
$
  integral P(alpha) d^2 alpha  &= integral d^2 alpha P(alpha) braket(alpha,alpha)\
    & = sum_n integral d^2 alpha P(alpha) braket(alpha,n)braket(n , alpha)\
    & = sum_n integral d^2 alpha P(alpha) braket(n,alpha)braket(alpha,n)\
    & = tr(integral d^2 alpha P(alpha) ket(alpha) bra(alpha))\
    & = tr(rho) = 1
  
$
Thus we see that the P function is normalized. The beauty of this representation lies in the fact than normal ordered averages can be calculated the same way we do in classical probability theory, using $P$ as the probability distribution.
Normal ordering refers to writing the creation operators to the left and the anhilation operators to the right. 

$
  expval(a^(dagger p ) a^q ) &= tr(rho a^(dagger p ) a^q )  \
  &= sum_n integral d^2 alpha P(alpha) braket(n,alpha)braket(alpha,a^(dagger p ) a^q n)\
  & = integral d^2 alpha P(alpha) braket(alpha,a^(dagger p ) a^q ,alpha)\
      & = integral d^2 alpha P(alpha) (alpha^*)^p alpha^q\
      & = (overline(alpha^(*p) alpha^q))_P
  
$
To interpret the $P$ function as a probability distribution we need $P$ to be positive and non singular. Thus we can intuitively say that we do not find a positive definite $P$ function , we can say that the state is not in a classically possible statistical ensemble.