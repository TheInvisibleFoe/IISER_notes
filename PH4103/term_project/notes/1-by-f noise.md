[^2]After the invention of the "thermionic tube" amplifiers in 1921, C.A. Hartmann attempted an experiment to verify Schottky's formula for the shot noise spectral density [^1]. Hartmann failed, and it was J. B. Johnson (of Johnson-Nyquist fame) who measured the white noise spectrum. However, Johnson also measured an unexpected "flicker noise" at low frequencies. This is shown in the following diagram:

![[Pasted image 20251126231033.png]]
(Source: [^2])

It was soon found that such "flicker noise" is found in many systems.

The observed spectral density of flicker noise is quite variable, as it behaves like $\frac{1}{f^\alpha}$, where $\alpha \in [0.5,1.5]$, and this behaviour extends over several frequency decades.

The appearance of power laws in the theory of critical phenomena, and the work of B. Mandelbrot on fractals [^3] seemed to indicate something universal with noise of this spectral signature.

![[Pasted image 20251126231547.png]]
(Source: [^2] Some other examples of 1/f noise)

## $\frac{1}{f^\alpha}$ noise from the superposition of relaxation processes
Some of the early explanations of the appearance of $\frac{1}{f^\alpha}$ noise in vacuum tubes due to Johnson [^4] and Schottky [^5] aligned along these lines:
There is a contribution to the vacuum tube current from the cathode surface trapping sites, which release electrons according to a simple exponential relaxation law:
$$
N(t) = N_0 e^{-\lambda t}, t \geq 0
$$
The Fourier transform of a single exponential relaxation process is given by:
$$
F(\omega) = \int_{- \infty}^{\infty} N(t) e^{-i \omega t} dt = N_0 \int_{0}^{\infty} e^{-(\lambda + i \omega)t} dt = \frac{N_0}{\lambda + i \omega}
$$
If we image a sequence of such pulses, given by:
$$
N(t,t_k) = N_0 e^{- \lambda (t-t_k)}, t \geq t_k
$$
where $N(t,t_k) = 0$ for $t < t_k$.
Taking the Fourier transform of this,
$$
F(\omega) = \int_{-\infty}^{\infty} \sum_{k} N(t,t_k) e^{-i \omega t} dt = \frac{N_0}{\lambda + i \omega} \sum_{k} e^{i \omega t_k}
$$
Which represents a spectrum given by:
$$
S(\omega) = \lim_{T \to \infty} \frac{1}{T} \langle | F(\omega) |^2 \rangle = \frac{N_0^2}{\lambda^2 + \omega^2} \lim_{T \to \infty} \frac{1}{T} \langle \rvert \sum_{k} e^{i \omega t_k} \lvert^2 \rangle = \frac{N_0^2 n}{\lambda^2 + \omega^2}
$$
Where $n$ is the average pulse rate, and the average indicated is the ensemble average.
This spectrum is nearly flat at small frequencies, and after a transition region it becomes proportional to $\frac{1}{\omega^2}$ at high frequencies. This does happen at high frequencies, and is often called "red noise". But it does not explain the data collected by Johnson, i.e. the 1/f noise.

As a next step, we can consider a superposition of such relaxation processes with a distribution of relaxation rates[^6] $\lambda$. Let us assume that this distribution is uniform in the range $\lambda \in [\lambda_1, \lambda_2]$ , and that the amplitude of each pulse remains the same. With this, we can derive a spectrum:
$$
S(\omega) = \frac{1}{\lambda_1 - \lambda_2} \int_{\lambda_1}^{\lambda_2} \frac{N_0^2 n}{\lambda^2 + \omega^2} d \lambda = \frac{N_0^2 n}{\omega (\lambda_2 - \lambda_1)} \left[ \arctan(\frac{\lambda_2}{\omega}) - \arctan(\frac{\lambda_1}{\omega}) \right]
$$
So, in different regimes, we have:
1. $S(\omega) = N_0^2 n, 0 < \omega << \lambda_1 << \lambda_2$
2. $S(\omega) = \frac{N_0^2 n \pi}{2 \omega (\lambda_2 - \lambda_1)}, \lambda_1 << \omega << \lambda_2$
3. $S(\omega) = \frac{N_0^2 n}{\omega^2}, \lambda_1 << \lambda_2 << \omega$

![[Pasted image 20251127004742.png]]
(Source: [^2])

Numerical studies have shown that this spectrum is relatively insensitive to small deviations from a perfectly uniform distribution of relaxation rates $\lambda$. [^2]

Now, if we distribute the relaxation rates according to a distribution given by:
$$
dP(\lambda) = \frac{A}{\lambda^\beta} d \lambda, \lambda \in (\lambda_1, \lambda_2)
$$
we can still calculate the spectrum integral exactly, as summarised by van der Ziel [^7].
The results are:

$$
S(\omega) \propto \int_{\lambda_1}^{\lambda_2} \frac{1}{\lambda^2 + \omega^2} \frac{d \lambda}{\lambda^\beta}
$$
Where we get:
1. If $\beta = 1$: $S(\omega) = \frac{1}{\omega^2} \ln \left( \frac{\lambda}{\sqrt{\lambda^2 + \omega^2}} \right) \rvert_{\lambda_1}^{\lambda_2}$
2. If $\beta \neq 1$: $S(\omega) = \frac{\lambda^{1-\beta}}{(1-\beta)\omega^2} F(\frac{1-\beta}{2}, 1, \frac{1-\beta}{2}, - \frac{\lambda^2}{\omega^2}) \rvert_{\lambda_1}^{\lambda_2}$
Here,
$$
F(a,b,c,d) = \frac{\Gamma(c)}{\Gamma(b) \Gamma(c-b)} \int_{0}^{1} t^{b-1} (1-t)^{c-b-1} (1-td)^{-a} dt
$$
Which is a hypergeometric function. We do not have to use the exact expression for the spectrum, as it is possible to approximate in the region $\lambda \in (\lambda_1, \lambda_2)$ as:
$$
S(\omega) \propto \int_{\lambda_1}^{\lambda_2} \frac{1}{\lambda^2 + \omega^2} \frac{d \lambda}{\lambda^\beta} = \frac{1}{\omega^{1+\beta}} \int_{\lambda_1}^{\lambda_2} \frac{1}{1 + \frac{\lambda^2}{\omega^2}} \frac{d \frac{\lambda}{\omega}}{(\frac{\lambda}{\omega})^\beta} = \frac{1}{\omega^{1+\beta}} \int_{\lambda_1 / \omega}^{\lambda_2 / \omega} \frac{1}{1+x^2} \frac{dx}{x^\beta}
$$
Which may be simplified to:
$$
S(\omega) \propto \frac{1}{\omega^{1+\beta}} \int_{0}^{\infty} \frac{1}{1+x^2} \frac{dx}{x^\beta} \propto \frac{1}{\omega^{1+\beta}}
$$
Which is the $\frac{1}{f^\alpha}$ spectra that we expected.

## Can the fluctuations be infinitely large?
In most systems, it is seen that the 1/f behaviour continues for many decades in frequency - making it impossible to determine $\lambda_1$ and $\lambda_2$.
Data from Pellegrini et. al shows this for voltage fluctuations in thin film resistors, where the behaviour is observed over 6 frequency decades. [^8]
But this is a problem, as if this behaviour continues down to zero frequency we would have infinite integrated fluctuation as shown by:
$$
\int_{0}^{\infty} S(f) df \propto \lim_{f_1 \to 0, f_2 \to \infty} \int_{f_1}^{f_2} \frac{1}{f} df = \lim_{f_1 \to 0, f_2 \to \infty} \ln \frac{f_2}{f_1}
$$
Which obviously diverges. This is also true for any $\frac{1}{f^\alpha}$ spectra.
Flinn [^9] produced a simple argument that shows that such a blow-up is not physical and there is no need to worry about it. Note that the integrated fluctuation for 1/f noise is always the same for every frequency decade. Now, the lowest observable frequency in the universe is the inverse of the lifetime of the Universe, which is approximately $10^{-17} Hz$. On the other hand, is we take the Planck time as the smallest observable time, we get a frequency of approximately $10^{43} Hz$. So, there are a total of $59$ frequency decades that are observable, which means that the highest total possible fluctuation can only be 59 times the total fluctuation between $1 Hz$ and $10 Hz$.

## Noise in diffusion processes
Most of the early noise studies were carried out on resistors, op-amps, and other electronic equipment. Special attention was paid to resistors, as it was natural to identify simple random process (like simple random walk of charge carriers) as possible origins of 1/f noise.

(NOTE TO SABARNO - Please write something on this from Section 4. of [^2])

The rest of the Milotti review is excess.
# Footnotes

[^1]: C. A. Hartmann, Ann. der Phys. 65 (1921) 51.

[^2]: 1/f noise: a pedagogical review, Edoardo Milotti

[^3]: B. Mandelbrot, Fractals: Form, Chance and Dimension (W. H. Freeman and Co. 1977).

[^4]: J. B. Johnson, Phys. Rev. 26 (1925) 71.

[^5]: W. Schottky, Phys. Rev. 28 (1926) 74.

[^6]: . Bernamont, Ann. Phys. (Leipzig) 7 (1937) 71.

[^7]: A. van der Ziel, Adv. Electronics and Electron Phys. 49 (1979) 225.

[^8]: B. Pellegrini, R. Saletti, P. Terreni and M. Prudenziati, Phys. Rev. B27 (1983) 1233.

[^9]: I. Flinn, Nature 219 (1968) 1356.
