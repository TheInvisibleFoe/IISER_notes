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
