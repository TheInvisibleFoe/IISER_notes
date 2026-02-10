#import "imports.typ":*

= Results and Analysis
We obtain the data for number of fringes shifted ($Delta m$) vs Pressure difference in the chamber ($Delta P$) for $5$ different sets of measurements. We plot the data obtained from the experiment and use a linear fit on the $Delta  m$ vs  $Delta P$ to obtain the slope $s$.

#figure(
  image("assets/MZI_plot.svg", width: 100%),
  caption: [Pressure vs Fringes Shifted Plot with Linear Fits]
)

 We then use the formula,
$
n = 1 + (s P lambda) / d
$
where 
- $P$ is the pressure at which, refractive index is to be calculated (we use $P = 760$ mm Hg).
- $n$ is the refractive index of air at pressure $P$.
- $lambda$ is the wavelength of the LASER used ($650$ nm in our case).
- $d$ is the length of the pressure chamber ($8 pm 0.1$ cm in our case).

The slopes obtained from the linear fits for the $5$ data sets are tabulated below:
Medium bold table header.


#table(
  columns: (0.4fr, 1fr, 1fr),

  table.header[Set][Slope][Error in Slope],
  [Set 1],[0.042708],[0.000358],
  [Set 2],[0.041042],[0.000329],
  [Set 3],[0.039470],[0.000291],
  [Set 4],[0.039297],[0.000458],
  [Set 5],[0.038703],[0.000335],

)
Using these slopes, we calculate the refractive index of air at standard atmospheric pressure ($760$ mm Hg) using the formula mentioned above. The results are tabulated below:

#table(
  columns: (0.4fr, 1fr, 1fr),

  table.header[Set][Refractive Index][Error in Refractive Index],
  [Set 1],[1.000264],[0.000006],
[Set 2],[1.000253],[0.000006],
[Set 3],[1.000244],[0.000005],
[Set 4],[1.000243],[0.000006],
[Set 5],[1.000239],[0.000006],
)
The errors in the refractive index values are calculated by propagating the error in the slope obtained from the linear fit. 
$
delta n = (delta s P lambda) / d + (s P  delta d) / d^2 + (s lambda delta P) / d
$
The average refractive index of air at standard atmospheric pressure is calculated by using the formula of generic pooled mean with weights as the inverse of the individual errors. The average refractive index of air at standard atmospheric pressure is obtained as:
#set align(center)
#rect(
  nonum($n(P = 1 "atm") = 1.000248 pm 0.000006$)
)
#set align(left)
