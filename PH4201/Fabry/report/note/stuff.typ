#import "imports.typ": *
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
- To measure the etalon distance of the Fabry Perot cavity using the interference pattern of a laser beam.
- To measure the wavelength of the laser beam using the interference pattern of the Fabry Perot cavity.
- To measure the finesse of the Fabry Perot cavity.

= Theory
The Fabry Perot Interferometer is an optical device that consists of two parallel, partially reflecting mirrors. When a beam of light is incident on the interferometer, it undergoes multiple reflections
between the mirrors, leading to the formation of an interference pattern. The interference pattern is a result of the constructive and destructive interference of the multiple reflected beams.

Consider a point source of light that hits the first mirror of the Fabry Perot Interferometer. Both mirrors have the same reflectance $r$ and transmittance $t$. The reflected light undergoes multiple reflections between the two mirrors before eventually being transmitted through the second mirror. The transmitted light from the second mirror can be observed as an interference pattern on a screen placed behind it. Suppose the incident beam $vb(E_i) = E_i e^(i omega t)$. After the first time, the first beam is transmitted as $vb(E_t) = t^2 E_i e^(i omega t)$. After each reflection and transmission, the electric field of the beam can be expressed as follows:
$
  E_(0 r) = t^2 E_i e^(i omega t) \
  E_(1 r) = r^2 t^2 E_i e^(i omega t + phi) \
  E_(2 r) = r^4 t^2 E_i e^(i omega t + 2 phi) \
  dots.v \
  E_(n r) = r^(2n) t^2 E_i e^(i omega t + n phi)
$
After summing up all the contributions, we get the total transmitted electric field as, an infinite geometric series:
$
  E_t = t^2 E_i e^(i omega t) sum_(n=0)^infty r^(2n) e^(i n phi) \
  = t^2 E_i e^(i omega t) / (1 - r^2 e^(i phi))
$
Then the reflectivity $R = r^2$ and the transmittitivity $T = t^2$. The intensity of the transmitted light can be calculated as:
$
  I_t = |E_t|^2 = I_i T^2 / (1 + R^2 - 2 R cos phi)
$
where $I_i$ is the intensity of the incident light. The phase difference after passing through the interferometer with one round trip is $phi$. This can be simplified further into,
$
  I_t = I_i / (1 + F sin^2(phi / 2))
$
where $F = 4R/(1-R)^2$ is the coefficient of finesse. The intensity of the transmitted light is maximum when $phi = 2n pi$ and minimum when $phi = (2n + 1) pi$. The phase difference $phi$ can be expressed as,
$
  phi = (4 pi d ) / (lambda cos theta)
$
where, $d$ is the distance between the two mirrors, $theta$ is the angle of incidence of the light beam, and $lambda$ is the wavelength of the light. Here we have assumed that the refractive index of the medium between the mirrors is 1. The $m^"th"$ circular fringes follows the equation
$
  m lambda = 2 d cos theta
$
Let us consider the radius of the $m^"th"$ circular fringe to be $chi_m$. Then, we get $tan(theta) = chi_m / D$ where $D$ is the distance between the screen and the point source. For small angles, we can approximate $tan(theta) approx theta$. Therefore, we get the equation for the radius of the $m^"th"$ circular fringe as,
$
  chi^2_m = (m lambda D^2) / d
$
where we have used the fact that $cos^2(theta) = 1/(1 + tan^2(theta))$ and an appropriate taylor expansion for small angles.

= Data
Here are some important parameters of the experiment:
1. *Least count of the Vernier Callipers used: * 0.01 cm
2. *Distance between the screen and the lens source: * 85.8 cm
3. *Wavelength of the laser beam: * 655 nm
4. *Focal length of the convex lens used: * 1.9 cm
5. *Distance from the point source to the screen: * 83.9 cm

We repeated the experiment again under different screen positions to get better data. The parameters of the second reading are in the supplementary data section. Keeping the parameters same, we obtain a set of readings for a different LASER beam. The results are shown below.

= Results and Errors

For both the data sets, we plot $chi^2_m$ against $m$ and perform a linear fit to the data. The slope of the linear fit gives us the value of $lambda D^2/d$. Using this, we can calculate the value of $d$ for both the data sets. We can also calculate the average value of $d$ using a weighted average method.
#figure(
  image("assets/redfit.png", width: 80%),
  caption: [Plot of $chi^2_m$ against $m$ for the red laser beam with linear fit. Both the linear fits are parallel to each other, which shows that the data is consistent.],
)
The obtained value $d_1$ and $d_2$ are,
$
  d_1 = ((83.9)^2 times 655 times 10^(-7)) / (2.93) = 1.57 "mm" \
  d_2 = ((82.6)^2 times 655 times 10^(-7)) / (2.923) = 1.53 "mm"
$
The errors in fitting account for the errors in $d_1$ and $d_2$.
$
  sigma_d_1 = 0.015 "mm" \
  sigma_d_2 = 0.06 "mm"
$
The average value of $d$ and the average error are calculated as,
$
  d = 1.57 pm 0.04 "mm"
$

We then repeat the same procedure for the green laser beam and then use the value of $d$ to find the wavelength of the green laser beam.
#figure(
  image("assets/greenfit.png", width: 80%),
  caption: [Plot of $chi^2_m$ against $m$ for the green laser beam with linear fit.],
)

The wavelength was calculated to be
$
  lambda_g = (d times "slope" ) / (D^2) = 537 "nm"
$
The error in the wavelength was calculated to be,
$
  sigma_lambda_g = lambda_g sqrt((sigma_d/d)^2 + (sigma_"slope"/"slope")^2) = 6 "nm"
$
Thus we obtain the wavelength of the green laser beam to be $537 pm 6$ nm, which is close to the expected value of 532 nm.


#include "finess_autistic.typ"

= Sources of Errors
1. The least count of the Vernier Callipers used was 0.01 cm, which is a significant source of error in our measurements.
2. The finite width of the fringes also contributes to the error in our measurements. We have tried to mitigate this error by measuring the inner and outer radius of the fringes, but it still contributes to the overall error.
3. Occulsions and imperfections in the optical components used in the experiment can also contribute to the error in our measurements.
4. A significant source of error in our measurements is the presence of additional unwanted fringes in the interference pattern. These unwanted fringes can arise due to multiple reflections between the optical components, and they can interfere with the measurement of the desired fringes, leading to errors in the measurements.
5. The green laser beam was quite error prone and multiple circular fringes were present in the interference pattern, which made it difficult to measure the radius of the fringes accurately.
6. The camera used to capture the interference pattern was a general purpose phone camera, which is not designed for scientific measurements and can introduce additional errors in the measurements.
7. The Lab had uneven lighting conditions, during the experiment to measure finesse, which caused the images to have non-uniform brightness, which can affect the accuracy of the measurements.


= Results

1. The etalon distance of the Fabry Perot cavity was found to be $d = 1.57 pm 0.04$ mm.
2. The wavelength of the green laser beam was found to be $lambda_g = 537 pm 6$ nm.
3. The finesse of the Fabry Perot cavity was found to be $F = 0.8$ for the red laser and $F = 0.7$ for the green laser.

= Discussion
1. Our dataset specifies an Inner and outer radius for each fringe, which is a consequence of the finite width of the fringes. We measured the diameter of the fringes using a Vernier Calliper, which has a least count of 0.01 cm. We measured the inner most point of the left side of the fringe and the outer most point of the right side of the fringe, which would just be a shifted diameter of the fringe. This is because the fringes are circular and the inner and outer radius would just be a shifted version of each other.
2. The choice of choosing the left inner point and the right outer point was not arbitrary. There was an additional circular fringe that was present in the interference pattern, to the left and bottom of the desired fringe pattern that we were trying to measure. As a result, the both the circular fringes interfered with each other and made the edges of the fringe quite fuzzy. Due to the unique location of the additional fringe, the left inner point and the right outer point still showed a clear edge of the fringe, which is why we chose to measure those points.
3. The etalon distance of the Fabry Perot cavity could be tuned using two seperate screw gauges attached to the cavity. Since $d$ has an inverse relationship with the slope of the linear fit, the fringes become wider and provide better edges to measure, which is why we tuned the cavity to have the smallest possible value of $d$, as allowed by the tuners on the cavity.
#pagebreak()

