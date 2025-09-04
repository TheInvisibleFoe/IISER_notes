
#import "imports.typ":*


= Optimal Estimation

We now need to quantify the "error of approximation" to select among potential candidates for statistics.

#definition("Mean Squared Error")[

  Let $T$ be a test statistic. Let $theta in Theta$ be a parameter. Then the mean squared error, function of the parameter $theta$, is given by,
  $
    mse_theta (T) = EE_theta [(T- theta)^2]
  $
]

#theorem("Bias Variance Decomposition")[
  The Mean squared error can be decomposed into,
  $
    mse_theta (T) = EE_theta [(T- theta)^2] = [underbrace(EE_theta (T) - theta,"Bias"_theta (T))]^2 + vr_theta (T)
  $
  This is called the Bias-Variance decomposition.
]
#proof[
  This is trivial as,
  $
    EE_theta [(T- theta)^2] = vr_theta (T- theta) + [EE_theta (T)- EE_theta (theta)]^2 = vr_theta (T) + [EE_theta (T)- theta]^2
  $
]

To find an optimal statistic, we need to find one such that the MSE is minimized uniformly in $theta$ over the parameter space $Theta$. Unfortunately this is not possible due to one simple fact. Just fix some $theta_a in Theta$. Then define the statistic to be $T = theta_a$. This is a valid statistic. Any statistic chosen will be worse than this in some neighbourhood of $theta_a$.(Is MSE a continuous function of $theta$ ?)

We have some possible alternatives to error quantifiers, and look for one dimensional summaries of the curve $theta mapsto mse_theta$

We can have the
+ Bayes Approach : $ R_1 (T) = integral_Theta mse_theta (T) omega(theta) dd(theta) $ $omega(theta)$ is called the prior.
+ Minimax Approach: $ R_2 (T) =  sup_(theta in Theta) mse_theta (T) $ This quantifies the worst possible scenario.

We will be heading in a different direction and only consider the case of parameters with $"Bias"_theta (T) = 0 " " forall " " theta in Theta$.

== UMVUE

#definition("Unbiased Estimator")[
  The statistic $T$ is said to unbiased for $theta$ if
  $
    EE_theta [T] = theta " " forall " " theta in Theta
  $
]

Our aim is to find $T^*$ among the class of unbiased estimators such that the mean squared error is minimized, which means the following property holds,
$

  underbrace(mse_theta (T^*), vr_theta (T^*)) <= underbrace(mse_theta (T), vr_theta (T)) " " forall " " theta in Theta, forall " " T " unbiased for " theta
$
If such a $T^*$ exists, it is called the Uniform Minimum Variance Unbiased Estimator (UMVUE).

Some comments on unbiased estimators,
+ An unbiased estimator need not exist.
+ For a given class of estimators, the MSE error need not be the lowest for an unbiased estimator.

Unbiased estimators might not very good for certain purposes. In general this approach is taken so that the MSE can be minimized over all values of $theta$ in $Theta$, provided we restrict ourselves to unbiased estimators.

#theorem("Rao-Blackwell theorem")[

  Let $dt$ have a joint pdf/pmf $f_theta (dot)$ with $theta in Theta subset RR^p$. Let $T=T(dt)$ be a sufficient statistic for $theta$. Let $S = S (dt)$ be a statistic such that
  + $EE_theta [S] = theta " " forall " " theta in Theta$
  + $vr_theta (S) < oo " " forall " " theta in Theta$

  Define the new statistic,
  $
    S^* = EE_theta [S | T]
  $
  This is called the Rao-Blackwellization of $S$ with respect to $T$.

  Then the following holds,
  + $S^*$ is unbiased for $theta$
  + $vr_theta (S^*) <= vr_theta (S) " " forall " " theta in Theta$
  with equality if and only if $P_theta (S^* = S) = 1 " " forall " " theta in Theta$.
]<raoblack>
#proof[
  Note that $S^*$ is a statistic as it is a conditional expectation on the sufficient statistic $T$. To show unbiasedness,
  $    EE_theta [S^*] = EE_theta [EE_theta [S | T]] = EE_theta [S] = theta $
  using the law of total expectation.

  To show the variance reduction, we use a formula for the conditional variance.

  Let $X,Y$ be random variables, with $EE[Y^2] < oo$. Then,
  $
  vr(Y) = EE[vr(Y|X)] + vr(EE[Y|X]) >= vr(EE[Y|X])
  $
  Since $vr(Y|X) >= 0$. (WILL WRITE EQUALITY PROOF LATER)
]

The above theorem leaves us with two questions,
- What unbiased estimator $S$ should we start with to minimize MSE ?
- What sufficient statistic $T$ should we use to minimize MSE ?

#theorem("Minimal Statistic for unbiased estimation")[

Let $S$ be an unbiased estimator for $theta$ and let $T_1$ and $T_2$ be two sufficient statistics for $theta$. Define the Rao-Blackwellizations,
$  S_1 &= EE_theta [S | T_1] \
  S_2 &= EE_theta [S | T_2]
$
If $T_1 = h(T_2)$, for some function $h$, then
$  vr_theta (S_1) <= vr_theta (S_2) " " forall " " theta in Theta
$
Thus if a minimal sufficient statistic $T$ exists, the Rao-Blackwellization with respect to $T$ is the best among all Rao-Blackwellizations with respect to any other sufficient statistic.
]
#proof[
  To show this we use the tower property of conditional expectation. If $Y= f(X)$, then
  $
    EE (Z|Y) = EE(EE(Z|X)|Y)
  $

  Since $T_1 = h(T_2)$,
  $
    S_1^* &= EE(S|T_1)\
    &= EE(EE(S|T_2)|T_1) \
    &= EE(S_2^*|T_1)
    $
  Using @raoblack,
  $    vr_theta (S_1^*) = vr_theta (EE(S_2^*|T_1)) <= vr_theta (S_2^*) " " forall " " theta in Theta
  $
]
#theorem("Choice of Unbiased estimator")[
 Assume that $T$ is complete sufficient for $theta$. Let $S_1$ and $S_2$ be two unbiased estimators for $theta$. Define the Rao-Blackwellizations,
  $  S_1^* &= EE_theta [S_1 | T] \
    S_2^* &= EE_theta [S_2 | T]
  $

  Then $
         P_theta (S_1^* = S_2^*) = 1 " " forall " " theta in Theta
       $
]
#proof[
  Note that both $S_1^*$ and $S_2^*$ are unbiased for $theta$. Thus
  $
    EE_theta [S_1^* - S_2^*] = 0 " " forall " " theta in Theta
  $
  We have acheived first order ancillarity. $S_1^*$ and $S_2^*$ are functions of the complete sufficient statistic $T$. Thus using the definition of completeness,
  $
    P_theta (S_1^* - S_2^* = 0) = 1 " " forall " " theta in Theta
  $
]
This theorem shows that the choice of unbiased estimator does not matter if we have a complete sufficient statistic. The Rao-Blackwellization will always be the same.

#theorem("Lehmann-Scheffe for UMVUE")[
  Let $T$ be a complete sufficient statistic for $theta$. Let $S$ be any unbiased estimator for $theta$, such that $vr_theta (S) < oo " " forall " " theta in Theta$. Then the Rao-Blackwellization,
  $    S^* = EE_theta [S | T]
  $
  Then,
  + $vr_theta (S^*) <= vr_theta (U) " " forall " " theta in Theta, forall " " U " unbiased for " theta$
  + If for some unbiased estimator $U$, $vr_theta (S^*) = vr_theta (U) " " forall " " theta in Theta$, then
    $
      P_theta (U = S^*) = 1 " " forall " " theta in Theta
    $
  Thus $S^*$ is the unique UMVUE for $theta$.
]
This theorem is the culmination of the previous theorems in this section. If a complete sufficient statistic exists, we can find the UMVUE for $theta$ by Rao-Blackwellizing any unbiased estimator with respect to the complete sufficient statistic.

#remark[
1. If a complete sufficient statistic $T$ exists, the UMVUE is a function of $T$.
2. If the UMVUE exists, it is unique.
3. This theorem can be used to check whether unbiased estimators exist or not. If we can find a complete sufficient statistic $T$ and show that no function of $T$ is unbiased for $theta$, then no unbiased estimator for $theta$ exists. This means that the UMVUE exists iff an unbiased estimator exists.
]

In general, we have two approaches to find the UMVUE for $theta$. First find a complete sufficient statistic $T$ for $theta$.
+ Find some unbiased estimator $S$ for $theta$ and Rao-Blackwellize it with respect to $T$.
+ Find a function of $T$ which is unbiased for $theta$. We also need check that the function has finite variance.
