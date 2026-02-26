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

== Sources of error
+ The Michelson Interferometer is very sensitive to vibrations and air currents, which can cause the interference pattern to shift and make it difficult to obtain clear fringes. This can lead to errors in counting the fringe shifts.
+ The beam splitter causes inadvertent reflections, which can interfere with the main beams and cause additional fringes that can be mistaken for the main interference pattern. This can again lead to errors in counting the fringe shifts.
+ The quarter waveplates may not be perfectly aligned, which can affect the polarization state of the light and lead to errors in the observed fringe shifts. This can be mitigated by carefully aligning the quarter waveplates and ensuring that they are at the correct angles.
+ One of the quarter waveplates is more tilted with respect to the vertical axis, which causes more wavefronts to interfere with each other and can lead to anomalous fringe shifts. This can be mititgated by fixing the quarter waveplate and not rotating it, and instead rotating the other quarter waveplate to vary the angle $beta$.
+ Impurities and scratches on the beam splitter distort fringe visibility and can lead to errors in counting the fringe shifts. This can be mitigated by using a clean and high-quality beam splitter.

= Conclusion

The Pancharatnam-Berry phase is a geometric phase that arises in polarized light when it undergoes a cyclic evolution in the polarization state. In this experiment, we used a Michelson Interferometer to demonstrate the presence of the Pancharatnam-Berry phase in polarized light. We observed that the fringe shift in the interference pattern is proportional to the angle $beta$ of the second quarter waveplate. The proportionality constant was found to be $1.90 pm 0.04, 2.14 pm 0.13$ and $2.17 pm 0.03$ for the three data sets, which is in good agreement with the theoretical prediction of $2$.

= Discussion
One way to improve the experiment would be to use a more stable setup that is less sensitive to vibrations and air currents. This could involve using a Mach Zender Interferometer instead of a Michelson Interferometer, as the Mach Zender Interferometer is less sensitive to vibrations and air currents. Additionally, using a more stable platform for the interferometer and isolating it from external vibrations could also help improve the results. However, this would cause an issue, we would require two more quarter waveplates. Two pairs of quarter waveplates have to be in sync with each other, since the light has to virtually retrace its path after hitting the mirror in the Mach Zender Interferometer, which can be difficult to achieve in practice. The Michelson Interferometer, on the other hand, only requires one pair of quarter waveplates, where the light already retraces its path after hitting the mirror, which makes it easier to set up and align. Thus, while using a Mach Zender Interferometer could potentially improve the stability of the experiment, it would also introduce additional complexities in terms of alignment and synchronization of the quarter waveplates.

One could also use better quarter waveplates, ones with lower reflecton coefficients and better quality, to reduce the anomalous fringe shifts caused by the tilted quarter waveplate. 

One anomaly that we observed was that the fringe shifts were not completely linear with respect to the angle $beta$ of the second quarter waveplate. Periodically, the fringes would move in the opposite direction slightly before continuing to shift in the expected direction. However, these slight variations are not resolvable in the plot since these happen periodically and are smoothened out. We still do not know why this happens, but it could be due to the fact that the second quarter waveplate is more tilted with respect to the vertical axis.
