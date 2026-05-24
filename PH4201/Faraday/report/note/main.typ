#import "../src/lib.typ": *
// Typst does not support global variables, so for now we import
// everything we need into an import file and import it here and
// for all subfiles.

// Some Macros are also defined in the import file.
#import "imports.typ": *

#show: codly-init.with()
#codly(languages: (python: (name: "Python", color: rgb("#006699"))))

// No idea what this does, but it seems fancy.
#show "Typst": fancy-typst
#show "LaTeX": fancy-latex

// Next line HAS to be HERE for ctheorems to work properly
#show: thmrules

// Document type for this template
#show: tuw-thesis.with(
  header-title: "Pancharatnam Phase",
  lang: "en",
)
#maketitle(
  title: "Measurement of Verdet Constant and Verification of Malus' Law",
  thesis-type: [PH4201: Adv. Optics Lab Report],
  authors: (
    (
      name: "Debayan Sarkar",
      email: [22MS002],
      supervisor: [],
    ),
      (
      name: "Sabarno Saha",
      email: [22MS037],
      supervisor: [],
    ),
      (
      name: "Diptanuj Sarkar",
      email: [22MS038],
      supervisor: [],
    ),
 
  ),
)

// #show table.cell.where(y: 0): set text(weight: "medium")
// Bold titles.
// #show table.cell.where(x: 1): set text(weight: "bold")

#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)

#set table(
  fill: (_, y) => if calc.odd(y) { rgb("EAF2F5") },
  stroke: frame(1pt + rgb("21222C")),
)

#import "@preview/ilm:1.4.2": *
#import "imports.typ":*

#set text(lang: "en")


= Aim
- To measure the Verdet Constant by observing how the plane of polarisation varies as we increase the magnetic field in a solenoid.
- To verify Malus's law 

= Materials required
+ Laser source
+ Electromagnet
+ Photodiode Detector
+ Linear Polarisers

// #include "theory.typ"

#include "stuff.typ"
#pagebreak()
#include "results.typ"
= Sources Of Error
Sources of error for this experiment can be:
+ Non-uniform Magnetic Field: The experiment assumes that the magnetic field is uniform throughout the material. In reality, it is not perfectly uniform, which introduces error in the measurements.
+ Non-monochromatic Light: If the light is not monochromatic, different frequency components experience different rotations (due to different responses of RCP and LCP modes). Hence, the incident light should ideally be monochromatic.
+ Thermal Fluctuation: The Verdet constant and material properties can be temperature dependent. Thermal fluctuations can therefore lead to experimental errors.
+ Alignment Issue: If the laser is not properly aligned to pass horizontally through the medium, some intensity may be lost. This can lead to incorrect readings in the photodetector.
+ Imperfect Polariser: If the polarisers are not ideal, the light may not be perfectly polarised. This introduces noise and affects the accuracy of angle measurements
+ Reported Values: The length of the solenoid and the number of turns per unit length are also important parameters in the working formula. These values are provided by the manufacturer and may have some error associated with them, which can affect the final value of the Verdet constant obtained from the experiment.
+ Verification Of Malus' Law: The verification of Malus' law done by us, is technically not perfect, since we have not measured over a full period of the cosine squared function. Hence, we are only verifying the small angle behaviour of the cosine squared function, which is a quadratic dependence. 
= Discussion and Conclusion
In this experiment, we investigated the Faraday effect in flint glass and verified Malus’ law through intensity measurements. It was observed that the angle of rotation of the plane of polarisation increases linearly with the applied magnetic field, as expected theoretically. 

The Verdet constant was experimentally determined to be
$
V = (5.647 plus.minus 1.270) "rad" "Tesla"^(-1) m^(-1)
$

In the second part, the variation of transmitted intensity with current was studied. The log-log analysis showed a power-law dependence with exponent $approx 2.0596 plus.minus 0.0003$, confirming the quadratic relationship predicted by Malus’ law under small-angle approximation.

Thus, the experiment successfully validates both the linear dependence of Faraday rotation on magnetic field and the quadratic dependence of transmitted intensity on the rotation angle
= Supplementary Data
#include "supplementary.typ"