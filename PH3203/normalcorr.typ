
#import "imports.typ":*

PAM Dirac first put forth the quantization of the EM field into decoupled harmonic oscillators. A full derivation can be found in  @Dirac1958. We use the same operators, just using different notation from his derivations.
We have already seen that we quantize our electric field as,
$ bold(E) (r,t) = bold(E)^+(r,t) + bold(E)^-(r,t) $
where $bold(E)^+(r,t)$ is the positive frequency part and $bold(E)^-(r,t)$ is the negative frequency part. We will define some semblance of what coherence is in Quantum Optics. To do this we define the first order correlation function as 
$ G^((1))(r_1,t_1;r_2,t_2) = expval(bold(E)^-(r_1,t_1) bold(E)^+(r_2,t_2)) = 
Tr[rho bold(E)^-(r_1,t_1) bold(E)^+(r_2,t_2)] $
In general we can define the nth order correlation functions. In order to write notation 
compactly, let us write $(bold(r_j), t_j) = x_j$. So our nth order correlation function
 is given to be
$ G^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)) = expval(bold(E)^-(x_1) ... bold(E)^-(x_(n)) bold(E)^+(x_(n+1))...bold(E)^+(x_(2n))) $

We use a certain normalization convention for the 1st order correlation function. We define the normalized correlation function as
$ g^((1))(x_1,x_2) = (G^((1))(x_1,x_2))/sqrt(G^((1))(x_1,x_1) G^((1))(x_2,x_2)) $
Generalizing this, we can define the normalized nth order normalized correlation function as
#definition("nth order normalized correlation function")[
The nth order normalized correlation function is defined as
$ g^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)) = (G^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)))/ (product_(i=1)^(2n) G^((1))(x_i,x_i) ) $
where $G^((n))(x_1,x_2,...,x_n, x_(n+1), ..., x_(2n)) = expval(bold(E)^-(x_1) ... bold(E)^-(x_(n)) bold(E)^+(x_(n+1))...bold(E)^+(x_(2n))) $
]
Using some properties of the trace, we can show that, specifically that $tr[rho A^dagger A]$ is positive definite, $|g^(1)(x_1,x_2)|<=1$. Note that this constraint is not for $n>=1$, but since we are generalizing from the first order correlation, we still call it a normalized correlation function. 

The main point of this article to talk about squeezed states of light. To talk about these states, we need to talk about the second order normalized correlation function. The second order normalized correlation function is defined as
$ g^((2))(x_1,x_2,x_3,x_4) = (G^((2))(x_1,x_2,x_3,x_4))/ sqrt(G^((1))(x_1,x_1) G^((1))(x_2,x_2) G^((1))(x_3,x_3) G^((1))(x_4,x_4)) $

We need to use some properties of the correlation functions.
+ Permutation of the first half $(x_1,...,x_n)$ and the second half $(x_(n+1),...,x_(2n))$ individually, of the correlation function does not change the value of the correlation function. This is because when we quantize the electric field, we end up with a bunch of decoupled harmonic oscillators, so for any two oscillators the commutation relation is $[a_i,a_j^dagger] = delta_(i j)$, so the correlation function is invariant under permutation of the first half and the second half.

+ If the field is nth order coherent it must satisfy the following condition $g^((j))(x_1,x_2,...,x_j, x_(j), ..., x_(1)) = 1  quad forall j<=n$. Classically we only use first order coherence to mean coherence. If the field is nth order coherent, then we get 
$ G^((j))(x_1,x_2,...,x_j, x_(j), ..., x_(1)) = product_(i=1)^(j) G^((1))(x_i,x_i) quad forall j<=n $
