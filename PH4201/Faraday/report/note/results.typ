#import "imports.typ":*
= Results
== Measurement of Verdet Constant
The values of Verdet constant obtained from each dataset were calculated by fitting the measured data linearly. The obtained values have been shown in the plot below

// #set align(left)
#figure(
  grid(
    columns: 1,
    gutter: 2mm,
    image("assets/verdetplot.png", width: 90%),
  ),
  caption: [Plot $psi$ vs $B$ to obtain the Verdet Constant $V$ for 3 different sets of data]
)
The average value of Verdet Constant obtained from the three sets is 
$
V_"avg" = 5.647  "rad" "Tesla"^(-1) m^(-1)
$
#pagebreak()
== Verification of Malus' Law
We did a linear fit on the loglog plot of Magnetic field vs Intensity as shown in the figure below
#figure(
  grid(
    columns: 1,
    gutter: 2mm,
    image("assets/malus.png", width: 90%),
  ),
  caption: [loglog plot of the Current through the solenoid and the detected Intensity]
)
As we can see the average slope for the two data sets is $m_"avg" = 2.0596$, which shows quadtratic behaviour, consitent with small angle behaviour of the cosine squared function.
= Error Analysis
== Error in Verdet Constant
From the standard deviations for the linear fits, the error for the average value of $V$ was obtained to be 
$
Delta V_"avg" &= 1/3 sqrt((Delta V_1)^2+(Delta V_2)^2+(Delta V_3)^2) \
&= 0.007 "rad" "Tesla"^(-1) m^(-1)
$
From the working formula, the expression for the maximum permissible error in $V$ is given by
$
(Delta V) / V &= abs((Delta B) / B) + abs((Delta psi) / psi) \
&= abs((Delta  I)/I) + abs((Delta psi_"deg") / psi_"deg") \
&= 0.01/0.4 + 0.1/0.5 = 0.225
$
Hence, accounting for the maximum permissible error, the value we report the value of the Verdet Constant for the given setup to be
$
V = (7.096 plus.minus 1.270)  "rad" "Tesla"^(-1) m^(-1)
$
== Error in the Malus' Law exponent
We can obtain the error in the average slope of Malus' Law can be calculated to be 
$
Delta m_"avg" = 1/2 sqrt((Delta m_1)^2 + (Delta m_2)^2) approx 0.0003
$

