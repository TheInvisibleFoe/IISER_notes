#import "imports.typ":*


= Statistic

#definition("Statistic")[
  Let the data be $dt in RR^n$. A statistic $T = T(X)$ is a measureable function of data and data only.
]

== Ancillary Statistic

#definition("Ancillary Statistic")[
  Suppose the distribution of the test statistic $T(X)$, $frak(T)$ is independent of the parameter vector $theta$. Then $T(X)$ is called an Ancillary Statistic.
]
#theorem[

  Let $f(x)$ be a pdf. Let $mu$ and $sigma>0$ be any constants. Then
  $
    g(x|mu,sigma) = 1/sigma f((x-mu)/sigma)
  $
  is a valid pdf.

]
The proof is in Casella and burger theorem 3.5.1. One just needs to show non-negativity and normalization.

== Location and Scale families of distributions
#definition("Location Family of distributions")[

  Let a family of distributions be,
  $
    frak(F) = {f_theta: theta in Theta "where" f_theta (x) = g(x-theta) "for some known function" g
      "on" RR^n}
  $
Then $frak(F)$ is a location family of distrbutions with the standard pdf $f(x)$ and the location parameter $theta$ for the family.
]
Generally we will talk about these families on $RR$ rather than $RR^n$.

#definition("Scale family of distributions")[

  Let a family of distributions be,
  $
    frak(F) = {f_theta: theta in Theta "where" f_theta (x) = 1/theta g(x/theta) "for some known function" g
      "on" RR^n}
  $
Then $frak(F)$ is a scale family of distrbutions with the standard pdf $f(x)$ and the scale parameter $theta$ for the family.

]

#definition("Location-Scale family of distribution")[

  Let a family of distributions be,
  $
    frak(F) = {f_(mu,sigma):(mu, sigma) in RR times RR^+ "where" &f_(mu,sigma) (x) = 1/sigma g((x-mu)/sigma) \ & "for some known function" g
      "on" RR^n}
  $
Then $frak(F)$ is a location family of distrbutions with the standard pdf $f(x)$ and the location parameter $mu$ and scale parameter $sigma$ for the family.
]

Now comes to the choice of test statistics. Note that ancillary statistics are not useful in inferring parameters from data. So we shall not use them. The test statistic just compresses the data, from $dt$ to $T(dt)$. We want to see when this data compression is lossless.

We can define the level sets of the test statistic $T(X)$. Let $D$ be the set on which the data can lie in. Let us define the relation,
$
  x scripts(~)_T y "if and only if" T(x) = T(y)
$
We can easily see that this is an equivalence relation. Then $D$ can be partitioned into sets $D_t$ s.t.,
$
  D_t = {X in D: T(X) = t}
$
These sets $D_t$ are called level sets of the test Statistic $T$. If we are in some level set of the test statistic, the inferred parameters should not change if we stay in the same level set.


== Sufficient Statistic
#definition("Sufficient Statistic")[

  The test statistic $T = T(dt)$ is said to be sufficient iff the distribution of $(dt|T=t)$ is free of $theta$ for all values of $t$.
]

#theorem("Fisher Neyman Factorization theorem")[

  Suppose $dt$ is an iid sample from $f_theta (dot.c)$, which might be either a pmf or a pdf. A statistic $T=T(X)$ is sufficient for $theta$ if and only if,
  $
    f_theta (dt) = g(T(dt), theta)h(x)
  $
  where $theta in Theta subset RR^k$, and the functions $g(dot)$ and $h(dot)$ are non negative functions and $h(dot)$ is independent of $theta$.
]<fnft>
In principle we can get multiple sufficient statistics, with finer and finer partitions of $D$. We try to find the statistic which is sufficient and has the coarsest partitions in $D$.

== Minimal Sufficient Statistic
#definition("Minimal Sufficient Statistic")[

  A statistic $T$ is said to be minimal sufficient for $theta$ iff it is sufficient for $theta$ and for any other sufficient statistic $S$ $exists$ a function $g$ such that,
  $
    T = g(S)
  $
]

#lemma[
  If $T_1$ and $T_2$ are minimal sufficient statistics, there exist injective functions $g_1$ and $g_2$ such that,
  $
    T_1 = g_2 (T_2) quad T_2 = g_1 (T_1)
  $
]
INSERT PROOF.

#theorem("Characterization of minimal sufficiency")[

  Let $dt$ be a joint pmf/pdf $f_theta (x)$ and $T=T(dt)$ be a statistic. Suppose the following property holds,
  $
    (f_theta (x))/(f_theta (y)) "is free of" theta "iff" T(x) = T(y) " " forall " " x,y "s.t." f_theta (y) eq.not 0
  $
  Then $T$ is minimal sufficient for $theta$.
]<minchar>

#proof[
  Assume for simplicity that $f_theta (x) > 0 " " forall " " x in RR^n "and " forall " " theta in Theta$. We need to show two things,
  + $T$ is sufficient for $theta$
  + For any other sufficient statistic $S$, $exists$ a function $g$ such that $T = g(S)$.

  1: Sufficiency of $T$:

  Let $frak(T) = {T(y): y in RR^n}$ be the image of $T$. Let ${A_t: t in frak(T)}$ be the level sets of $T$. We can pick an appropriate $y^*$  such that,
  $
    f_theta (x) = f_theta (y^*) (f_theta (x))/(f_theta (y^*))= g(T(x), theta) h(x)
  $
  We choose $y^*$ such that $T(y^*) = T(x)$, i.e. we choose $y^*$ from the level set $A_(T(x))$. Then by Fisher Neyman factorization theorem @fnft, $T$ is sufficient for $theta$.

  2: Minimality of $T$:
 Let $S$ be any other sufficient statistic for $theta$. Then by @fnft,
  $
    f_theta (x) = g_1 (S(x), theta) h_1 (x)
  $
  Note that,
  $
    (f_theta (x))/(f_theta (y)) = (g_1 (S(x), theta) h_1 (x))/(g_1 (S(y), theta) h_1 (y))
  $
  We need to show that there exists a function $g$ such that $T(x) = g(S(x))$. We just need to show the single valuedness of $g$. To show that we just need to show if $S(x) = S(y)$ then $T(x) = T(y)$. Suppose $S(x) = S(y)$, then,
  $
    (f_theta (x))/(f_theta (y)) = (h_1 (x))/(h_1 (y)) "which is free of " theta
  $
  We can use the property in @minchar to conclude that $T(x) = T(y)$. Thus $g$ is single valued and $T$ is minimal sufficient for $theta$.

]
Note a sufficient statistic can also contain garbage information. A sufficient statistic can be paired with an ancillary statistic and the combined statistic would still be sufficient.

== Complete Statistic
#definition("Complete Statistic")[

  Let $T$ be a statistic. Let ${g_theta (T= t): theta in Theta}$ be a family of pdf/pmf of $T$. The statistic $T$ is #text(blue, [complete]) if given any measureable function $h$ the following holds for all $theta in Theta$,
  $
    EE_theta [h(T)] = 0  ==> P_theta (h(T) = 0) = 1
  $
]

Unfortunately we have no easy characterization of complete statistic, like @minchar for minimal sufficiency.

#theorem("Basu's Theorem")[

  A complete sufficient statistic is independent of any ancillary statistic.
]
#proof[
  (Only the discrete case is shown here. The continuous case is similar.)
  Let $T$ be a complete sufficient statistic and $S$ be an ancillary statistic. It is enough to show that,
  $
    P (S = s | T = t) = P (S = s) " " forall " " s,t
  $
  Note that here none of the probabilities depend on $theta$ as $S$ is ancillary and $T$ is sufficient. Let us fix some $s$. Define the function,
  $
    h(t) = P(S=s|T=t) - P(S=s)
  $
  Note that $h(T)$ is a statistic as it does not depend on $theta$.
  $
    EE_theta [h(T)] &= sum_t h(t) P_theta(T=t) \
    &= sum_t [P(S=s|T=t) -P(S=s)]P_theta(T=t)\
    &= sum_t P(S=s,T=t) - P(S=s) sum_t P_theta(T=t)\
    &= P(S=s) - P(S=s) = 0
  $
  Since $T$ is complete, $P(h(T) = 0) = 1$. Thus $h(T) = 0$. This proves the independence of $S$ and $T$.

]
#theorem("Lehmann Scheffe")[

  Let $dt$ have a joint pdf/pmf. If $T$ is a complete sufficient statistic for $theta$, then $T$ is minimal sufficient.
]<lehsch>
#proof[
  This proof will be sketched and not completely written out.

  We will construct a minimal statistic $S$ and then show that $T$ and $S$ are related by one to one functions. This will prove that $T$ is also minimal sufficient.

  Define an equivalence relation on $RR^n$ as follows,
  $
    x scripts(~)_S y "if and only if" (f_theta (x))/(f_theta (y)) "is free of" theta " " forall " " theta in Theta
  $

  Construct partitions of $RR^n$ using the equivalence relation. Define a statistic $S$ such that $S(x) = S(y)$ if and only if $x scripts(~)_S y$.

  #result("Lehman Scheffe sufficiency")[
    The statistic $S$ is minimal sufficient for $theta$.
  ]
  A proof of this is not provided here.

  Since $T$ is sufficient for $theta$, we have $S = g_1(T)$, since $S$ is minimal sufficient. Define,
  $
    g_2(S) = EE [T|S]
  $
  This is indeed a valid statistic. Then define,
  $
    g(T) = T -g_2(S)
  $
  Thus we can write,
  $
    EE_theta [g(T)] = EE_theta [T] - EE_theta [g_2(S)] = EE_theta [T] - EE_theta [EE_theta [T|S]] = 0
  $
  Since $T$ is complete, $P_theta (g(T) = 0) = 1 " " forall " " theta in Theta$. Thus,
  $
    P_theta (T = g_2(S)) = P_theta (T = g_2(g_1(T))) = 1 " " forall " " theta in Theta
  $
  $g_2$ and $g_1$ can be shown to be inverses of each other. Thus $T$ is minimal sufficient for $theta$.
]
The reverse implication does not hold and an example shall be provided below.
