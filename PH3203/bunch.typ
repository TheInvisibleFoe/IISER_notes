#import "imports.typ":*
#let On = $hat(n)$
#let Oa = $hat(a)$
#let Oad = $hat(a)^dagger$
Photon Antibunching refers to a light field where the photon distribution is sub-poissonian.
And, we know that the variance and mean of the photon number operator #On are related to the second order correlation function 
according to the following relation
$
frac(var(On) - expval(On) , expval(On)^2) = g^((2))(0) - 1
$
When we say the distribution is sub-poissonian or super-poissonian, what we mean is that
$var(On) < expval(On)$ and $var(On) > expval(On)$ respectively. So, in case of antibunched photons,
we have sub-poissonian photon statistics, implying that 
$
g^((2))(0) < 1
$

The exact opposite scenario to this is called Photon Bunching, where we observe super-poissonian 
photon statistics, i.e. $var(On) > expval(On)$ or, in terms of the second order correlation function,

$
g^((2))(0) > 1
$

We also know, that the correlation function $g^((2))(0)$ is defined as, 
$
g^((2))(0) = expval(Oad Oad Oa Oa) / expval(On)^2
$
Which essentially corresponds to observing two photons at the detector simulatinously. For a coherent
photon state, we have $g^((2))(0) = 1$. Hence, for a bunched state there's a higher probability
of a detector observing two photons at once than that for a coherent state. The opposite is true 
for a antibunched state.
