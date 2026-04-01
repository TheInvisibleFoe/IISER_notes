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
  header-title: "Mach-Zehnder Interferometer",
  lang: "en",
)
#maketitle(
  title: "Spatial Light Modulation",
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


= Aim 
To measure linear retardance ($delta$) and optical rotation ($psi$) of a spatial light modulator (SLM) for different grey scale values.

= Materials
1. Laser source (655 nm)
2. Spatial Light Modulator (SLM)
3. 2 polarizers
4. Power meter
5. Computer with software for controlling the SLM and data acquisition
6. Neutral density filters (if needed to prevent damage to the power meter)
7. Glass Slide (for finding Brewster's angle)



= Theory
== Brewster's Angle
When light is incident on a surface at a specific angle, known as Brewster's angle, the reflected light is completely polarized perpendicular to the plane of incidence. This angle can be calculated using the formula:
$
theta_B = arctan(n_2/n_1)
$
where $n_1$ and $n_2$ are the refractive indices of the two media. For a glass-air interface, this angle is typically around 56 degrees. The transmitted light at this angle is polarized both parallel and perpendicular to the plane of incidence, which we discard for our measurements. By setting up our experiment at Brewster's angle, we ensure that the light interacting with the SLM is polarized in a known manner, allowing us to find the fast axis of the polarizer with which we can setup the experiment.

== Stokes Vectors
We generally represent light using plane waves, but to fully describe the polarization state of light in an efficient manner we can use Stokes vectors. Jones vectors are also used to represent polarization, but they are limited to fully polarized light. Stokes vectors, on the other hand, can represent both fully polarized and partially polarized light. A Stokes vector is a four-component vector that describes the intensity and polarization state of light. The components of the Stokes vector are defined as follows:
$
S = vec(I_H + I_V, I_H - I_V, I_P - I_M, I_R - I_L) := vec(I,Q,U,V)
$
where $I_H$ and $I_V$ are the intensities of horizontally and vertically polarized light, $I_P$ and $I_M$ are the intensities of light polarized at +45 degrees and -45 degrees, and $I_R$ and $I_L$ are the intensities of right-handed and left-handed circularly polarized light. These angles are defined with respect to the horizontal axis. The first component, $I$, represents the total intensity of the light, while the other three components ($Q$, $U$, and $V$) describe the polarization state. To generally describe fully polarized light, one can just use two components of the Stokes vector, which is used in the Jones vector representation. For partially polarized light, three components are needed to fully describe the polarization state. However, the total intensity component $I$ is needed to normalize the Stokes vector. Moreover, $I,Q,U,V$ are called the Stokes parameters, and they can be measured experimentally using polarizers and wave plates. 

== Mueller Matrices
The Mueller matrix is a 4x4 matrix that describes how the polarization state of light changes as it passes through an optical element. It relates the input Stokes vector to the output Stokes vector as follows:
$
S_"out" = M S_"in"
$
where $M$ is the Mueller matrix of the optical element. Each element of the Mueller matrix describes how the optical element affects the polarization state of light. For example, the first row of the Mueller matrix describes how the total intensity of the light is affected, while the other rows describe how the polarization state is changed. Here, we are interested in measuring the Mueller matrix of the SLM, which has both linear retardance and optical rotation. 

=== Mueller Matrix of a Linear Retarder
A linear retarder is an optical element that introduces a phase difference between two orthogonal polarization components of light. The Mueller matrix of a linear retarder can be expressed as:
$

M_"lin" = mat(
  1,0,0,0;
  0, cos^2 2theta + sin^2 2theta cos delta, sin 2theta cos 2theta (1 - cos delta), - sin 2theta sin delta;
  0,sin 2theta cos 2theta (1 - cos delta),sin^2 2theta + cos^2 2theta cos delta, cos 2theta sin delta;
  0,sin 2theta sin delta,-cos 2theta sin delta,cos delta
)
$
where $theta$ is the angle between the fast axis of the retarder and the horizontal axis, and $delta$ is the phase difference introduced by the retarder, which is called the linear retardance. 

=== Mueller Matrix of an Optical Rotator
An optical rotator is an optical element that rotates the polarization state of light by a certain angle. The Mueller matrix of an optical rotator can be expressed as:
$
M_"circ" = mat(
  1, 0, 0, 0;
  0, cos 2psi, -sin 2psi, 0;
  0, sin 2psi, cos 2psi, 0;
  0, 0, 0, 1;
)
$
One can see that the optical rotator does not affect the total intensity of the light, or the circular polarization component, but it does affect the linear polarization components. The angle $psi$ is called the optical rotation, and it describes how much the polarization state of light is rotated by the optical element. The middle $2 times 2$ block is just a rotation matrix that rotates the linear polarization components by an angle of $2psi$.

== Mueller Matrix of the SLM
The SLM can be modeled as a combination of a linear retarder and an optical rotator, which means that its Mueller matrix can be expressed as the product of the Mueller matrices of a linear retarder and an optical rotator:
$
M_"SLM" = M_"circ" M_"lin"
$
This means that the SLM introduces both linear retardance and optical rotation to the light passing through it. One can calculate $delta$ and $psi$ by measuring the output Stokes vector for different input Stokes vectors and using the above equations to solve for the unknown parameters.
If the incident beam on the SLM is horizontally polarised, i.e.
$
vb(S^((H))_"in") = mat(1;1;0;0)
$
then, the output of the SLM will be given by, 
$
vb(S^((H))_"out") = mat(
  1; 
  cos 2theta cos(2theta − 2psi) + sin 2theta cos delta sin(2theta − 2psi);
  sin 2theta cos(2theta − 2psi) − cos 2theta cos delta sin(2theta − 2psi); 
  sin(2theta − 2psi) sin delta
)
$
We make the incident beam horizontally polarised by setting up the experiment at Brewster's angle, which gives us the angle at which the reflected beam is completely polarized perpendicular to the plane of incidence. 
And, if the incident beam on the SLM is linearly polarised at $pi/4$ wrt the horizontal axis, i.e.
$
vb(S^((P))_"in") = mat(1;0;1;0)
$
then, the output of the SLM will be given by, 
$
vb(S^((P))_"out") = mat(
  1; 
  cos 2theta sin(2theta − 2psi) - sin 2theta cos delta cos(2theta − 2psi);
  sin 2theta sin(2theta − 2psi) + cos 2theta cos delta cos(2theta − 2psi); 
  -cos(2theta − 2psi) sin delta
)
$
Let us define
$
X:= vb(S^((H))_"out")[2] + vb(S^((P))_"out")[3] = (1 + cos delta) cos 2psi \
Y:= vb(S^((H))_"out")[3] - vb(S^((P))_"out")[2] = (1 + cos delta) sin 2psi \
$
Using these quantities we can express linear retardance $delta$ and optical rotation $psi$ as,
$
delta = arccos(sqrt(X^2 + Y^2) - 1) quad
psi = 1/2 arctan(Y/X)
$
These will be our working formulae for measuring $delta$ and $psi$ of the given SLM in this experiment.

= Analysis
The angles of the polarizers are given by the table,
#set align(center)
#table(
  columns: 3,
  align: center + horizon,
  stroke: none,
[Polarization],
[Polarizer 1 (in degrees)],
[Polarizer 2 (in degrees)],
[H],
[*102*],
[134],
[V],
[192],
[*224*],
[P],
[147],
[179],
[M],
[57],
[89],
)
#set align(left)
The entries in bold are the entries that we measured experimentally, while the other entries are calculated using the relations between the angles of the axis.

= Results and Analysis
The values of linear retardance $delta$ and optical rotation $psi$ were calculated using the measured intensities at 4 different grayscale values for the SLM. The values have been tabulated below:
#set align(center)
#table(
  columns: 3,
  align: center + horizon,
  stroke: none,
[Grayscale],
[$delta$ (in rad.)],
[$psi$ (in rad.)],
[0],
[0.5409656015],
[-0.2641733304],
[64],
[1.156926648],
[-0.1503495622],
[128],
[0.7247127361],
[-0.1994376603],
[255],
[1.950471056],
[-0.5583104993],
)
#set align(left)
The results have been plotted below (after rescaling grayscale values from $[0, 255]->[0, 1]$)
#figure(
  grid(
    columns: 2,
    gutter: 2mm,
    image("assets/linear_ret.png", width: 100%),
    image("assets/optical_rotation.png", width: 100%)
  ),
  caption: [Plots of $delta$ and $psi$ against different grayscale values]
)
= Error Analysis
We analyze the errors introduced in the results.  Using this, the uncertainty in the second component of the Stokes vector becomes,  $  Delta[S ]_(2) = abs(frac(2 I_(V),(I_(H)+ I_(V))^(2)))Delta I + abs(frac(2 I_(H),(I_(H)+ I_(V))^(2)))Delta I = frac(2 Delta I,(I_(H)+ I_(V)))  $
 Simularly, for the third component we have the uncertainty  $  Delta[S ]_(3) = = frac(2 Delta I,(I_(H)+ I_(V))) + frac(2 abs(I_(P)- I_(M))Delta I,(I_(H)+ I_(V))^(2))  $
 Since $X $ and $Y $ are linearly related to these components, we get the uncertainty in $X $ and $Y $ just by adding these uncertainities. From that, we obtain the uncertainty in $psi $ and $delta $.  #math.equation(block: true, numbering: none)[
$  psi = 1/2tan^(- 1)(Y/X) => frac(diff psi, diff X) - frac(Y, 2(X^(2)+ Y^(2)))quad frac(diff psi, diff Y) frac(X, 2(X^(2)+ Y^(2)))=> Delta psi = - frac(| Y | Delta X, 2(X^(2)+ Y^(2))) + frac(| X | Delta Y, 2(X^(2)+ Y^(2)))  $
]
 Similarly, if we do this for the linear retardance we get,  #math.equation(block: true, numbering: none)[
$  delta = cos^(- 1)(sqrt(X^(2)+ Y^(2))- 1)=> Delta delta = frac(| X | Delta X + | Y | Delta Y, sqrt(X^(2)+ Y^(2))sqrt(1 -(sqrt(X^(2)+ Y^(2))- 1)^(2)))  $
]


The errors in the measurements we propagated using the known working formulae. The least count of the current detector was $0.1 mu A$. After propagating these errors through the working formulae in `Sympy` we get the following error values:
#set align(center)
#table(
  columns: 3,
  align: center + horizon,
  stroke: none,
[Grayscale],
[$Delta delta$ (in rad.)],
[$Delta psi$ (in rad.)],
[0],
[0.101],
[0.015],
[64],
[0.037],
[0.014],
[128],
[0.075],
[0.015],
[255],
[0.071],
[0.047],
)
#set align(left)
Plots for $delta$ and $psi$ against grayscale values including the corresponding error bars have been shown below:
#figure(
  grid(
    columns: 2,
    gutter: 2mm,
    image("assets/linear_ret_err.png", width: 100%),
    image("assets/optical_rotation_err.png", width: 100%)
  ),
  caption: [Plots of $delta$ and $psi$ against different grayscale values (including error bars)]
)
= Sources of Error
1. The least count of the current detector was $0.1 mu A$, which introduced significant errors in the measurements of the intensities, especially for the lower grayscale values where the intensity was low.
2. The alignment of the optical components (polarizers, SLM, power meter) was not perfect, which could have introduced systematic errors in the measurements.
3. The SLM might not have been perfectly uniform across its surface, which could have introduced spatial variations in the measured intensities.
4. The SLM with one layer should not have an optical rotation, but we observed a non-zero value for $psi$, which could be due to twist in the liquid crystal layer which causes chiral effects. This could have introduced additional errors in the measurements of $delta$ and $psi$.

= Discussion and Conclusion
- The SLM is liquid crystal material sandwiched between two glass plates. The liquid crystal molecules are aligned in a certain way, and when an electric field is applied across the SLM, the orientation of the liquid crystal molecules changes, which in turn changes the polarization state of the light passing through. The linear retardance $delta$ is a measure of the phase difference introduced between the two orthogonal polarization components of light as it passes through the SLM. The optical rotation $psi$ is a measure of how much the polarization state of light is rotated by the SLM. The optical rotation might be due to the twist in the liquid crystal layer, which causes chiral effects. 
- There is a significant error in the measurements of intensity since the beam profile might not always be perfectly within the active area of the power meter, which has a finite size. 

= Results 
We have tabulated the results of our measurements for the SLM set at $0$, $64$, $128$ and $255$ grayscale values. We obtain highest retardance for the SLM set at $255$ grayscale, and the lowest retardance for the SLM set at $0$ grayscale. The optical rotation is lowest for the SLM set at $255$ grayscale.


#pagebreak()
#include "supplementary.typ"

// #show: appendix
// #include "appendix.typ"
// #pagebreak()
// #bibliography("refs.bib")
