#import "@preview/touying:0.6.1": *
#import "imports.typ":*
#import themes.university: *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.4" as fletcher: node, edge
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import cosmos.clouds: *
#show: show-theorion
#show:thmrules

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // align: horizon,
  //config-common(handout: true),
  config-common(frozen-counters: (theorem-counter,)), // freeze theorem counter for animation
  config-info(
    title: [Squeezed States of Light],
    subtitle: [PH3203 Term Paper],
    author: " Debayan Sarkar, 22MS002 \n Diptanuj Sarkar, 22MS038 \n Sabarno Saha 22MS037",
    date: datetime.today(),
    institution: [IISERK],
    logo: emoji.lightbulb,
  ),
)
#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()
= A Primer
== Correlation Functions

PAM Dirac first put forth the quantization of the EM field into decoupled harmonic oscillators. A full derivation can be found in  @Dirac1958. We use the same operators, just using different notation from his derivations.
We have already seen that we quantize our electric field as,
$ bold(E) (r,t) = bold(E)^+(r,t) + bold(E)^-(r,t) $
where $bold(E)^+(r,t)$ is the positive frequency part and $bold(E)^-(r,t)$ is the negative frequency part.

#pagebreak()

We will define some semblance of what coherence is in Quantum Optics @Glauber1963. To do this we define the first order correlation function as 
$ G^((1))(r_1,t_1;r_2,t_2) = expval(bold(E)^-(r_1,t_1) bold(E)^+(r_2,t_2)) $
In general we can define the nth order correlation functions. In order to write notation 
compactly, let us write $(bold(r_j), t_j) = x_j$. So our nth order correlation function
 is given to be
$ G^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)) = expval(bold(E)^-(x_1) ... bold(E)^-(x_(n)) bold(E)^+(x_(n+1))...bold(E)^+(x_(2n))) $

We use a certain normalization convention for the 1st order correlation function. We define the normalized correlation function as
$ g^((1))(x_1,x_2) = (G^((1))(x_1,x_2))/sqrt(G^((1))(x_1,x_1) G^((1))(x_2,x_2)) $
Generalizing this, we can define the normalized nth order normalized correlation function as
The nth order normalized correlation function is defined as
$ g^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)) = (G^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)))/ (product_(i=1)^(2n) G^((1))(x_i,x_i) ) $
where $G^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)) = expval(bold(E)^-(x_1) ... bold(E)^-(x_(n)) bold(E)^+(x_(n+1))...bold(E)^+(x_(2n))) $

The main point of this article to talk about squeezed states of light. To talk about these states, we need to talk about the second order normalized correlation function. The second order normalized correlation function is defined as
$ g^((2))(x_1,x_2,x_3,x_4) = (G^((2))(x_1,x_2,x_3,x_4))/ sqrt(G^((1))(x_1,x_1) G^((1))(x_2,x_2) G^((1))(x_3,x_3) G^((1))(x_4,x_4)) $

== First and Second order correlation functions
The first order normalized correlation function is given by
$ g^((1))(x_1,x_2) = (G^((1))(x_1,x_2))/sqrt(G^((1))(x_1,x_1) G^((1))(x_2,x_2)) $
Note that this is similar to the classical definition of coherence. The numerator is sort of the interference term, from which we can see when do the waves at $x_1,x_2$ interfere.

== Nth Order Coherence

Here the conditions for coherence is defined as
$ |g^((1))(x_1,x_2)| = 1 $ for all $x_1,x_2$.

Generalizing, the conditions for nth order coherence is defined as
$ |g^((j))| = 1 $ for all $j<=n$

= Coherent States

== Coherence in Coherent States

The second order correlation function, with parameters $x_1,x_2$ is given by
$ g^(2)(x_1,x_2) &= (G^((2))(x_1,x_2,x_1,x_2))/ (G^((1))(x_1,x_1) G^((1))(x_2,x_2)) \
            & = expval(bold(E)^-(x_1) bold(E)^-(x_2) bold(E)^+(x_1) bold(E)^+(x_2)) / (G^((1))(x_1,x_1) G^((1))(x_2,x_2)) \
$

We note that $bold(E)^+$ is an anhilation operator which reduces photon number and 
$bold(E)^-$ is a creation operator which increases photon number. So we
can write $N_E = bold(E)^-bold(E)^+$ is a number operator which counts the number of photons.
If the electric fields are classical , the number $N_E$ is a representation of the intensity 
of the light. So we can write the second order correlation function as
$ g^(2)(x_1,x_2) = expval(:N_E(x_1) N_E(x_2):) / (expval(N_(E(x_1))) expval(N_(E(x_2)))) $
where, $:X:$ represents the normal ordering of the operator $X$. The normal 
ordering of an operator is defined as the ordering of the operators such that all the
creation operators are to the left of the annihilation operators.

For example, for an operator $M = a^dagger a b^dagger b$, the normally ordered operator is
$ :M: = a^dagger b^dagger a b $.

Here, we consider time $t_1 = t$ and $ t_2 = t + tau$, and consider that we have
stationary fields. So we can write the second order correlation function  for 
$t_1 = 0, t_2 = tau$ as
$ g^(2)(tau) = g^(2)(0,tau) = expval(:N_E(0) N_E(tau):) / (expval(N_(E(0))) expval(N_(E(tau)))) $

#pagebreak()

  For coherent states of the electric field, which are the eigenstates of the 
  $hat(a) = bold(E)^+$ operator.
  $ g^((2))(0) = 1 $

For short counting times, the time delay in the second order correlation function is 
$tau = 0$.

  For sufficiently short counting times, the variance of the photon number distribution $V(n)$ is related to $g^((2))(0)$ by the relation
  $ (V(n) - expval(n))/expval(n)^2  = g^((2))(0)-1 $

We know that photon statistics in the coherent state is poissonian. For poissonian
statistics, the variance is given by $V(n) = expval(n)$. So for poissonian statistics,
we have $g^((2))(0) = 1$. When $g^((2))(0)<1$, we have sub-poissonian statistics and when $g^((2))(0)>1$, we have super-poissonian statistics. Sub-poissonian statistics exhibit a phenomenon called photon antibunching. 
= Squeezed States
== Introduction
The time dependent electric field operator is some specififc polarization direction for one single mode is given by @Dirac1958:
$ E(t) = lambda (hat(a)e^(-i omega t) + hat(a)^dagger e^(i omega t)) $ where $lambda$ is a constant that contains information about the spatial wave functions. For more modes, we add up multiple different hilbert spaces of SHO, with different frequencies. We then write 
$ a = X_1 + i X_2 $ where we can see from the SHO equations, $X_1$ and $X_2$ are rescaled versions of the position and momentum operators, which obey the commutation relation $[X_1, X_2] = i/2$. We can then write the electric field operator as
$ E(t) = 2 lambda (X_1 cos(omega t) + X_2 sin(omega t)) $  where $X_1, X_2$ are the amplitudes of the two quadratures of the field. 

We use the generalized Heisenberg uncertainity principle to define the uncertainty in the two quadratures of the field. We can write the uncertainty in the two quadratures as
$ Delta X_1 Delta X_2 >= 1/4 $ where $Delta X_i = sqrt(expval(X_i^2) - expval(X_i)^2)$. 

We are interested in a states with minimum uncertainty. To do that we must have,
$Delta X_1 Delta X_2 = 1/4$. A class of these states are the states with $Delta X_1 = Delta X_2 = 1/2$ and $V(X_1) = V(X_2) = 1/4$, where $V(X)$ is the variance of the operator X. These are our coherent states, which are the eigenstates of the anhilation operator in the quantized electric field description. 

A larger class is by taking the variance in one quadrature to be lower than $1/4$ and the variance in the other quadrature to be more than that. These class of states are the called the squeezed states. We are interested in squeezed states which can be defined by the condition $V(X_i)<1/4$ where $i = 1$ or $2$.  

We can also use a constrant on the normally ordered Variance of on the quadrature phases. We can write the variance of the quadrature phase as
$V(X_i) = expval(X_i^2) - expval(X_i)^2$. Lets define what our normally ordered variance is. We can write the normally ordered variance as
$ V(X_i) = expval(:X_i^2:) - expval(:X_i:)^2 $ where $:A:$ is the normally ordered operator. For our case, we can say 
== Normally ordered Variance
    The normally ordered variance of the quadrature phase is given by
    $ :V(X_i): + 1/4 = V(X_i) $
    This implies that for squeezed states, $:V(X_i): < 0$ for $i=1$ or $2$.
== Glauber Sudarshan P function
The Glauber Sudarshan P representation of the density operator for a light field is given by
$ rho = integral d^2 alpha P(alpha) ket(alpha) bra(alpha) $ where $P(alpha)$ is the Glauber-Sudarshan P function, and
$d^2 alpha = d Re(alpha) d Im(alpha)$

If we find a function that is positive and non singular, we can write the density operator in the form of a classical statistical ensemble. The quantum mechanical average resemble classical averaging procedures when the P function is positive non singular function. Then for normal ordered operators the classical statistical averaging is same as the quantum mechanical averaging. 

== Variance of Squeezed States(P representation)

The Variance of the $X_1$ operator using the glauber sudarshan P representation of the squeezed state is given by
$ V(X_1) = 1/4 [1 + integral d^2 alpha P(alpha) {(alpha + alpha^*) - (expval(a) + expval(a^dagger))}^2] $

From this we can see that there is no positive P function for squeezed states. This shows that photon antibunching is an inherent quantum phenomenon.  

== Generation of Squeezed States

Squeezed States are defined as the state obtained by the action of the operator $Od Os$ on the vaccum
number state $ket(0)$
$
ket(alpha comma zeta) = Od Os ket(0)
$
Where the concerned operators are defined as,@Glauber1951 @GerryKnight2005
$
Od &= e^(-abs(alpha)^2 / 2) e^(alpha Oad) e^(-alpha^* Oa) \
Os &=  e^(1/2 (zeta^*Oa^2 - zeta Oad^2))
$
where, $zeta = r e^(i theta)$ with $r > 0$.
== Displacement and Squeeze Operators
$Od$ and $Os$ are the translation and the squeeze operator respectively. It can be shown that,
$
Odd Od = Osd Os = 1
$
i.e., both the operators are unitary. This will help us a lot in the following section, where we 
will be looking at the expectations and variances of a few relevant quantities.


== Mean Photon Number in a Squeezed State
We wish to compute $expval(On)$ for the squeezed state #squeezed

We know that 
$
hat(n) = Oad Oa
$

Now, to compute the expectation of $hat(n)$ in the Squeezed state we have to evaluate the following
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
              abs(zeta)^n Oa &&"if" n "is even",
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
== Variances in Squeezed States
Let us define $Y_1$ and $Y_2$ such that, $Y_1 + i Y_2 = (X_1 + i X_2)e^(-i theta / 2) := Ob$. 
Then, we have $Ob = Oa e^(-i theta / 2)$. And we also have,
$
Os = e^(1/2 (Ob^2 - Obd^2))
$
Observe that, $Obd Ob = Oad Oa = On$ and $[Obd, Ob] = [Oad, Oa] = 1$
Also, lets define $beta = alpha e^(- theta / 2)$

Let's compute $var(Y_1)$ and $var(Y_2)$ for the squeezed state $ket(alpha comma zeta)$, where $delta(A)$ represents the variance of $A$.
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

== Second Order Correlation Function for the Squeezed State
Now let us compute the second order correlation function for this state $ket(alpha comma zeta)$
We know that,
$
g^((2))(0) = expval(:On^2:) / expval(On)^2
$
Using the actions of the displacement and squeeze operators on the ladder operators, we can calculate $expval(:On^2:)$.
$
expval(:On^2:) &= expval(Oad Oad Oa Oa)\
               &= 3sinh^4(r) + (1 + 2abs(alpha)^2)sinh^2(r) - Re(alpha^2 e^(-i theta))sinh(2r)
$
#pagebreak()
Hence, the correlation function turns out to be
$
g^((2))(0) = frac(3sinh^4(r) + (1 + 2abs(alpha)^2)sinh^2(r) - Re(alpha^2 e^(-i theta))sinh(2r), (abs(alpha)^2 + sinh^2(r))^2)
$


We dont get a simple relation between squeezing and antibunching, however, we can evaluate at certain limits to see how this function behaves.

#pagebreak()

We can see that for $alpha << 1$, we have
$
g^((2))(0) = frac(3sinh^4(r) + sinh^2(r), sinh^4(r)) = 1 + cosh(2r)/(sinh^2(r))
$

Thus we can see that we will always observe photon bunching in the squeezed state, in the limit of $alpha << 1$.

#pagebreak()
If we evaluate in the limit of $alpha >> 1$, then we see bunching or anti bunching 
depending on the value of $r$.
== Production of Squeezed States

The production of squeezed states of light essentially requires the generation of a mixing of a particular mode of the field with its conjugate mode. This ican not be achieved by transformations offered by linear optical devices (mirror, beam splitter, phase shifter). Th only way to achieve this is through the use of nonlinear optical devices.

In general, what we desire is a canonical Bogoliubov transformation of the form:
$
hat(b) = mu hat(a) + nu hat(a)^dagger
$

Where controlling $mu$ and $nu$ allows us to control the extent of squeezing.

Phrased in other terms, what we require is a Hamiltonian that contains quadratic terms in the creation and annihilation operators of that mode. This is given in the general form:

$
H = i h/(2 pi) kappa ((hat(a)^(dagger))^2 - hat(a)^2)
$

This can be achieved through two main methods:

1. Degenerate Parametric Down-Conversion ($Chi^((2))$): Here, a strong classical photon pump is used to drive a $Chi^((2))$ crystal at ssome frequency $2 omega$. this results in the creation of two photons of almost perfectly correlated phases of $omega$, and the process gives us an interaction Hamiltonian of the form mentioned above. The extent of squeezing is controlled by the non-linear susceptibility of the crystal used.
2. Degenerate 4-wave mixing ($Chi^((3))$): Same as the previous method, but in this case we use two photon pumps to drive the crystal with two photons of some frequency $omega$. This generates two photons that are again nearly perfectly correlated in phase. This gives us a nearly identical interaction Hamiltonian and the same Bogoliubov transformation as before.

= Detection
== Basic idea of the detection

The measure and characterise the quadrature squeezing of the light field, we must be able to perform phase-sensitive measurements of the field operators:

$
hat(X_(theta)) = 1/2 (e^(-i theta) hat(a) + e^(i theta) hat(a^dagger))
$

Where $hat(a)$ is the signal mode's annihilation operator, and $theta$ is a tunable phase that decides the quadrature that is to be measured.

Two of the basic techniques that are used for the detection of the squeezed states that are discussed in the paper involve using a strong local oscillator (hereby referred to as LO) to procude a coherent state $|beta e^(i theta)>$ with $beta >> 1$, and using it to perform a homodyne or a heterodyne measurement of the signal. this process involves the mixing of the singal moed with the LO mode using a 50/50 beam splitter, the action of which is represented by the following transformation:

$
mat(hat(c);hat(d)) = 1/(sqrt(a)) mat(1,1;1,-1) mat(hat(a);hat(b))
$

This yields the modes:

$
hat(c) = 1/(sqrt(2)) (hat(a) + hat(b))
$

$
hat(d) = 1/(sqrt(2)) (hat(a) - hat(b))
$

Where $hat(a)$ is the signal mode, and $hat(b)$ is the LO mode. The output modes are then detected using photodiodes, which essentially carry out a photon counting operation, i.e. $hat(c)^(dagger) hat(c)$ and $hat(d)^(dagger) d$.

== Homodyne detection
In this mode, the LO mode is prepared in the same frequency as the signal mode $omega$, and the phase $theta$ is varied. The difference in the photocurrent produced by the two photodiodes is given by:
$
hat(N_(-)) = hat(c)^(dagger) hat(c) - hat(d)^(dagger) hat(d) = hat(a)^(dagger) hat(b) + hat(b)^(dagger) hat(a)
$
In the strong LO approximation limit, $<hat(b)> = beta e^(- theta)$, and one can replace the $hat(b)$ operators with their expectation values. This yields:
$
hat(N_(-)) approx 2 |beta| hat(X_(theta))
$

Now, the variance in the photocurrent is given by:
$
V a r (hat(N_(-))) = 4 |beta|^2 <(Delta hat(X_(theta)))^2>
$
If we observe a variance in the different photocurrent that is less than what is expected from a coherent state, i.e. $mod(beta)^2$, we can be sure that we are observing a squeezed state. The main benefit of this method is the direct access to all quadratures by modifying the phase of the LO mode, which we can alter from $theta=0$ to $theta = pi/2$ to access the two orthogonal quadratures. The disadvantage of this method is that the LO mode must be prepared in the same frequency as the signal mode, which is not always possible. This can be a problem in cases where the signal mode is at a different frequency, such as in the case of squeezed light generated by four-wave mixing or parametric down-conversion.

== Heterodyne detection
In this method, the LO mode is prepared in a slightly different frequency of $omega + delta omega$, and the phase $theta$ is varied. One of the output modes from the beamsplitter is given by:
$
hat(c)(t) = 1/(sqrt(2)) (hat(a) e^(- omega t) + beta e^(-i (omega + delta omega) t))
$
and the intensity of the photocurrent is given by:
$
hat(I)(t) = 1/2 [hat(a)^(dagger) hat(a) + |beta|^2 + beta^* hat(a) e^(-i delta omega t) + beta hat(a)^(dagger) e^(i delta omega t)]
$

Electronic filtering of the photocurrent is then done to remove the high frequency terms, and the resulting signal is given by:
$
hat(I_(b e a t))(t) = 1/2 [beta^* hat(a) e^(-i delta omega t) + beta hat(a)^(dagger) e^(i delta omega t)]
$

This contains information about both the quadrature amplitudes, as can be seen by substituting $beta = |beta| e^(i theta)$ to get;

$
hat(I_(b e a t))(t) = |beta| [hat(X_1) cos(delta omega t) + hat(X_2) sin(delta omega t)]
$

Demmodulation of this signal gives us the quadrature amplitudes, and thus the variances - and if we detect that any of them are less than the coherent state limit we can be sure that we have observed a squeezed state. The main advantage of this method is that the LO mode does not need to be prepared in the same frequency as the signal mode, which makes it more versatile. However, the disadvantage is that we do not have direct access to all quadratures, and we need to demodulate the signal to obtain the quadrature amplitudes.

= Applications

== Quantum-Noise–Limited Interferometry

High-precision interferometric measurements (e.g.\ gravitational-wave detectors, cavity-length stabilization) are fundamentally limited by quantum shot noise and radiation-pressure back-action.  Injecting squeezed vacuum into the interferometer's unused port reduces fluctuations in the pertinent quadrature, thereby lowering the noise floor.  Caves (1981) showed that a squeeze parameter $r$ yields a noise reduction factor of $e^(-r)$ in the shot-noise-dominated regime. Modern large-scale detectors (GEO600, Advanced LIGO) routinely employ >3 dB of injected squeezing to improve strain sensitivity below the standard quantum limit .

== Phase-Sensitive Amplification

Conventional, phase-insensitive amplifiers must add at least half a quantum of noise per quadrature.  In contrast, a *phase-sensitive parametric amplifier* based on a $chi^((2))$ or $chi^((3))$ nonlinearity can amplify one quadrature without excess added noise by locking to the squeezed quadrature. 

== Optical Communication Channels

Yuen and Shapiro @Yuen1978 first proposed encoding information in a squeezed-quadrature field to surpass the classical Shannon limit imposed by coherent-state (shot-noise) channels.  By modulating the squeezed quadrature and homodyning at the receiver, one can achieve a signal-to-noise ratio increased by a factor $e^(2r)$ over a coherent-state channel for the same mean photon number . 


== Optical Waveguide Taps and Quantum-Limited Routing

Shapiro @Shapiro1980 showed that tapping an optical waveguide with a squeezed-state probe can extract a portion of the signal with arbitrarily low back-action when the probe is squeezed in the appropriate quadrature.  This *optical waveguide tap* enables non-invasive monitoring of guided signals over multikilometer networks without intermediate optical amplifiers, offering a route to quantum-enhanced data buses and sensing arrays .

// == Continuous-Variable Quantum Information and Metrology

// Two-mode squeezed states serve as a primary resource for continuous-variable entanglement, which underpins protocols in quantum teleportation, key distribution, and cluster-state computing.  The degree of entanglement scales directly with the squeeze parameter $r$, enabling high-fidelity information processing.  In quantum metrology, injecting squeezed probes into sensing interferometers achieves phase-estimation sensitivity $Delta phi prop e^(-r)/sqrt(N)$, surpassing the standard quantum limit by a factor $e^(-r)$ for $N$ average photons.  Reviews by Braunstein & van Loock @Braunstein2005 and Weedbrook *et al.* @Weedbrook2012 provide comprehensive treatments of these protocols and experimental realizations .

== Bibliography
---
#set align(left)
#bibliography("refs.bib")

