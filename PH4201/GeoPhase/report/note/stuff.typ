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

In this experiment, we will use the Michelson Interferometer to demonstrate the Pancharatnam-Berry phase in polarized light. 

= Materials required

1. Collimated Laser Source(wavelength: $650$ nm)
2. Two Quarter-Wave Plates and one linear polariser
3. Two mirrors
4. Beam Splitter
5. Biconvex Lenses





#include "theory.typ"


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


