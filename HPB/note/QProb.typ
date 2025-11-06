
#import "imports.typ": *

#set text(font: "mlmodern")
// #set text(font: "New Computer Modern")

= Quantum Probability
These are just some important stuff and loose collection of notes of the Chapter on Quantum Probability from The Theory of Open Quantum Systems by H.-P. Breuer and F. Petruccione.

== Spectral Theorem
Consider a self-adjoint operator $A$ acting on a separable Hilbert space $cal(H)$. Then, there exists a unique one parameter mutually commuting spectral family ${E_lambda}_(lambda in RR)$ of projection operators acting on $cal(H)$ such that
$
  A = integral_(RR) lambda d E_lambda
$
where $E_lambda$ satisfy,
1. $norm(E_r' psi) <= norm(E_r psi)$ for $r' <= r$ and for all $psi in cal(H)$. This can equivalently be written as $ E_r' <= E_r "for" r' <= r $.
2. The spectral family is right-continuous, i.e., $ lim_(epsilon --> 0+) E_(r+epsilon) = E_(r_0)  "for all" r_0 in RR $.
3. $ lim_(r --> -oo) E_r = 0 $ and $ lim_(r --> oo) E_r = I $, where $I$ is the identity operator on $cal(H)$.

A much better and concise explanation can be found for normal operators in @Halmrast2017.
== Basic Postulates of Quantum Mechanics
Consider a statistical ensemble $epsilon$ of identically prepared quantum systems, $S^(1), S^(2), ..., S^(N)$. The postulates are,

1. Under certain conditions, a complete characterization of this ensemble  can be given by a normalized state vector $ket(psi) in cal(H)$, which is a Hilbert space associated with the quantum system $S$.
2. Measureable quantities are represented by linear, self-adjoint operators $A$ acting on $cal(H)$. The outcome of a measurement of the observable $A$ performed on the ensemble $epsilon$ is a random variable $R$ with a cumulative distribution function $F_R(x)$ defined by
$
  F_A(r) = expval(psi, E_r,psi)
$
where $E_r$ is the spectral family of the operator $A$.One can easily verify from the Spectral theorem above that this indeed is a valid cumulative distribution function.

