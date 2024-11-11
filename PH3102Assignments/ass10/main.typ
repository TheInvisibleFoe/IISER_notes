#import "template.typ": *
#import "@preview/physica:0.9.1": *
#import "@preview/ctheorems:1.1.2": *

#show: thmrules
#show: super-T-as-transpose // put in a #[...] to limit its scope...
#show: super-plus-as-dagger // ...or use scripts() to manually override

#show: arkheion.with(
  title: "PH3102: QM Assignment 10",
  authors: (
    (name: " Sabarno Saha     22MS037", email: none,  affiliation: "IISERK"),
  ),
)

#set cite(style: "chicago-author-date")
#show link: underline
#let ar = [$angle.r$]
#let al = [$angle.l$]
#let tc = [$times.circle$]
#let vb(ip) = {$bold(hat(ip))$}
#let br(ip) = {$|#to-string(ip.join(",")) angle.r$}

#set math.mat(delim: "[")
#set align(left)

= Degenerate Perturbation Theory on 2D Harmonic Oscillator

Here, we consider a 2D harmonic oscillator with Hamiltonian given as 
$ H = 1/(2m) (p_x^2 + p_y^2) + 1/2 m omega^2 (x^2+y^2) = H_x + H_y $
so that it is the sum of two 1D harmonic oscillators. 
#answer[
  We want to show $[H,H_x] = 0$. This can be done by just showing $[H_x,H_y] = 0$.
  We have $[x,p_x] = i/hbar$, $[y,p_y] = i/hbar$, $[x,p_y] = 0$ and $[y,p_x] = 0$. Thus, we have
 $ &[H_x,H_y] = 1/2 m omega^2 [x^2 + p_x^2/(omega^2 m^2), y^2 + p_y^2/(omega^2 m^2)] \
   => & [H_x,H_y]= 1/2 m omega^2 [x^2, y^2] + 1/2 m omega^2 [p_x^2/(omega^2 m^2), y^2]+ [p_x^2/(omega^2 m^2),x^2] + 1/2 m omega^2 [p_x^2/(omega^2 m^2), p_y^2/(omega^2 m^2)] \
   => &[H_x,H_y] = 0 $
   
 Thus $[H,H_x] = [H_x + H_y ,H_x] = [H_y,H_x] = 0$. Thus the eigenstates of $H$ are also eigenstates of $H_x$. Similarly, we can show that the eigenstates of $H$ are also eigenstates of $H_y$, because $[H,H_y] = [H_x + H_y ,H_y] = [H_x,H_y] = 0$.
 
 Thus we can write the eigenstates of $H$ as $ket(n_x","n_y) = ket(n_x) times.circle ket(n_y)$, where $n_x$ and $n_y$ are the quantum numbers which represent the eigenvalues of the Number operators for the 1D harmonic oscillators in the $x$ and $y$ directions respectively.
]
#answer[
  The angular momentum operators are given by $L = x p_y - y p_x$. We want to show that $[H,L] = 0$. Let us calculate $[H_x,L]$ and $[H_y,L]$.
  Let us rewrite $L$ is terms of the raising and lowering operators. We have $x = sqrt(hbar/(2 m omega)) (a + a^dagger)$ and $y = sqrt(hbar/(2 m omega)) (b + b^dagger)$ and $p_x = -i sqrt((m omega hbar)/2) (a - a^dagger)$ and $p_y = -i sqrt((m omega hbar)/2) (b - b^dagger)$. Thus, we have $L = x p_y - y p_x = i hbar (a^dagger b - a b^dagger)$. We will use this expression to calculate $[H_x,L]$ and $[H_y,L$. Here $H_x = hbar omega (a^dagger a + 1/2)$ and $H_y = hbar omega (b^dagger b + 1/2)$.
  Let us have
  $ [H_x, L] &= i hbar^2 omega [a^+a +1/2, a^+b - a b^+] \
            & = i hbar^2 omega [a^+a, a^+b] - i hbar^2 omega [a^+a, a b^+] + i hbar^2 omega [1/2, a^+b] - i hbar^2 omega [1/2, a b^+] \
            & = - i hbar^2 omega (a b^+ + b a^+)
  $ 
  Similarly, we can calculate $[H_y,L]$. We have $[H_y,L] = i hbar^2 omega ( a b^+ + b a^+)$. Thus, we have $[H,L] = [H_x,L] + [H_y,L] = 0$. Thus the eigenstates of $H$ are also eigenstates of $L$.
  
  Thus we can also label the eingenstates of $H$ using $H$ and $L$, instead of $H_x, H_y$. Thus we have found two Complete Set of Commuting Observables (CSCO) for the 2D harmonic oscillator, namely ${H_x, H_y}$ and ${H, L}$. Thus we can recast the problem into eigenstates of $H$ and $L$.]
#answer[
  //explain why the first excited states are doubly degenerate
  The first excited states are doubly degenerate because the first excited state of $H_x$ is degenerate with the first excited state of $H_y$. This is because the first excited state of $H_x$ is $ket(1","0)$ and the first excited state of $H_y$ is $ket(0","1)$. These two states have the same energy. The ground state is not degenerate since $ket(0","0)$ can only be constructed from both the oscillators in the ground state i.e. $ket(0","0) = ket(0)_x times.circle ket(0)_y$. We can also see that $ket(0","0)$ is an eigenstate of $L$. But the first excited direct product states $ket(1","0), ket(0","1)$ are not eigenstates of $L$. 
]
#answer[
  We add a small perturbation $H_1 = lambda x y$ to the Hamiltonian. We want to find the first order correction to the energy of the ground state. The ground state of the unperturbed Hamiltonian is $ket(0","0)$. The first order correction to the energy of the ground state is given by $E_0^1 = bra(0","0)H_1 ket(0","0) = 0$. 
  
  Let us rewrite the perturbation in terms of raising and lowering operators. We have $x = sqrt(hbar/(2 m omega)) (a + a^dagger)$ and $y = sqrt(hbar/(2 m omega)) (b + b^dagger)$. Thus, $H_1 = lambda x y = lambda hbar/(2 m omega) (a + a^dagger)(b + b^dagger)$. The first order correction to the energy of the ground state is given by 
  $ E_0^1 &= lambda hbar/(2 m omega) bra(0","0) (a + a^dagger)(b + b^dagger) ket(0","0) \ 
    & =  lambda hbar/(2 m omega) bra(0","0) (a b + a b^dagger + a^+ b + a^+ b^+ ) ket(0","0)\
    & = lambda hbar/(2 m omega) [bra(0","0) a b ket(0","0) + bra(0","0) a b^dagger ket(0","0) + bra(0","0) a^+ b ket(0","0) + bra(0","0) a^+ b^+ ket(0","0)]\
    & = lambda hbar/(2 m omega) [ braket(0","0,1","1)]\
    & = 0
  $
  Thus the first order correction to the energy of the ground state is zero.
]
#answer[
  We will use degenerate perturbation theory and calculate the first order correction to the energy of the first excited states. The first excited states are $ket(1","0)$ and $ket(0","1)$. Let us write down the matrix for the first excited state subspace.
  $ H_1 = mat(bra(1","0)H_1 ket(1","0) quad bra(1","0)H_1 ket(0","1) ;bra(0","1)H_1 ket(1","0) quad bra(0","1)H_1 ket(0","1)) = (lambda hbar)/(2 m omega) mat(0,1;1,0) = mat(0,v;v,0) ; v =(lambda hbar)/(2 m omega) $
  Thus the energy corrections to the first excited states are given by the eigenvalues of the matrix $H_1$. The eigenvalues are $lambda_+$ and $lambda_-$, which are given using the characteristic equation $ &(lambda - v^2) = 0 \ =>& lambda = plus.minus v  $ Thus the first order correction to the energy of the first excited states are 
  $ E_(1+)^((1)) = v = (lambda hbar)/(2 m omega) quad quad;quad quad E_(1-)^((1)) = -v = -(lambda hbar)/(2 m omega) $
  Since this subspace is a two state system with the state space ${ket(0","1) , ket(1","0)}$. We can represent the states as
  $ ket(0","1) = vec(1,0)  quad ; quad ket(1","0) = vec(0,1) $
  The eigenvectors of the matrix $H_1$ are given by the eigenvectors of the matrix $mat(0,v;v,0)$. The eigenvectors are given by $vec(1,1)$ and $vec(1,-1)$.
  Thus the normalized eigenvectors are given by
  $ ket(psi_1) = 1/(sqrt(2)) vec(1,1) = 1/(sqrt(2)) (ket(1","0) + ket(0","1))  quad ; quad ket(psi_2) = 1/(sqrt(2)) vec(1,-1) = 1/(sqrt(2)) (ket(1","0) - ket(0","1)) $
  Thus the corrected eigenstates are given by $ket(1","0) + ket(0","1)$ and $ket(1","0) - ket(0","1)$. The corrected energies are 
  $ E_(1+) = E_1 + lambda hbar/(2 m omega) quad ;quad  E_(1-)= E_1-(lambda hbar)/(2 m omega) $
  We see that the degeneracy of the first excited states is lifted by the perturbation $H_1$.
]
#answer[
  We want to now show that $[H_x, H_1] eq.not 0$ and $[H_1,L] eq.not 0$. Let us first show that $[H_x,H_1] eq.not 0$.
 $ [H_x, H_1] & = [hbar omega (a^+a + 1/2), (lambda hbar)/(2 m omega) (a+a^+)(b+b^+)]\
              & = (lambda hbar^2)/(2 m) [(a^+a + 1/2), (a+a^+)(b+b^+)]\
              & = (lambda hbar^2)/(2 m) [a^+a, a+a^+](b+b^+)\
              & = (lambda hbar^2)/(2 m) (-a+a^+)(b+b^+) eq.not 0
 $ 
 We now want to show that $[H_1,L] eq.not 0$
 $ [H_1,L] &= [(lambda hbar)/(2 m omega) (a+a^+)(b+b^+), i hbar (a b^+ - b a^+)]\
          &= i(lambda hbar^2)/(2 m omega) [(a+a^+)(b+b^+), a b^+ - b a^+] \
          & = i lambda hbar (y^2- x^2 ) eq.not 0
 $
 Thus the perturbed states are not eigenstates of the angular momentum operator. Thus neither the eigenbasis of $H_x$ and $L$  will diagonalise the perturbed Hamiltonian.
 
 Let us now define the reflection operator $S$ which is reflection about $y=x$. The reflection operator commutes with the perturbation 
 $ [H_1,S] &= [lambda x y, S] = lambda [x y, S]\
          & = lambda (x y S - S x y)\
          & = lambda ( y x S - y S y)\
          & = lambda (y S y - y S y) = 0\
 $
 Thus the perturbed Hamiltonian does not have a symmetry under reflection about $y=x$. The reflection operator swaps $x$ and $y$. Let consider the action of the reflection operator on the position representation of the eigenkets. 
 $ S phi.alt_0(x) = phi.alt_0(y) quad S phi.alt_1(x) = phi.alt_1(y) $
 Using these we see that 
 #nonum($   S Phi_(00)(x,y) = Phi_00 (y,x) = Phi_(00) (x,y) $)
 #nonum($ S Phi_(01)(x,y) = Phi_01 (y,x) = Phi_(10) (x,y) $)
  #nonum($ S Phi_(10)(x,y) = Phi_10 (y,x) = Phi_(01) (x,y) $)
 Thus the degenerate eigenkets under operation of $S$ is given by 
 #nonum($ S (1/sqrt(2) (Phi_01(x,y) + Phi_(10)(x,y))) =  1/sqrt(2) (Phi_10(x,y) + Phi_(01)(x,y)) $)
  #nonum($ S (1/sqrt(2) (Phi_01(x,y) - Phi_(10)(x,y))) = - 1/sqrt(2) (Phi_01(x,y) - Phi_(10)(x,y)) $)
 We can see that swapping the $x$ and the $y$ values of the perturbed eigenkets just returns the eigenkets with a $plus.minus 1$ eigenvalues. Thus, the perturbed eigenkets are also the eigenkets of the reflection operator $S$.
]
= Variational method for a Bouncing Ball potential
The potential is given as 
$ V(x) = cases(m g x quad &x>0 , 0 quad &x<0 ) $
#answer[
  We want to figure out the boundary conditions for $x = 0$ and $x --> oo$. Now the since the potential is infinite at $x<0$, $psi(0_+) = 0$ and by the continuity of $psi(x)$ we get 
  #nonum($ lim_(x-->0+) psi(x) = lim_(x-->0-) psi(x) = 0 $)
  Now, we want the wavefunction $psi(x)$ should be normalizable. Thus we want the wavefunction to vanish at $x --> oo$. Thus we get 
  #nonum($lim_(x-->oo) psi(x) = 0$)
  The variational method uses a trial wavefunction as ansatz to determine the energy of the gorund state. The trial wavefunction is given by
  #nonum($ psi(x) = cases(x e^(- a x) quad & x>0, 0 quad & x<0 ) $)
  The wavefunction also satisfies the boundary conditions at $x = 0$ and $x --> oo$. 
  #nonum($ lim_(x --> 0) x e^(-a x) = 0 quad quad lim_(x --> oo) x e^(-a x) = 0 $)
  Let us now normalize the wavefunction
  $ 1 &= integral_(-oo)^(oo) psi^*(x) psi(x) d x = integral_0^(oo) |N|^2 x^2 e^(-2 a x) d x      &= |N|^2 2/(8 a^3) = |N|^2 1/(4 a^3)\
  => |N| &= sqrt( 4 a^3)
  $
  We will now calculate the expectation value of the energy. The expectation value of the energy is given by
  $ expval(H) &= expval(T) + expval(V) = E 
              = integral_(-oo)^(oo) psi^*(x) (-hbar^2/(2 m) d^2/(d x^2) psi(x) + V(x) psi(x)) d x \ 
              &= |N|^2 integral_(oo)^(oo) x e^(- a x) (-hbar^2/(2 m) d^2/(d x^2) x e^(- a x)) d x + m g integral_0^oo |N|^2 x^3e^(- 2a x) d x\ 
              &= (-hbar^2|N|^2)/(2 m) integral_(oo)^(oo) x e^(- 2a x)(a^2x-2a) d x + |N|^2 Gamma(4)/(2 a)^4\ 
              &= (-hbar^2)/(2 m) |N|^2 (a^2  Gamma(3)/(2 a)^3 - 2a Gamma(2)/(2 a)^2) + |N|^2 Gamma(4)/(2 a)^4\
              &= (a^2 hbar^2)/(2 m) + (3 m g)/(2 a)
  $
  The expectation value of the energy of the trial wavefunction is given by
  #nonum($ E = (a^2 hbar^2)/(2 m) + (3 m g)/(2 a) $)
]
#answer[
  We want to minimize the energy with respect to the parameter $a$. We can do this by setting the derivative of the energy with respect to $a$ to zero. We get
  $ &(d E)/(d a) = (a hbar^2)/(m) - (3 m g)/(2 a^2) = 0 => &a_0^3 = (3 m^2 g)/(2 hbar^2)  =>  &a_0 = ((3 m^2 g)/(2 hbar^2))^(1/3)
  $
  We want to verify that the energy is a minimum. We can do this by calculating the second derivative of the energy with respect to $a$. We get
  $ (d^2 E)/(d x^2)  = hbar^2/m +(3 m^2 g)/(a_0^2 hbar^2) > 0 $
  Let us now calculate the $expval(H)_min$
  $ expval(H)_min = 1/(2 a_0) [( a_0^3 hbar^2)/m + 3 m g ] = 1/(2 a_0) (9 m g)/2 = 3((9 m g^2 hbar^2)/(32))^(1/3)   $
  We know from the variational method that the ground state energy is always lower than the energy of the trial wavefunction.
  #nonum($ E_0 < expval(H)_min  = 3((9 m g^2 hbar^2)/(32))^(1/3)$)
]