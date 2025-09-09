
#import "imports.typ":*

= Problems
== Minimal Sufficient Statistic
Find minimal sufficient statistic for the following distributions:
#options[
1. $no(theta,1), theta in RR$
2. $no(0,sigma^2), sigma^2 > 0$
3. $no(mu,sigma^2), mu in RR, sigma^2 > 0$
4. $ex(lambda), lambda > 0$
5. $po(lambda), lambda > 0$
6. $bet(alpha,beta), alpha > 0, beta > 0$
7. $un(0,theta), theta > 0$
8. $un(theta,theta+1), theta in RR$
9. $un(-theta,theta), theta > 0$
]

== Complete Sufficient Statistic

Check whether the following statistics are complete sufficient statistics:
#options[
1. $no(theta,1), theta in RR$, $T(X) = sum_(i=1)^n x_i$
2. $no(0,sigma^2), sigma^2 > 0$, $T(X) = sum_(i=1)^n x_i^2$
3. $un(0,theta), theta > 0$, $T(X) = X_((1))$
4. $ex(lambda), lambda > 0$, $T(X) = sum_(i=1)^n x_i$
5. $po(lambda), lambda > 0$, $T(X) = sum_(i=1)^n x_i$
]

== Exponential Family
Check whether the following distributions belong to exponential family.
#options[
  1. $ga(alpha,beta), alpha > 0, beta > 0$
  2. $bet(alpha,beta), alpha > 0, beta > 0$
  3. $ex(lambda)$
  4. $be(p)$
  5. $bi(n,p)$
  6. $"Geo"(p)$

]

== Exercise Set 1
#let Var = "Var"
#let Poi = "Poi"
#let Unif = "Unif"


// #set text(font: "New Computer Modern")

#exercise[
  Let $X_(1),...,X_(n)$ be a sample from the uniform distribution on $(-θ,θ)$ ($θ>0$). Show that $S=(X_((1)),X_((n)))$ is a sufficient statistic for $θ$ and it is not complete. Show that $max(-X_((1)),X_((n)))$ is minimal sufficient. Is it complete? Notice the dimension of the minimal sufficient statistic and the dimension of the parameter.
]
#hint[
  Use Fisher Neyman to show sufficiency. $S$ is not complete. An easy proof would be to check by taking different $X_((1))$ with same $X_((n))$ such that $X_((n)) > X_((1))$.
]
#exercise[
  Let $X_(1),...,X_(n)$ be a sample from the distribution with density $f(x;μ)=e^(-(x-μ))1_((μ,∞))(x)$ with a parameter $μ∈ℝ$. Show that $X_((1))$ is a complete sufficient statistic for $μ$. Use Basu's theorem to show that $X_((1))$ and $(1/n)∑_(i=1)^(n)(X_(i)-overline(X))^(2)$ are independent.
]
#hint[
  This is a location family of the exponential distribution. 
]

#exercise[
  Let $Y_(1),...,Y_(n)$ follow the normal linear regression model, that is, they are independent with distribution $N(β_(0)+β_(1)x_(i),σ^(2))$, where $σ>0$ is known and $x_(i)$ are some fixed known constants. Find a minimal sufficient statistic for the parameter $(β_(0),β_(1))^(T)$ (find a sufficient statistic using the factorization lemma and then prove its minimality).
]
#hint[
  Exponential family.
]
#exercise[
  Let $X_(1),X_(2),...,X_(n)$ be an i.i.d. sample from the pdf $f(x)=exp[((x-μ)/σ)^(4)-ξ(θ)]$, $x∈ℝ$, where $θ=(μ,σ)∈Θ=ℝ×ℝ^(+)$. Show that a minimal sufficient statistics for $θ$ is $T=(∑_(i=1)^(n)X_(i),∑_(i=1)^(n)X_(i)^(2),∑_(i=1)^(n)X_(i)^(3),∑_(i=1)^(n)X_(i)^(4))$.
]
#hint[
  Exponential family.
]
#exercise[
  Based on an i.i.d. sample $X_(1),X_(2),...,X_(n)$, find a minimal sufficient statistic for $θ=(μ,σ)∈Θ=ℝ×ℝ^(+)$ in the family of Cauchy distribution given by the density $f(x)=(σ/π)(σ^(2)+(x-μ)^(2))^(-1)$, $x∈ℝ$.
]
#hint[
  #link("https://math.stackexchange.com/questions/2975830/minimal-sufficient-statistics-for-cauchy-distribution","Stack Exchange Link")
]
#exercise[
  Show that if $T$ is an unbiased estimator of $θ$ (i.e., $E_(θ)T=θ$ for all $θ∈Θ$), then $T^(2)$ cannot be an unbiased estimator of $θ^(2)$. 
]
#hint[
  Compute $Var_(θ)T$.
]

#exercise[
  Suppose that $X_(1),...,X_(n)$ is a random sample from $Poi(λ)$ and $n>2$. Show that $(1-2/n)^(overline(X)_(n))$ is an unbiased estimator of $e^(-2λ)$.
]
#hint[
  $sum_(i=1)^n X_i ~ Poi(n lambda)$.
]
#exercise[
  Let $T$ be an unbiased estimator of $θ∈Θ$ such that $0≠E [T^(2)]<oo$ for all $θ∈Θ$. Show that the mean squared error (MSE) $E[(a T-θ)^(2)]$ is minimal for $a=θ^(2)\/(E [T^(2)])$. Consequently, if $a$ does not depend on $θ$, $a T$ is an estimator, and it is optimal (among estimators of the form $a T$) in terms of the mean squared error. Apply this result to find the MSE-optimal estimator of $σ^(2)$ of the form $b_(n)∑_(i=1)^(n)(X_(i)-overline(X))^(2)$ for a sample $X_(1),...,X_(n)$ from a normal distribution with both parameters unknown.
]

#exercise[
  Let $X_(1),...,X_(n)$ be a sample from the uniform distribution on $(0,θ)$ where $θ>0$ is unknown. Consider estimators of $θ$ of the form $hat(theta)_(b)=b X_((n))$, $b>0$. Find the estimator $T$ of this form that has the smallest value of $E_(θ)(T-θ)^(2)$ and $E_(θ)|T-θ|$ for all values of $θ>0$ (if such an estimator exists).
]

#exercise[
  Consider a sample $X_(1),...,X_(n)$ from the $Poi(λ)$ distribution with unknown $λ>0$.
  (a) Consider the parameter $p_(0)=P(X=0)=e^(-λ)$. An unbiased estimator of $p_(0)$ is $tilde(p)_(0)=1_([X_(1)=0])$. Find the uniformly minimum variance unbiased estimator (UMVUE) $hat(p)_(0)$ of $p_(0)$ using Rao-Blackwellization of $tilde(p)_(0)$ with respect to the complete sufficient statistic
  
  (b) Consider the parameter $p_(1)=λ e^(-λ)$ and its unbiased estimator $tilde(p)_(1)=1_([X_(1)=1])$. Find the UMVUE by Rao-Blackwellization.
  
  (c) Consider the parameter $r=e^(-2λ)$ and its unbiased estimator $tilde(r)=1_([X_(1)=0,X_(2)=0])$. Find the UMVUE by Rao-Blackwellization.
]

#exercise[
  Let $X_(1),X_(2),...,X_(n)$ be an i.i.d. sample from $N(μ,1)$, where $μ∈ℝ$ is unknown. 
  (a) Starting from the computations of $E(overline(x)-μ)^(k)$ for $k=2,3,4$, find the UMVUEs of $μ^(2)$, $μ^(3)$ and $μ^(4)$.
  
  (b) Find a simple estimator of $g(t)=Pr(X_(1)≤t)$ for a fixed $t∈ℝ$. Use it to find the UMVUE of $g(t)$. Also, find the UMVUE of $(d\/d t)g(t)$.
  
  [Hint: For the first problem in part (b), use the fact that $(X_(1),overline(x))$ has a bivariate Normal distribution. For the second problem in part (b), use the Dominated Convergence Theorem to find an unbiased estimator of $d_t g(t)$ that is based on $overline(x)$.]
]

#exercise[
  Let $X_(1),X_(2),...,X_(n)$ be an i.i.d sample from $Unif[0,θ]$, where $θ>0$ is unknown. Show that $X_((n))$ is complete sufficient for $θ$. Find the UMVUE of $θ^(2)$.
]

#exercise[
  Let $X_(1),...,X_(n)$ be a sample from the gamma distribution parametrized as
  $ f(x;a,p)=(a^(p))/(Γ(p))x^(p-1)exp(-a x) , x>0 $ 
  where $p>0$ is known and $a>0$ is an unknown parameter. Assume that $n>2/p$. Find the UMVUE of $a$.
  
  _Hint:_ You may use the fact that the complete sufficient statistic $S=X_(1)+⋯+X_(n)$ has the gamma distribution with parameters $a$ and $n p$.
]

#exercise[
  Let $X_(1),...,X_(n)$ be a sample from the distribution with density
  
  $f(x;θ)=(m x^(m-1))/(θ^(m))1_((0,θ))(x)$
  
  where $θ>0$ is unknown. Find the UMVUE of $θ$.
  
  _Hint:_ Start with the sufficient statistic for $θ$.
]

#exercise[
  Consider a regular parametric problem where we observe a sample $X=(X_(1),...,X_(n))$ following a distribution with density/frequency $f(x;θ)$, with $θ∈Θ⊆ℝ$. Suppose that we wish to estimate $g(θ)$ for a measurable function $g:Θ→ℝ$.
  
  (a) Let $T=T(X)$ be an unbiased estimator of $g(θ)$. Show that $δ_(a):=T+a U$ is an unbiased estimator of $g(θ)$ for any $a∈ℝ$ if $E_(θ)(U)=0$ for all $θ∈Θ$.
  
  (b) Suppose that for a fixed $U$ as in (a) and for some fixed $θ_(0)∈Θ$, we have $"Cov"_(θ_(0))(T,U)≠0$. Then, show that there exists $a_(0)≠0$ such that $Var_(θ_(0))(δ_(a_(0)))<Var_(θ_(0))(T)$.
  
  (c) Using (b), prove that $T$ has uniformly (over $θ$) minimum variance among all unbiased estimators of $g(θ)$ only if $"Cov"_(θ)(T,U)=0$ for all $θ∈Θ$ and $U$ satisfying $E_(θ)(U)=0$ for all $θ∈Θ$.
  
  (d) Let $V$ be any other unbiased estimator of $g(θ)$. Use the identity $V=T+(V-T)$ to establish that $T$ has uniformly (over $θ$) minimum variance among all unbiased estimators of $g(θ)$ if $"Cov"_(θ)(T,U)=0$ for all $θ∈Θ$ and for all $U$ satisfying $E_(θ)(U)=0$ for all $θ∈Θ$.
  
  (e) Now, assume that $T$ is an uniformly minimum variance unbiased estimator (UMVUE) of $g(θ)$. Let, if possible, $S$ be another UMVUE of $g(θ)$ different from $T$. Define $W=(T+S)/2$
  
  Use the Cauchy-Schwarz inequality to prove that $Var_(θ)(W)≤Var_(θ)(T)$ for all $θ∈Θ$.
  
  (f) Show that the above inequality cannot be strict for any $θ∈Θ$, and then prove that $P_(θ)(T=S)=1$ for all $θ∈Θ$, i.e., UMVUE is unique (upto measure zero sets).
  
  [Hint: Use the equality criterion in the Cauchy-Schwarz inequality]
  
  (g) Show that if $T$ is complete sufficient for $θ$, then $"Cov"_(θ)(T,U)=0$ for all $θ∈Θ$ and for all $U$ satisfying $E_(θ)(U)=0$ for all $θ∈Θ$.
  
  [Hint: Consider the Rao-Blackwellisation of $U$ with respect to $T$.]
]