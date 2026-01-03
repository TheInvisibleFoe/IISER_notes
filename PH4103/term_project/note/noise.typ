#import "imports.typ":*

= 1/f noise analysis

In this section, we analyze the voltage fluctuations recorded during the resistance measurements to investigate the presence of $1/f$ noise, also known as flicker noise. This type of noise is characterized by a power spectral density that is inversely proportional to the frequency, and it is commonly observed in electronic devices and materials.

In resistors, we model this noise using the relaxation model derived in the theory section. Resistors have defects that can trap and release charge carriers, leading to fluctuations in resistance and voltage, which cause the observed $1/f$ noise.

== Working Principle
Generally, $1/f$ noise can is characterised by its power spectral density (PSD), which is obtain from the Fourier transform of the autocorrelation function of the voltage signal. However for a lockin amplifier, the voltage fluctuations die down rapidly due to the filtering with specifications mentioned in the manual. Therefore, we directly analyze the variance of the voltage signal as a function of frequency to identify the presence of $1/f$ noise. To do that, we must analyse why that works and how erroneous it is.

Let the noise be denoted by the variable $x(t)$. The power spectral density $S(f)$ is defined as:
$
  S(f) = lim_(T -> oo)1/T |hat(x)_T (f)|^2
$
where $hat(x)_T (f)$ is the Fourier transform of the signal $x(t)$ over a time interval $T$. The average power in a frequency band $[f_1, f_2]$ is then given by:
$
  expval(P) prop integral_(f_1)^(f_2) S(f) d f
$
We assume that the lock-in does not have an ideal rectangular filter, but rather a band-pass filter with a finite bandwidth $Delta f$ around the reference frequency $f$. Then we can relate the average voltage fluctuations in the bandwith $[f, f + Delta f]$ to the power spectral density. The average power in this band is:
$
  expval(P)_f prop integral_(f)^(f + Delta f) S(f) d f
$
If we assume that the noise follows a $1/f$ dependence, i.e. $S(f) = A/f$, where $A$ is a constant, Assuming that $Delta f$ is small compared to $f$, we can approximate the integral as:
$
  expval(P)_f prop A/f Delta f
$
Note that $P$ here is the power of the noise signal. One assumption here is that the noise voltage also follows the same dependence, i.e. $V^2 prop P$. Therefore, we can write:
$
  expval(V^2_"noise")_f prop 1/f
$
Note for our case, the signal is the average voltage $expval(V)$, then the Noise voltage is given by $V_"noise" = V- expval(V)$. We can thus see that,
$
  expval(V^2_"noise") = expval(V^2) - expval(V)^2 prop 1/f
$

The errors in this approximation arise as powers of $(Delta f)/f$. So one way to mitigate the error due to approximation is to ignore lower values of $f$.
Depending on the constant of proportionality, the error needs to mitigated by taking only higher frequencies, above a certain threshold dependeing on what error estimate is required.
The frequency band $Delta f$ depends on the filter being used. We can quantify this further by defining the Equivalent Noise Bandwidth.
The Equivalent noise bandwidth(ENBW) is defined to be the bandwidth of the fictitous brick-wall filter such that the amount of 
noise power allowed through the this filter is the same as the amount of white noise power allowed through the original filter. Thus, our
error frequency would be proportional to the ENBW of the filter. To quantify the amount of error in this approximation,
we can use the order of the filter and the time constant of the filter to determine the ENBW from the SR830 manual.

== Parameters
The parameters used for the $1/f$ noise analysis are as follows:
1. Reference Voltage Amplitude: 10 mV
2. Reference Frequency: 10 Hz to 100 kHz (varied)
3. Series Resistor $R_0$: $1 k Omega$
4. Time Constant: 10 ms
5. Roll-off: 6 dB/oct

The experimental procedure is the exact same as described in the previous section. Except here, we focus on recording the voltage fluctuations at each frequency setting of the lock-in amplifier.

== Data analysis

#figure(
  image("assets/flicker_sync_filteron_data505.png", width:70%),
  caption: "Noise Voltage vs Frequency plot with the sync filter turned on."
)

#figure(
  image("assets/flicker_sync_filteron_data505_ini_dat_r.png", width:70%),
  caption: "Noise Voltage vs Frequency plot with the sync filter turned on and initial datapoints removed."
)
#figure(
  image("assets/flicker_sync_filteroff_data814.png", width:70%),
  caption: "Noise Voltage vs Frequency plot with the sync filter turned off."
)

== Observations
We observe $1/f$ noise in the data both in datasets with the sync filter turned on and the sync filter turned off. The data with the sync filter turned on shows a clearer $1/f$ dependence after removing the initial datapoints, which are likely affected by low-frequency noise and approximation errors. The data with the sync filter turned off also exhibits $1/f$ behavior, but with more scatter.
