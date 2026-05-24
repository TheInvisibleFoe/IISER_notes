#import "imports.typ": *

// #set page(paper: "a4")
// #set heading(numbering: "1.")
// #set math.equation(numbering: "(1)")

= The Langevin Equation

==   Moments of the speed in thermal equilibrium

 As already stated, Eq. (2.1) gives the PDF of each Cartesian component of the velocity of the tagged particle, in a state of thermal equilibrium. Let $u = |upright(bold(v))| $ denote the _speed_ of the particle in three dimensions, and let $f^(upright(e q))(u)$ be the corresponding normalized PDF of $u $. To find this PDF, we may write out the joint PDF in the three Cartesian components: this is a product of three PDFs, each of the form given by Eq. (2.1). Next, we change to spherical polar coordinates for the velocity and integrate over the angular coordinates. The result is

 $  f^(upright(e q))(u) =(frac(m, 2 pi k_(B) T))^(3 /2) 4 pi u^(2) exp(- frac(m u^(2), 2 k_(B) T)) thin, quad 0 <= u < infinity thin .  $

 Figure 2.3 depicts $f^(upright(e q))(u)$ as a function of $u $. Using the definite integral quoted in Eq. (2.8), it is easy to recover the well-known result

 $  chevron.l u chevron.r_(upright(e q)) = integral_(0)^(infinity) d u thin u thin f^(upright(e q))(u) =(frac(8 k_(B) T, m pi))^(1 /2)  $

 for the mean speed of the particle.

(a) Verify that the even and odd moments of the speed are given by

 $  chevron.l u^(2 l) chevron.r_(upright(e q)) = frac((2 l + 1)!, 2^(l) l !)(frac(k_(B) T, m))^(l)  $

 and

 $  chevron.l u^(2 l + 1) chevron.r_(upright(e q)) = frac(2^(l + 3/2)(l + 1)!, sqrt(pi))(frac(k_(B) T, m))^(l + 1/2) thin,  $

 respectively, where $l = 0, 1, 2, ...$

(b) The mean value of the _reciprocal_ of the speed may be found by setting $l = - 1 $ in the expression written down above for $chevron.l u^(2 l + 1) chevron.r_(upright(e q))$. We get

 $  chevron.l u^(- 1) chevron.r_(upright(e q)) =(frac(2 m, pi k_(B) T))^(1 /2) thin .  $

 Therefore

 $  chevron.l u^(- 1) chevron.r_(upright(e q)) > chevron.l u chevron.r_(upright(e q))^(- 1) thin .  $

 Similarly, the mean value of $u^(- 2)$ is found to be

 $  chevron.l u^(- 2) chevron.r_(upright(e q)) = 4 pi(frac(m, 2 pi k_(B) T))^(3 /2) integral_(0)^(infinity) d u exp(- frac(m u^(2), 2 k_(B) T)) = frac(m, k_(B) T) thin .  $

 On the other hand, the mean squared speed (recall that the motion is in three dimensions) is

 $  chevron.l u^(2) chevron.r_(upright(e q)) = frac(3 k_(B) T, m) thin .  $

 Once again, therefore,

 $  chevron.l u^(- 2) chevron.r_(upright(e q)) > chevron.l u^(2) chevron.r_(upright(e q))^(- 1) thin .  $

 Establish the inequalities (2.25) and (2.28) _without_ explicitly evaluating the averages involved in these. (Use an appropriate version of the Cauchy-Schwarz inequality in the space of a certain class of functions of $u $.)

 #set page(paper: "a4")
 #set heading(numbering: "1.")
 #set math.equation(numbering: "(1)")
 
 ==   Energy distribution of the tagged particle
 
  From Eq. (2.20) for the PDF of the speed of the tagged particle, show that the probability density function $phi.alt^(upright(e q))(epsilon.alt)$ of its energy $epsilon.alt = 1/2m u^(2)$ is given by
 
 $  phi.alt^(upright(e q))(epsilon.alt) = frac(2, sqrt(pi))(frac(1, k_(B) T))^(3 /2) epsilon.alt^(1 /2) exp(- frac(epsilon.alt, k_(B) T)) thin .  $
 
  Figure 2.4 is a sketch of $phi.alt^(upright(e q))(epsilon.alt)$ as a function of $epsilon.alt $. You should recognize the factor $epsilon.alt^(1 /2)$ as just the energy-dependence of the *density of states* of a free nonrelativistic particle moving in three-dimensional space.


  
==    Generalization to the case of many particles
  
   A generalization of the result just derived is as follows. Consider $n $ tagged particles of mass $m $ in the fluid. Let us assume that the concentration of these particles is vanishingly small, and that they do not interact with one another, and move independently of each other. Let $V =(v_(1) + v_(2) + ...+ v_(n))/n $ be the velocity of their center of mass. The PDF of $V $ is (using the same symbol $F^(upright(e q))$ as before, for convenience)
  
  $  F^(upright(e q))(V) = integral_(- infinity)^(infinity) d v_(1) ... integral_(- infinity)^(infinity) d v_(n) thin p^(upright(e q))(v_(1)) ... p^(upright(e q))(v_(n)) thin delta(V - frac(v_(1) + ...+ v_(n), n)) thin .  $
  
   Obviously, it is no longer very convenient to use the $delta $-function constraint to carry out one of the integrations, because the remaining ones get quite complicated as a result. What do we do? We know that "exponentiation converts addition to multiplication". The trick, therefore, is to convert the multiple integral to one that involves a _product_ of individual integrals. This is done by using the following well-known representation of the Dirac $delta $ function:
  
  $  delta(x) = frac(1, 2 pi) integral_(- infinity)^(infinity) d k thin e^(i k x) thin .  $
  
   Use this to show that
  
  $  F^(upright(e q))(V) =(frac(m n, 2 pi k_(B) T))^(1/2) exp(- frac(m n V^(2), 2 k_(B) T)) thin .  $
  
   What you have just established is a special case of the following important result: the PDF of a linear combination of independent Gaussian random variables is again a Gaussian. This kind of 'addition theorem' is common to a whole family of probability distributions called *Lévy alpha-stable distributions* or *stable distributions* for short, of which the Gaussian is a limiting case. In turn, this property leads to the celebrated *Central Limit Theorem* of statistics and its generalization to all stable distributions.
