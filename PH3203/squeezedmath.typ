#import "imports.typ":*
#let squeezed = $ket(alpha comma zeta)$
#let Oad = $hat(a)^dagger$
#let Oa = $hat(a)$
#let Obd = $hat(b)^dagger$
#let Ob = $hat(b)$
#let Os = $hat(S)(zeta)$
#let Osd = $hat(S)(zeta)^dagger$
#let Od = $hat(D)(alpha)$
#let Odd = $hat(D)(alpha)^dagger$
#let On = $hat(n)$
== Definition of Squeezed States
Squeezed States are defined as the state obtained by the action of the operator $Od Os$ on the vaccum
number state $ket(0)$
$
ket(alpha comma zeta) = Od Os ket(0)
$
Where the concerned operators are defined as,
$
Od &= e^(-abs(alpha)^2 / 2) e^(alpha Oad) e^(-alpha^* Oa) \
Os &=  e^(1/2 (zeta^*Oa^2 - zeta Oad^2))
$
where, $zeta = r e^(i theta)$ with $r > 0$, and $alpha = abs(alpha)e^(i phi)$.

$Od$ and $Os$ are the translation and the squeeze operator respectively. It can be shown that(we show that in Appendix B.),
$
Odd Od = Osd Os = 1
$
i.e., both the operators are unitary. This will help us a lot in the following section, where we 
will be looking at the expectations and variances of a few relevant quantities.
== Mean Photon Number in a Squeezed State
#claim("Mean Photon Number in a Squeezed State")[
Hence for a squeezed state, the mean photon number is given by
$
expval(On) = abs(alpha)^2 + sinh^2(r)
$
]
*Proof:* We wish to compute $expval(On)$ for the squeezed state #squeezed

We know that 
$
hat(n) = Oad Oa
$

Now, to compute the epectation of $hat(n)$ in the Squeezed state we have to evaluate the following
expression
$
expval(On) &= braket(0, Osd Odd Oad Oa Od Os, 0) \
          &= braket(0, Osd Odd Oad Od Odd Oa Od Os, 0) && [because Odd Od = 1]\
          &= braket(0, Osd Odd Oad Od Os Osd Odd Oa Od Os, 0) && [because Osd Os = 1]\
$

First, we evaluate the operator $Odd Oa Od$
$
Odd Oa Od &= e^(-abs(alpha)^2)e^(-alpha Oad)e^(-alpha^* Oa) Oa e^(alpha Oad) e^(-alpha^* Oa)\
          &= e^(-abs(alpha)^2)e^(-alpha Oad)e^(-alpha^* Oa) (e^(alpha Oad) Oa + [Oa , e^(alpha Oad)])e^(-alpha^* Oa)\
$

Now let us compute the comutator relation $[Oa, e^(alpha Oad)]$ which is given by,
$
[Oa, e^(alpha Oad)] = sum_(n = 1)^(infinity) frac(alpha^n [Oa, Oad^n], n!)
$

We can easily show by induction that,$[Oa, Oad^n] = n Oad^(n - 1)$. Then the commutator evaluates to,

$
[Oa, e^(alpha Oad)] &= sum_(n = 1)^(infinity) frac(n alpha^n Oad^(n-1), n!)\
                    &= alpha sum_(n = 0)^(infinity) frac((alpha Oad)^(n), n!)\
                    &= alpha e^(alpha Oad)
$

Substituting this commutator relation back into the expression for $Odd Oa Od$ we get,
$
Odd Oa Od &= e^(-abs(alpha)^2)e^(-alpha Oad)e^(-alpha^* Oa) (e^(alpha Oad) Oa + alpha e^(alpha Oad))e^(-alpha^* Oa)\
          &= e^(-abs(alpha)^2)e^(-alpha Oad)e^(-alpha^* Oa) e^(alpha Oad)e^(-alpha^* Oa) (alpha + Oa)\
          &= alpha + Oa
$

Taking the dagger of this equation on both sides we can also see that,
$
Odd Oad Od = alpha^* + Oad
$

Now substituting these expressions for $Odd Oa Od$ and $Odd Oad Od$ into our expression for
$expval(On)$ we get,
$
expval(On) &= braket(0,Osd (Oad + alpha^*) Os Osd (Oa + alpha) Os ,0)\
          &= braket(0,(Osd Oad Os + alpha^*) (Osd Oa Os + alpha) ,0) && [because Osd Os = 1]\
$
So, now we compute $Osd Oa Os$. Let us define $A = frac(1, 2)(zeta Oad^2 - zeta^* Oa^2)$. Then,
$
Osd Oa Os &= e^A Oa e^(-A) \
          &= sum_(n = 0)^(infinity) frac([A, Oa]_n, n!)\
$
where $[A, B]_1 = [A, B]$, $[A, B]_2 = [A, [A, B]]$ and so on. Lets compute $[A, Oa]$

$
[A, Oa] &= -frac(zeta, 2) [Oa, Oad^2] \
        &= -frac(zeta, 2)  2Oad \
        &= -zeta Oad
$
Similarly,
$
[A, Oa]_2 &=[A, [A, Oa]]\
          &= -zeta [A, Oad] \
          &= zeta frac(zeta^* , 2)[Oa^2, Oad]\
          &= abs(zeta)^2 Oa
$
We can see after this, that the results will be of a similar form when $k$ has the same parity. 
It can be shown using induction that,
$
[A, Oa]_n = cases(
              -zeta abs(zeta)^(n - 1) Oad &&"if" n "is odd",
              abs(zeta)^n Oad &&"if" n "is even",
            )
$
Then we can evaluate $Osd Oa Os$ to be,

$
Osd Oa Os &= sum_(n = 0)^infinity frac(1, n!)[A, Oa]_n \
          &= Oa sum_(k = 0)^infinity frac(abs(zeta)^(2k), (2k)!) - Oad sum_(k = 0)^infinity frac(zeta abs(zeta)^(2k), (2k + 1)!)\
          &= Oa cosh(abs(zeta)) - Oad zeta / abs(zeta) sum_(k = 0)^infinity frac(abs(zeta)^(2k + 1), (2k + 1)!)\
          &= Oa cosh(abs(zeta)) - Oad zeta / abs(zeta) sum_(k = 0)^infinity frac(abs(zeta)^(2k + 1), (2k + 1)!)\
          &= Oa cosh(abs(zeta)) - Oad zeta / abs(zeta) sinh(abs(zeta))\
          &= Oa cosh(r) - Oad e^(i theta) sinh(r)

$
Taking the dagger of this relation gives us 
$
Osd Oad Os = Oad cosh(r) - Oa e^(-i theta)sinh(r)
$

Substituting these expressions into the expression for $expval(On)$ we get,
$
expval(On) &= braket(0, (Oad cosh(r) - Oa e^(-i theta)sinh(r) + alpha^*)(Oa cosh(r) - Oad e^(i theta)sinh(r) + alpha),0)\
          &= braket(0,abs(alpha)^2 + Oa Oad sinh^2(r) ,0)\
          &= abs(alpha)^2 + sinh^2(r)
$
Hence for a squeezed state, the mean photon number is given by
$
expval(On) = abs(alpha)^2 + sinh^2(r)
$

#h(1fr) #qe
== Variances in Squeezed States
Let us define $Y_1$ and $Y_2$ such that, $Y_1 + i Y_2 = (X_1 + X_2)e^(-i theta / 2) := Ob$. 
Then, we have $Ob = Oa e^(-i theta / 2)$. And we also have,
$
Os = e^(1/2 (Ob^2 - Obd^2))
$
Observe that, $Obd Ob = Oad Oa = On$ and $[Obd, Ob] = [Oad, Oa] = 1$
Also, lets define $beta = alpha e^(- theta / 2)$

#claim("Variance of the quadrature phase")[
        The variance of the quadrature phase is given by
        $ V a r(Y_1) =  var(Y_1) = 1/4 e^(-2r) $
        $ V a r(Y_2) = var(Y_2) = 1/4 e^(2r) $
]

*Proof*: Let's compute $var(Y_1)$ and $var(Y_2)$ for the squeezed state $ket(alpha comma zeta)$
$
var(Y_1) &= expval(Y_1^2) - expval(Y_1)^2\
         &= 1/4 expval((Ob + Obd)^2) - expval(Ob + Obd)^2\
         &= 1/4 [expval((Ob^2 + Obd^2 + 2Obd Ob + 1)^2) - (expval(Ob) + expval(Obd))^2]\
         &= 1/4 [expval(Ob^2) + expval(Obd^2) + 2expval(On) + 1 - (expval(Ob) + expval(Obd))^2]
$
First, we'll compute $expval(Ob)$
$
expval(Ob) &= braket(0, Osd Odd Ob Od Os,0)\
           &= braket(0, Osd (Oa + alpha) ,0)e^(-i theta / 2) \
           &= braket(0, (Osd Oa Os + alpha) ,0)e^(- theta /2) \
           &= braket(0, Oa cosh(r) - e^(i theta)sinh(r) + alpha, 0) e^(-theta / 2) \
           &= alpha e^(-  i theta / 2)
$
Similarly,
$
expval(Obd) = alpha^*e^(i theta / 2)
$
Now, we compute $expval(Ob^2)$
$
expval(Ob^2) &= braket(0, Osd Odd Ob^2 Od Os ,0)\
             &= braket(0, Osd Odd Ob Od Os Osd Odd Ob Od Os ,0)\
             &= braket(0, Osd (Oa + alpha) Os Osd (Oa + alpha) Os ,0)e^(-i theta)\
             &= braket(0, (Osd Oa Os + alpha)^2 ,0)e^(-i theta)\
             &= braket(0, (Oa cosh(r) - e^(i theta) Oad sinh(r) + alpha)^2 ,0)e^(-i theta)\
             &= braket(0, -Oa Oad e^(i theta) cosh(r)sinh(r) + alpha^2,0)e^(-i theta) \
             &= alpha^2 e^(-i theta) - sinh(r)cosh(r)
$
Similarly, 
$
expval(Obd^2) &= (alpha^*)^2e^(i theta) - sinh(r)cosh(r)
$

Substituting these expressions in the expression for $var(Y_1)$ we get,
$
var(Y_1) &= 1/4 (alpha^2e^(-i theta) + (alpha^*)^2e^(i theta) -2sinh(r)cosh(r) + 2abs(alpha)^2 + 2sinh^2(r) + 1 - (alpha e^(- i theta / 2) + alpha e^(i theta / 2))^2)\
         &= 1/4 ((alpha e^(- i theta / 2) + alpha e^(i theta / 2))^2 + 1 + 2sinh^2(r) - 2cosh(r)sinh(r) - (alpha e^(- i theta / 2) + alpha e^(i theta / 2))^2)\
         &= 1/4 (1 + 2sinh^2(r) - 2cosh(r)sinh(r))\
         &= 1/4 (cosh(2r) - sin(2r))\
         &= 1/4 e^(-2r)
$

With a very similar computation we can show that,
$
var(Y_2) = 1/4 e^(2r)
$

From these fluctuations we can clearly see that the amplitude is decaying exponentially in one of
the quadratures while, increasing in the other one at the same rate, with $r$. Also, the fluctuations 
are independent of $alpha$.
#h(1fr) #qe
== Second Order Correlation Function for the Squeezed State
#claim("Second Order Correlation Function for the Squeezed State")[

The second order correlation function for the squeezed state is given by
$
g^((2))(0) = frac(abs(alpha)^4 + 3sinh^4(r) + (1 + 2abs(alpha)^2)sinh^2(r) - Re(alpha^2 e^(-i theta))sinh(2r), (abs(alpha)^2 + sinh^2(r))^2)
$
where $g^((2))(0) = expval(:On^2:) / expval(On)^2$ and $alpha$ is the parameter of displacement operator and $zeta = r e^(i theta)$, where $r>0$ is the amplitude of squeezing.
]
Now let us compute the second order correlation function for this state $ket(alpha comma zeta)$
We know that,
$
g^((2))(0) = expval(:On^2:) / expval(On)^2
$
So, we must compute $expval(:On^2:)$
$
expval(:On^2:) &= expval(Oad Oad Oa Oa)\
               &= braket(0, Osd Odd Oad Oad Oa Oa Od Os ,0) \
               &= braket(0, Osd Odd Oad Od Os Osd Odd Oad Od Osd Os Odd Oa Od Os Osd Odd Oa Od Os, 0)\
               &= braket(0, Osd (alpha* + Oad) Os Osd (alpha* + Oad) Os Osd (alpha + Oa) Os Osd (alpha + Oa) Os) \
               &= braket(0, (Oad cosh(r) - e^(-i theta) Oa sinh(r) + alpha^*)^2(Oa cosh(r) - e^(i theta)Oad sinh(r) + alpha)^2 ,0) \
               &= braket(0, Oa Oad Oa Oad sinh^2(r)cosh^2(r) + Oa Oa Oad Oad sinh^4(r) \
               &+ Oa Oad (2abs(alpha)^2sinh^2(r) - (alpha^2e^(-i theta) + (alpha^*)^2e^(i theta))sinh(r)cosh(r)) + abs(alpha)^4,0)\
               &= 2sinh^4(r) + sinh^2(r)cosh^2(r) + 2abs(alpha)^2sinh^2(r) - (alpha^2e^(- i theta)+ (alpha^*)^2e^(i theta))sinh(r)cosh(r)\
               &= 3sinh^4(r) + (1 + 2abs(alpha)^2)sinh^2(r) - Re(alpha^2 e^(-i theta))sinh(2r) + abs(alpha)^4
$

Hence, the correlation function turns out to be
$
g^((2))(0) = frac(abs(alpha)^4 + 3sinh^4(r) + (1 + 2abs(alpha)^2)sinh^2(r) - Re(alpha^2 e^(-i theta))sinh(2r), (abs(alpha)^2 + sinh^2(r))^2)
$
#h(1fr)#qe

Now, we will discuss two limiting conditions for this expression.

First we will look at the limit when $abs(alpha) << 1$, i.e., we are considering the squeezed state
$ket(0 comma zeta)$. Then we get the following form of the correlation function.

$
g^((2))(0) &= frac(3sinh^4(r) + sinh^2(r), sinh^4(r))\
           &= 3 + frac(1, sinh^2(r)) \
           &= 3 + frac(1, expval(n))\
           & = 1 + cosh(2r)/(sinh^2(r))
$
As we can see in the small $alpha$ limit, no matter what value of $zeta$ we choose, we always have
$g^((2))(0) > 1$ So, in this case we will always have photon bunching.

Now let's look at the second limiting case, when $abs(alpha)^2 >> sinh^2(r)$

$
g^((2))(0) &= frac(abs(alpha^4) + 3sinh^4(r) + 2abs(alpha)^2sinh^2(r) - Re(alpha^2e^(-i theta))sinh(2r), abs(alpha)^4)\
           &= 1 + 3(frac(sinh^2(r), abs(alpha)^2))^2 + 2frac(sinh^2(r), abs(alpha)^2) - cos(2phi - theta)frac(sinh(2r), abs(alpha)^2)\
           &approx 1-cos(2phi - theta)sinh(2r)/abs(alpha)^2
$

From this expression we can see that in this limit, if $r > 0$, we eventually get $g^((2))(0) < 1$ i.e. photon anti-bunching and sub poisonnian photon statistics,
and for $r < 0$ we also get $g^((2))(0) > 1$ i.e. photon bunching and super poissonian photon statistics. 
