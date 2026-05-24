#import "imports.typ":*
// #set text(lang: "en")

// #show: ilm.with(
//   title: [PH4201 Experiment 1: \ Mach-Zehnder Interferometer],
//   author: "Diptanuj Sarkar, 22MS038, Group B3",
//   date: datetime(year: 2026, month: 02, day: 2),
//   abstract: [
//     Mach-Zehnder Interferometer is a relatively simple optical instrument that utilizes division of amplitude interferometry.
//     In this experiment, we will use the Mach-Zehnder Interferometer to demonstrate the formation of interference fringes, measure the refractive index of light, and attempt to show that the fringes at each detector are exactly out of phase.
//   ],
//   figure-index: (enabled: true),
//   table-index: (enabled: true),
//   listing-index: (enabled: true),
// )
= Theory
== Linearly Polarised Light as a superposition of Circularly Polarised Components
Linearly polarised light travelling along the x-direction polarised along the y-direction can be written as a superposition of left and right circularly polarised light as:
$
vb(E)(x, t) = vb(E)_r (x, t) + vb(E)_l (x, t)
$
where,
$
vb(E)_r (x, t) = mat(0; A/2 cos(omega (t - (n x)/c)); A/2 sin(omega (t - (n x)/c))) \
vb(E)_l (x, t) = mat(0; A/2 cos(omega (t - (n x)/c)); - A/2 sin(omega (t - (n x)/c)))
$
Here $n$ is the refractive index for each of these polarisations. However, it's possible for the polarisations to be different for each of the polarisation states. Let's say the refractive indices for the RCP and LCP states are $n_r$ and $n_l$. Then, at some $x = x_0$, the electric field is given by,
$
vb(E)(x, t) = mat(0; A cos(omega (t - (n_r + n_l)x_0/(2c)) )cos(omega (n_r - n_l)x_0 / (2c)); A cos(omega (t - (n_r + n_l)x_0/(2c) ))sin(omega (n_r - n_l)x_0 / (2c)))
$
So the plane of polarisation now makes an angle $psi$ with the y-axis, which is given by
$
psi = arctan(E_z / E_y) = (omega (n_r - n_l)x_0) / (2c) = (pi (n_r  - n_l) D) / lambda
$
where we have replaced $x_0$ with $D$ to denote the distance travelled by light in this bifringent material. $lambda$ is the wavelength of the beam. As we can see, if $D >> lambda$, then even for small values of $n_r - n_l$ we can see significant rotations in the plane of polarisation of the input light beam.
== Magnetic Circular Birefringence
For a Solenoid with Magnetic Field $B$ and length $L$, the rotation of the plane of polarisation is given by 
$
psi = V L B
$
where $V$ is the Verdet Constant. Using this equation, by measuring $psi$ for different values of $B$, we can measure the value of the Verdet Constant for a given solenoid.
== Malus' Law
Consider a Linearly polarised light beam passing through a linear polariser that makes an angle $theta$ with the plane of polarisation of the incident wave. Then, the Electric Field of the transmitted beam is given by:
$
E_"out" = E_"in" cos(theta)
$
Since Intensity $I prop E^2$, we then have
$
I_"out" = I_"in" cos^2(theta)
$
This equation is Malus' Law. We can verify this by measuring the intensity of the trasmitted beam through the second polariser for different values of $theta$.
= Data
We obtained 3 sets of data for the determination of the Verdet Constant, and two sets of data for verification of Malus' Law. The data tables have been included in the supplmentary section at the end of the report.

Here are a few important parameters for our experiment:
- $lambda$ = 650 nm
- $L = 10 c m$
- Number of turns per unit length = 167.2 turns/cm

