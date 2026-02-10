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

= Aim

In this experiment, we will use the Mach-Zehnder Interferometer to:

+ Demonstrate the formation of parallel interference fringes.
+ Measure the refractive index of light.
+ By forming circular interference fringes, we will attempt to show that the fringes at each detector are exactly out of phase.

= Materials required

- 650 nm (red) laser
- 2 plate beamsplitters
- 2 adjustable mirrors
- 2 plano-convex/convex lenses
- Optical power meter
- Optical table, screws, and driver
- Flat cardboard surfaces to act as detectors

= Theory

#figure(image("assets/mzisetup.png", width: 60%), caption: [Mach-Zehnder Interferometer. Source: Laboratory Manual])

The Mach-Zehnder Interferometer, as depicted in the diagram above, is a device that is used to derive the relative phase shift variations between two beams which have been derived from a single source via splitting in a beam-splitter.
In comparison to the Michelson Interferometer, here each beam traverses a path only once. As a result of this, the Mach-Zehnder Interferometer is more stable to phase perturbations. 

- *Reflection*: If light reflects off a medium with a higher refractive index, it undergoes a phase shift of $pi$. If it reflects off a medium with a lower refractive index, there is no phase shift.
- *Transmission*: There is no phase shift on transmission.


In the experiment, we will be using a $50-50$ plate beamsplitter with a dielectric coating on only one side. Due to this, the phase shifts induced depends on the face of the beamsplitter that the beam approaches:

#figure(
  image("assets/bs.png", width: 20%),
  caption: [Phase shifts on reflection and transmission at a beamsplitter. We can 
  see that the phase shift depends on the side from which the beam approaches the beamsplitter.
   Source: The Internet],
)

- If the beam approaches the face with the dielectric coating from air, the phase shift is given by $pi$. The beam that is transmitted passes through the glass behind the dielectric and is not phase shifted.
- If the beam approaches the face with the dielectric coating from glass, the phase shift is given by $0$. The beam that is transmitted passes through the dielectric coating and is not phase shifted.

There is a chance of reflection when the beam passes through the glass-air boundary, but the probability of a photon getting reflected at this boundary is negligible compared to the dielectric surface if the beam splitter surface is clean. To further simplify our analysis, we note that the dielectric coating on the two beamsplitters in the setup are on the opposite sides, and that the beam is incident at the same angle at both the beamsplitters. The latter condition ensures that the optical path of beams traversing the beamsplitter material are equal, and that the phase shift accumulated is the same.

Let us refer to the two beams emerging from the first beamsplitter as shown in the figure as "upper" and "lower" beams. We can now follow the path of each beam as it traverses the interferometer, and note down the phase shifts accumulated. Let the path lengths through air be $l_1$ and $l_2$, respectively.

#figure(
  table(
    columns: 5,
    [*Beam Path*], [*BS-1*], [*Mirror*], [*BS-2*], [*Total Phase Shift*],
    [Upper Beam $-->$ Detector A], [$pi$], [$pi$], [$t$], [$2 pi + t$],
    [Upper Beam $-->$ Detector B], [$pi$], [$pi$], [$2 t$], [$2 pi + 2 t$],
    [Lower Beam $-->$ Detector A], [$t$], [$pi$], [$pi$], [$2 pi + t$],
    [Lower Beam $-->$ Detector B], [$t$], [$pi$], [$t$], [$pi + 2 t$],
  ),
  caption: [Phase shifts accumulated by each beam],
)

Note from the above table that the beams at detector A are exactly in phase, while the beam at detector B are exactly out of phase. Here, $t$ is the optical distance traversed on one crossing of a beamsplitter. Considering the path length differences on each arm, we have the following phase difference at detector A:

$
  delta_A = 2 pi ( (l_1 - l_2)/lambda )
$

And the phase difference at detector B is given by:

$
  delta_B = 2 pi ( (l_2 - l_1)/lambda ) + pi
$

Where $lambda$ is the wavelength of the light used in the experiment. Now, one may introduce a pressure chamber in one of the arms to change the effective optical path traversed, and convert a destructive interference pattern into a constructive one. Since we are using collimated laser source in our experiment, the fringes will appear as parallel fringes. We place a lens(*possibly of high focal length*) in front of each detector to magnify the interference pattern on the screen. The interference pattern formed on each detector screen should be complementary to each other, i.e, when one screen has a bright fringe at the center, the other should have a dark fringe at the center.

== Dependence of the refractive index of air on pressure

The relation between the refractive index of a gas and the density of the gas is given by the Lorentz-Lorenz relation:

$
  (n^2 - 1)/(n^2 + 2) = (4 pi)/3 N alpha = sum_i R_i rho_i
$

Where $n$ is the refractive index, $N$ is the number density, $alpha$ is the mean polarizability, $R_i$ is the density independent specific refraction of the i-th gaseous component, and $rho_i$ is the partial density of the i-th gaseous component. However, in our experiment, we are only dealing with air, which is a mixture of gases. We can define an effective specific refraction $R$ and density $rho$ for air as a whole. Under standard conditions, the refractive index of air is $n approx 1$. As a result of this, we can make the following approximations:

- $n^2 + 2 approx 3$
- $n^2 - 1 approx 2(n - 1)$

Substituting these into the Lorentz-Lorenz equation, the relation simplifies to:

$
  n - 1 approx eta rho
$
where $eta$ is a constant of proportionality and $rho$ is the density of air. 
This relation essentially tells us that the refractivity ($n-1$) is proportional to the density. We know that under the ideal gas approximation:

$
  rho prop P/T
$

Where $P$ is the pressure, and $T$ is the temperature. Putting this in, we get:

$
  (n_f - 1)/(n_i - 1) =  (P_f T_i)/(P_i T_f)
$

Where $n_f$ is the refractive index at pressure $P_f$ and temperature $T_f$, and $n_i$ is the refractive index at pressure $P_i$ and temperature $T_i$.
Now, on changing the pressure in the cell $Delta P = P_f - P_i$, we have some change in the refractive index $Delta n = n_f - n_i$. On introducing the pressure chamber in one arm of the interferometer, the optical path length changes by:
$
  delta = Delta n d = Delta m lambda
$
Where $d$ is the length of the air pressure cell, and $Delta m$ is the number of fringes shifted on changing the pressure by $Delta P$. The last equality comes from the fact that each fringe shift corresponds to a change in optical path length of $lambda$. 
From this, at constant temperature, we can find:
$
  n_f = 1 + (Delta m lambda P_f)/( d Delta P )
$
We expect this slope to be a consistent value over the range of our experiment, as the relationship between refractive index and pressure should be linear(*Under the assumption that $Delta P$ is small enough for the linear approximation to hold*)

Here, we have assumed that the refractive index in vacuum is $n = 1$.

== Verifying that the fringes on the detectors are out of phase

When a lens is inserted in front of the collimated beam from the laser, the plane wave becomes a diverging spherical wave. In effect, now we will be carrying out the interferometry on two point sources that are separated by some distance that is related to the path length difference on both the paths and the alignment tilt.

The interference pattern formed on the detector screens will be a series of concentric rings. The center of these rings corresponds to the on-axis point, i.e, the point where the optical path length difference is zero. The center of the rings has a phase difference dictated by the on-axis path length difference between the virtual point sources. As a result, due to the complementarity of the detectors in the interferometer we should be seeing a dark center on one of the detectors, while we spot a bright center on the other.

#subpar.grid(
  figure(image("assets/fringe1.jpg",width:60%), caption: [
    Concentric circular fringes formed on one of the detectors.
  ]), <a>,
  figure(image("assets/fringe2.jpg",width:60%), caption: [
    Concentric circular fringes formed on the other detector.
  ]), <b>,
  columns: (1fr, 1fr),
  caption: [We see that the concentric fringes formed on both detectors are in phase, which contradicts the expectation that they should be out of phase. The center fringe on detector (a) is bright, while that on detector (b) is also bright],
  label: <full>,
)

= Data Analysis

Five sets of data were collected for the refractive index of air as a function of pressure. The data is shown in the appendix. The data collected is number of fringe shifts ($Delta m$) with respect to initial fringe versus pressure measured by the gauge. One thing to be noted is that the pressure gauge measures the gauge pressure, i.e, the pressure difference with respect to atmospheric pressure. Thus, to get the absolute pressure inside the chamber, we need to add atmospheric pressure ($760$ mm Hg) to the measured gauge pressure.

The length of the air pressure cell was measured to be $d = 8 c m$.

The least counts of the instruments used to measure are:

- Length: $0.1 c m$, used to measure the length of the air pressure cell.
- Pressure: $2$ mm Hg.

Uncertainty in the value of wavelength of the laser was estimated based on the least significant digit of the stated value: $1 n m$. The least count of the fringe shift measurement was determined to be the maximum possible error: $0.5$. This is because:
+ We do not have a method to determine the contrast in the fringes formed.
+ We can definitely atleast differentiate between the center of a dark fringe and the center of a bright fringe. This corresponds to a fringe shift of $0.5$.

== Error propagation

According to , we have the following relation:

$
  (delta (Delta n))/(Delta n) = (delta (Delta m))/(Delta m) + (delta (lambda))/(lambda) + (delta (d))/(d) + (delta (P))/P
$

For the maximum relative error in $Delta n$. Putting in the values (assuming arbitrary precision in the atmospheric pressure value used and the smallest resolved fringe shift of $Delta m = 1$), we determine:

$
  (delta (Delta n))/(Delta n) times 100 approx 51.7%
$

Note that the dominant source of error in the uncertainty in fringe shift, contributing $50%$ relative error. Also note that the coherence length of the laser diode used is much larger than the optical path traversed by the beams from the diode to the detectors, and thus interference pattern quality and stability is not affected.


#include "analysis.typ"

= Discussion

== Sources of error

Since refractivity of air is on the order of $10^(-6)$, the experiment is a delicate one and is susceptible to a number of random and systematic errors that will be discussed below:

+ *Adiabatic heating*: Introduction of air into the pressure chamber causes adiabatic heating of the air inside. As a result, the temperature inside the chamber is slightly higher than the ambient temperature. Since refractivity is inversely proportional to temperature, this causes a systematic underestimation of the refractive index of air.

+ *Environmental changes in the composition of air*: The composition of the air in the room is subject to changes, as experimenters breathing near the setup can increase the concentration of carbon dioxide and water vapor locally. Since all these components have different specific refractivities, error is introduced in the calculated value of the refractive index.
+ *Geometric errors*: The alignment of the interferometer is a source of error, which can cause the fringes to be non-parallel. In the case of circular fringes, misalignment can cause the center of the rings to shift, or concentric rings to distort.
+ *Fringe counting error*: The dominant source of error in the experiment is, as mentioned before, the uncertainty in fringe shift counting. This can be mitigated or atleast estimated more conservatively if we have access to an electronic system to determine contrast on the interference pattern.
+ *Secondary reflections*: Observation of faint secondary fringes due to reflections from the surfaces of the beamsplitters and lenses can cause contrast reduction.

+ *Sphygmomanometer error*: The pressure gauge relies on a two way valve system to measure the pressure difference. As a result, the pressure fluctuates at lower pressures, causing uncertainty in the pressure measurement.

== Inability to observe complementarity

In carrying out the last aim of the experiment, it was noticed that the phase inversion expected on the center of the ring fringes on each detector was not reliably visible. While no single reason could be isolated, here are some possible reasons for this:

+ *Plate beamsplitters are not ideal*: Since we are using a laser diode, the light is atleast slightly polarized. This, combined with the non-ideal nature of the beamsplitters make the phase shift on air-dielectric reflection a function of polarization, angle of incidence, and coating quality. This partial phase shift induced will result in the fringes not being exactly complementary.

+ The usage of two lenses also increases the effect of jitters on the interference pattern. This can destabilize the patterns and make the phase inversion difficult to resolve.
+ Asymmetric splitting at the second beamsplitter can cause a differential phase visibility on the two detector screens. Combined with the comparitively low resolution of the human eye and the low contrast, the makes the center spot difficult to resolve.
+ Speckle effects due to spatial coherence of the diode laser may also reduce resolvability of the center rings.


= Conclusion

The refractive index of air was determined to be $1.000248 plus.minus 0.000006$. This is in good agreement with the accepted value of $1.000293$. Spherical fringes were obtained, but a demonstration of the complementary nature of the center spot was not reliably shown.


