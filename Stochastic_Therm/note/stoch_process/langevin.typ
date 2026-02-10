#import "../imports.typ": *

= Langevin Equations

A langevin equation is a type of stochastic differential equation that describes the evolution of a system under the influence of both deterministic and random forces. #td([Need to include projection methods to find langevin equations from microscopic mechanics. See Sekimoto])

An example of a langevin equation is the inertial motion of a particle in a fluid, where the particle experiences both viscous drag and random collisions with fluid molecules. This is called the *underdamped langevin equation*.

#definition("Underdamped Langevin Equation")[
  The underdamped langevin equation for a particle of mass $m$ moving in a potential $U(x)$, subject to viscous drag with coefficient $gamma$ and random thermal forces $wn$, is given by:
  $
    dv(ph,t) &= - gamma/m ph(x,t) - pdv(U(xh,t),x) + sqrt((2 gamma kb T)/m) wn  \
    dv(xh,t) &= ph(x,t)/m
  $
  where $wn$ is a Gaussian white noise term with zero mean and correlation function:
  $
    expval(wn(t))=0 quad;quad expval(wn(t') hat(xi)(t')) = delta(t - t')
  $
]
The diffusion coefficient $D = kb T\/gamma$ is related to the temperature $T$ and the drag coefficient $gamma$ via the fluctuation-dissipation theorem. It also can be seen, that $D$ must take this form to ensure that the system reaches thermal equilibrium, Boltzmann distribution, at long times. One can, in theory , solve the above equations to find the time evolution of the position and velocity of the particle, by finding the moments of the probability distribution function $p(x,ph,t)$. A much nicer and neater way to do this is to use the Fokker-Planck equation, which we will see later. If we use a generalized force,
with non conservative components, we obtain the *Kramers Equation*.

In, cases where the inertial effects are negligible compared to the viscous drag, especially for small particles in a fluid, we can simplify the underdamped langevin equation by neglecting the acceleration term, leading to the overdamped langevin equation.
#definition("Overdamped Langevin Equation")[
  In many cases, the inertial effects are negligible compared to the viscous drag, especially for small particles in a fluid. In such cases, we can simplify the underdamped langevin equation by neglecting the inertial term, leading to the overdamped langevin equation:
  $
    gamma dv(xh(t),t) = F(xh,t) + sqrt(2 gamma kb T) wn
  $
]