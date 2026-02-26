#import "imports.typ":*

= Results and Analysis

We used three different data sets to analyze the relationship between the fringe shift and the angle $beta$ of the second quarter waveplate. The last data set was taken by switching the positions of the two quarter waveplates, which should not affect the results as the Pancharatnam-Berry phase is a geometric phase and does not depend on the specific path taken by the light. It should also not change the dynamical phase, since the optical elements are the same, just in a different order. The reason for this is because the second QWP is more tilted with respect to the vertical axis. It also had a higher reflection coefficient, which causes more wavefronts to interfere with each other. And moving the second QWP to the first position causes the wavefronts to shift anomalously and the fringe shift is more erroneous. 

One can also see this from the plot, where the slope fit error is lower for the last data set compared to the first two data sets. The results from all three data sets are in good agreement with the theoretical prediction of a slope of $2$ for the fringe shift vs $beta$ plot, confirming the presence of the Pancharatnam-Berry phase in our experimental setup.

#figure(image("assets/fsb_1.png", width: 55%), caption: [Fringe shift vs $beta$ for Data Set 1. The slope of the fit is $1.90 pm 0.04$, which is in good agreement with the theoretical prediction of $2$.])
#figure(image("assets/fsb_2.png", width: 55%), caption: [Fringe shift vs $beta$ for Data Set 2. The slope of the fit is $2.14 pm 0.13$, which is in good agreement with the theoretical prediction of $2$.])
#figure(image("assets/fsb_rev.png", width: 55%), caption: [Fringe shift vs $beta$ for Data Set 3. The slope of the fit is $2.17 pm 0.03$, which is in good agreement with the theoretical prediction of $2$.])
#figure(image("assets/fsb_all.png", width: 55%), caption: [Fringe shift vs $beta$ for all three data sets. The slopes of the fits are $1.90 pm 0.04$, $2.14 pm 0.13$, and $2.17 pm 0.03$ for Data Sets 1, 2, and 3 respectively, all of which are in good agreement with the theoretical prediction of $2$.])

= Error Analysis

Since the theoretical prediction is a slope of $2$ for the fringe shift vs $beta$ plot, we can calculate the percentage error for each data set using the formula:
$
  delta_1 &= abs((1.90 - 2) / 2)  100 = 5% \
  delta_2 &= abs((2.14 - 2) / 2)  100 = 7% \
  delta_3 &= abs((2.17 - 2) / 2)  100 = 8.5% 
$

== Maximum possible error
The maximum possible error in the slope can be calculated using the least count. The least count of the angle $beta$ is $2^degree$, which is approximately $0.035$ radians. Since the least count of the fringe shift is $1$. The error calculation,
$
  delta_max &= sqrt(((delta n)/n)^2 + ((delta beta)/ beta)^2) approx 1.003  
$
The minimum $n$ is $1$ and the minimum $beta$ is $5.4$ radians. Thus the maximum possible error in the slope is approximately $1.003$.