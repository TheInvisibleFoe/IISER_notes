== Introduction
A lock-in amplifier is a type of amplifier that can extract a signal from an extremely noisy 
input. Generally, the signal we are trying to extract has a known carrier signal, i.e. a known
frequency. The signal to noise ratio upto which we can reliably detect the target signal depends
on the dynamic reserve of the instrument. For our experiments, we used Stanford Research Systems' 
Model SR830 DSP Lock-In Amplifier. As a DSP (Digital Signal Processor) lock-in amplifier, the SR830
performs most of it's core funcitons digitally, leading to a better performance than it's analog
competitors. In the following section, we describe the workings of this amplifier in greater
detail.

== Working Principle
The core function that the lock-in amplifier performs, is #emph("Phase Sensitive Detection"). 
Let's say the input signal we provide is $V_i (t) = V_0 sin(omega_i t + phi_i)$. The lock-in 
multiplies this signal with another reference signal, often provided by an internal oscillator.
Let's say the reference sinusoidal signal is given by $V_r (t) = V_1 sin(omega_r t + phi_r)$. Note
that both $omega_r$ and $phi_r$ of this internal oscillator are tunable parameters. After multiplying
these to signals, we get
$
V_"psd" (t) &= V_i (t)V_r (t) \ 
            &= V_0V_1sin(omega_i t + phi_i)sin(omega_r t + phi_r) \
            &= 1/2 V_0V_1 [cos[(omega_i - omega_r)t + (phi_i - phi_r)] - cos[(omega_i + omega_r)t + (phi_i + phi_r)]]
$
As we can see, we end up with two different sinusoidal components. If $omega_i = omega_r$, then we 
end up with an oscillating AC signal at frequency $2omega_r$ and a DC offset signal. If we now 
send this signal through a low pass filter (or equivalently take a time average of the signal), 
we will end up with just the DC signal, which from our calculations turns out to be, 
$
V_"lpf" = 1/2 V_0V_1cos(Delta phi) 
$

Where $Delta phi = phi_i - phi_r$, can be adjusted to 0 by setting $phi_r = phi_i$. The output 
of the low pass filter can then be scaled down by $1/2 V_r$, and we finally end up with the output voltage
of $V_"out" = V_0$. Note that it's not necessary that the input signal is a pure sinusoid. Infact, 
most of the times it will not be one. 

#figure(
    image("images/PSD.png", width: 70%),
    caption: [Schematic diagram of a Phase Sensitive Detector (Credits: Zelbear on Wikipedia)],
)
#pagebreak()
We can use the lock-in amplifier to extract all the fourier components of
the target signal at the reference frequency. To do this, the lock-in performs the calculation
we just described, twice in the two quadratures by using a $90 degree$ phase shifted copy of the reference signal.
It's better explained by this schematic diagram shown below.

#figure(
    image("images/lockin_block_diagram.png", width: 60%),
    caption: [Schematic Diagram for the SR830 Lock-In Amplifier (Credits: Stanford Research Systems)],
)

And the end of this process, we end up with two signals, $X$ and $Y$, which correspond to the $sin$ and 
$cos$ quadratures of the signal respectively. The lock-in also calculates two other variables $R$ and $theta$ as 
$
R = sqrt(X^2 + Y^2)
$
$
  theta = arctan(Y/X)
$
#pagebreak()
== Core Blocks and Specifications of the SR830
In this section we describe the core blocks of the SR830 lock-in amplifier, along with the various
specifications and available values for the adjustable parameters in those blocks. Below is an
image of the front-panel of the SR830.
#figure(
    image("images/lockin_front.jpg", width:70%),
    caption: [Front Panel of the SR830 (Credits: Stanford Research Systems)],
)
As mentioned before, all the core functionalities in an SR830 are done using a DSP (Digital Signal Processor).
=== Input and Reference Signals
The analog input signal is digitised, into a 20 bits, 256 kHz sample-rate digital signal. 
After this, all the computation for phase sensitive detection that we discussed before, 
is done digitally using the DSP. Even the reference signal is digitally synthesized. The `SINE OUT` signal 
is just that digitally synthesized signal, passed through a Digital to Analog Converter. For the reference
signal, we can adjust the Phase, Frequency and Amplitude.
=== Digital Low Pass Filters
The SR830 uses digital filters, which again are implemented using the DSP. Since the filters are 
digital, we are not limited to just two stages of filtering. Instead, each PSD can be followed by 
upto 4 filters, giving us roll-offs ranging from 6dB/Ocatve to 24dB/Octave. The filter has a adjustable roll-off, and 
an adjustable time constant. The time constant of the filter is just $1/(2pi f)$ where $f$ is the
-3dB frequency. The time constants range from $1mu S$ to $300s$.
=== Synchronous Filters
Recall that the output of our PSD originally gave us a DC signal, and a signal at twice the detection
frequency. If our detection frequency (say $f$) is too small, then the $2f$ frequency might be
harder to filter out. The lower $2f$ gets, the higher we must set the time constant and roll-off
of our low pass filter. Howver, SR830 has synchronous filtering. The synchronous filter averages the
PSD ourput over a period of the reference signal. Which means, all the harmonics of the detection
frequency $f$ are notched out. If our signal was perfectly clean, even the need for the Low Pass
Filtering stage is removed. We only use the synchrounous filter for detection frequencies under 
200 Hz. Above that, removing the $2f$ frequency using normal filter stages is feasible.
== Noise Sources of the SR830
There are a variety of ways we can see noise in our lock-in measurements, both intrinsic (random)
noise, and external noise. Below we list some of these sources in brief detail.
=== Johnson Noise
Due to thermal fluctuations, any resistor generates some noise accross it's terminals. 
The open circuit noise voltage for a resistor with resistance R and temperature T is given by,
$
V_"noise" ("rms") = sqrt(4K_B T R Delta f)
$
Where $Delta f$ is the bandwidth of the measurement. In a lock-in, the ENBW (Equivalent Noise Bandwidth) 
of the low pass filters sets the measurement bandwidth. So we have,
$
V_"noise" ("rms") = 0.13sqrt(R)sqrt("ENBW") n V
$
This ENBW is determined by the roll-off slope and the time constant of the low pass filter.
=== Shot Noise
Electric current has noise due to the finite nature
of the charge carriers, which results in a non-uniformity in the electron flow.
This noise is called shot noise. The shot noise is given by,
$
I_"noise" ("rms") = sqrt(2e I Delta f)
$
=== 1/f Noise
Apart from Johnson Noise, resistors can also generate noise due to fluctuations in resistance 
due to the current flowing through it. Note that this noise is not thermal in nature and, has a
$1/f$ power specrum. This makes measurements at low frequencies more difficult.

=== External Noises
Also there several external noise sources possible which have been listed below,
- Capacitive Coupling
- Inductive Coupling
- Ground Loops
