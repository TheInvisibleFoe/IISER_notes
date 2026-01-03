#import "imports.typ":*

= Flicker Noise
After the
invention of the "thermionic tube" amplifiers in 1921, C.A. Hartmann
attempted an experiment to verify Schottky's formula for the shot noise
spectral density @Hartmann1921;. Hartmann failed, and it was J. B. Johnson (of Johnson-Nyquist
fame) who measured the white noise spectrum. However, Johnson also
measured an unexpected "flicker noise" at low frequencies. This is shown
in the following diagram:

#figure(
  image("Attachments/Pasted image 20251126231033.png", width: 70%),
  caption:[(Source: @Milotti)]
)

It was soon found that such "flicker noise" is found in many systems.The observed spectral density of flicker noise is quite variable, as it
behaves like $1 / f^alpha$, where $alpha in \[ 0.5 \, 1.5 \]$, and this
behaviour extends over several frequency decades.

The appearance of power laws in the theory of critical phenomena, and
        the work of B. Mandelbrot on fractals @Mandelbrot1977; seemed to
indicate something universal with noise of this spectral signature.

#figure(
  image("Attachments/Pasted image 20251126231547.png", width: 70%),
  caption:[(Source: @Milotti; Some examples of 1/f noise)]
)


== $1 / f^alpha$ noise from the superposition of relaxation processes
<frac1falpha-noise-from-the-superposition-of-relaxation-processes>
Some of the early explanations of the appearance of $1 / f^alpha$ noise
in vacuum tubes due to Johnson @Johnson1925; and Schottky @Schottky1926; aligned along these lines: There is a contribution to the vacuum
tube current from the cathode surface trapping sites, which release
electrons according to a simple exponential relaxation law:
$ N \( t \) = N_0 e^(- lambda t) \, t gt.eq 0 $ The Fourier transform of
a single exponential relaxation process is given by:
$ F \( omega \) = integral_(- oo)^oo N \( t \) e^(- i omega t) d t = N_0 integral_0^oo e^(- \( lambda + i omega \) t) d t = frac(N_0, lambda + i omega) $
If we image a sequence of such pulses, given by:
$ N \( t \, t_k \) = N_0 e^(- lambda \( t - t_k \)) \, t gt.eq t_k $
where $N \( t \, t_k \) = 0$ for $t < t_k$. Taking the Fourier transform
of this,
$ F \( omega \) = integral_(- oo)^oo sum_k N \( t \, t_k \) e^(- i omega t) d t = frac(N_0, lambda + i omega) sum_k e^(i omega t_k) $
Which represents a spectrum given by:
$ S \( omega \) = lim_(T arrow.r oo) 1 / T expval(|F(omega)|^2 )= frac(N_0^2, lambda^2 + omega^2) lim_(T arrow.r oo) 1 / T angle.l |sum_k e^(i omega t_k)|^2 angle.r = frac(N_0^2 n, lambda^2 + omega^2) $
Where $n$ is the average pulse rate, and the average indicated is the
ensemble average. This spectrum is nearly flat at small frequencies, and
after a transition region it becomes proportional to $1 / omega^2$ at
high frequencies. This does happen at high frequencies, and is often
called "red noise". But it does not explain the data collected by
Johnson, i.e.~the 1/f noise.

As a next step, we can consider a superposition of such relaxation
processes with a distribution of relaxation rates @Bernamont1937 $lambda$. Let us assume that this
distribution is uniform in the range
$lambda in \[ lambda_1 \, lambda_2 \]$ , and that the amplitude of each
pulse remains the same. With this, we can derive a spectrum:
$ S \( omega \) = frac(1, lambda_1 - lambda_2) integral_(lambda_1)^(lambda_2) frac(N_0^2 n, lambda^2 + omega^2) d lambda = frac(N_0^2 n, omega \( lambda_2 - lambda_1 \)) [arctan ( lambda_2 / omega ) - arctan ( lambda_1 / omega )] $
So, in different regimes, we have: 
1. $ S \( omega \) = N_0^2 n \, 0 < omega < < lambda_1 < < lambda_2 $ 
2. $ S \( omega \) = frac(N_0^2 n pi, 2 omega \( lambda_2 - lambda_1 \)) \, lambda_1 < < omega < < lambda_2 $
3. $ S \( omega \) = frac(N_0^2 n, omega^2) \, lambda_1 < < lambda_2 < < omega $

#figure(
  image("Attachments/Pasted image 20251127004742.png", width: 70%),
  caption:[(Source: @Milotti; Spectrum from a uniform distribution of relaxation rates)]
)

Numerical studies have shown that this spectrum is relatively
insensitive to small deviations from a perfectly uniform distribution of
relaxation rates $lambda$ @Milotti. 

Now, if we distribute the relaxation rates according to a distribution
given by:
$ d P \( lambda \) = A / lambda^beta d lambda \, lambda in \( lambda_1 \, lambda_2 \) $
we can still calculate the spectrum integral exactly, as summarised by
van der Ziel @VanDerZiel1979;.. The results are:

$ S \( omega \) prop integral_(lambda_1)^(lambda_2) frac(1, lambda^2 + omega^2) frac(d lambda, lambda^beta) $
Where we get: 
1. $ beta = 1 ==> S \( omega \) = 1 / omega^2 [ln (lambda / sqrt(lambda^2 + omega^2) )]_(lambda_1)^(lambda_2) $
2. $ beta eq.not 1 ==> S \( omega \) = frac(lambda^(1 - beta), \( 1 - beta \) omega^2) F [( frac(1 - beta, 2) \, 1 \, frac(1 - beta, 2) \, - lambda^2 / omega^2 ) ]_(lambda_1)^(lambda_2) $
Here,
$ F \( a \, b \, c \, d \) = frac(Gamma \( c \), Gamma \( b \) Gamma \( c - b \)) integral_0^1 t^(b - 1) \( 1 - t \)^(c - b - 1) \( 1 - t d \)^(- a) d t $
Which is a hypergeometric function. We do not have to use the exact
expression for the spectrum, as it is possible to approximate in the
region $lambda in \( lambda_1 \, lambda_2 \)$ as:
$ S \( omega \) prop integral_(lambda_1)^(lambda_2) frac(1, lambda^2 + omega^2) frac(d lambda, lambda^beta) = 1 / omega^(1 + beta) integral_(lambda_1)^(lambda_2) frac(1, 1 + lambda^2 / omega^2) frac(d lambda / omega, \( lambda / omega \)^beta) = 1 / omega^(1 + beta) integral_(lambda_1 \/ omega)^(lambda_2 \/ omega) frac(1, 1 + x^2) frac(d x, x^beta) $
Which may be simplified to:
$ S \( omega \) prop 1 / omega^(1 + beta) integral_0^oo frac(1, 1 + x^2) frac(d x, x^beta) prop 1 / omega^(1 + beta) $
Which is the $1 / f^alpha$ spectra that we expected.

== Can the fluctuations be infinitely large?
<can-the-fluctuations-be-infinitely-large>
In most systems, it is seen that the 1/f behaviour continues for many
decades in frequency - making it impossible to determine $lambda_1$ and
$lambda_2$. Data from Pellegrini et. al shows this for voltage
fluctuations in thin film resistors, where the behaviour is observed
over 6 frequency decades. @Pellegrini1983; But this is a
problem, as if this behaviour continues down to zero frequency we would
have infinite integrated fluctuation as shown by:
$ integral_0^oo S \( f \) d f prop lim_(f_1 arrow.r 0 \, f_2 arrow.r oo) integral_(f_1)^(f_2) 1 / f d f = lim_(f_1 arrow.r 0 \, f_2 arrow.r oo) ln f_2 / f_1 $
Which obviously diverges. This is also true for any $1 / f^alpha$
spectra. Flinn @FLINN1968; produced a
simple argument that shows that such a blow-up is not physical and there
is no need to worry about it. Note that the integrated fluctuation for
1/f noise is always the same for every frequency decade. Now, the lowest
observable frequency in the universe is the inverse of the lifetime of
the Universe, which is approximately $10^(- 17) H z$. On the other hand,
is we take the Planck time as the smallest observable time, we get a
frequency of approximately $10^43 H z$. So, there are a total of $59$
frequency decades that are observable, which means that the highest
total possible fluctuation can only be 59 times the total fluctuation
between $1 H z$ and $10 H z$.

