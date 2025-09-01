#import "imports.typ":*
= Data and Models
#let dt = $attach(limits(X),b: ~ )$
#definition("Data")[
  Let $G$ generate a vector in $RR^n$ according to some model.
  $
     G : Omega --> RR^n
  $
  Then $dt$ is called a realization of the data $G(omega)$ for some $omega in Omega$

] $dt$ comes from some distribution or model $F$. This course is all about
parametric models. #definition("Parametric Model")[ Let $F$ be some parameter
model. Then $ F in frak(F) = {F_theta : theta in Theta subset RR^k "for some" k
in NN} $ $Theta$ is called the parameter space. ] We define $g$ to be the map
that maps a set of parameters to a model. $g$ is onto. For every $F_theta$,
there always exists $theta$, such that $ theta limits(mapsto)_g F_theta $ $g$ also needs to be injective, otherwise we run into the problem of identifiability. The problem of identifiability arises when we cannot infer the parameters from the model $F_theta$.

Unlees explicitly mentioned otherwise, the data is represented by $dt$.
For all models in this course, we assume the following,
+ The parametrization is bijective.
+ The models $F_theta in frak(F)$ are all either discrete or continuous, not a mixture of both.

= Statistic

#definition("Statistic")[
  Let the data be $dt in RR^n$. A statistic $T = T(X)$ is a measureable function of data and data only.
]

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

#definition("Sufficient Statistic")[

  The test statistic $T = T(dt)$ is said to be sufficient iff the distribution of $(dt|T=t)$ is free of $theta$ for all values of $t$.
]

#theorem("Fisher Neyman Factorization theorem")[

  Suppose $dt$ is an iid sample from $f_theta (dot.c)$, which might be either a pmf or a pdf. A statistic $T=T(X)$ is sufficient for $theta$ if and only if,
  $
    f_theta (dt) = g(T(dt), theta)h(x)
  $
  where $theta in Theta subset RR^k$, and the functions $g(dot)$ and $h(dot)$ are non negative functions and $h(dot)$ is independent of $theta$.
]
In principle we can get multiple sufficient statistics, with finer and finer partitions of $D$. We try to find the statistic which is sufficient and has the coarsest partitions in $D$.

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

]

Note a sufficient statistic can also contain garbage information. A sufficient statistic can be paired with an ancillary statistic and the combined statistic would still be sufficient.

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

#theorem("Lehmann Scheffe")[

  Let $dt$ have a joint pdf/pmf. If $T$ is a complete sufficient statistic for $theta$, then $T$ is minimal sufficient.
]

= Families of distribution
#definition("Exponential family of distribution")[

  Let $dt$ have a joint pdf/pmf $f_theta (dot)$ with $theta in Theta subset RR^p$. We say that the $f_theta (dot)$ belongs to the $k$-parameter exponential family if $f_theta (dot)$ admits the functional form,
  $
    f_theta (dt) = exp[{sum_(j=1)^k c_j (theta) T_j (dt)} - d(theta)] S(dt)
  $
  for all $x in frak(X), forall theta in Theta$. $frak(Theta)$ is the space of all values taken by $dt$.

  Equivalently the last restriction can also be rewritten as that the support of $f$,
  $
    "supp"(f) = {x: f_theta (x) >0}
  $
  is free of $theta$.

  $c_j 's$ are called Natural or canonical parameters

  $T_j 's$ are called Natural or canonical statistics

]
