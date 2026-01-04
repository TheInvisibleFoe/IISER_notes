= Four Terminal AC Resistance Measurement
Electrical resistivity is a fundamental material property and is crucial
for understanding electronic behaviour in a material. The simplest
electrical resistance measurement is a 2 terminal DC measurement of
voltage due to an applied current. This method is prone to noise
because: 1. The system is being driven at low frequency, and thus a
substantial amount of 1/f noise is introduced. 2. Lead and contact
resistance 3. Thermal offsets

#figure( 
  image("Attachments/Pasted image 20251127035603.png", width: 70%), 
  caption:[(Source: @key)] 
)

Here, we discuss the four-terminal AC resistance measurement as an
alternative to the simple two-probe DC measurement.

#figure( 
  image("Attachments/Pasted image 20251127035821.png", width: 70%), 
  caption:[(Source: @key)] 
)

There are two main advantages of the four-point AC method over the more
rudimentary two-probe method - 1. The four-point geometry removes the
effects of contact resistance, allowing a measurement of the intrinsic
device resistance. 2. The measurement of an AC voltage at a fixed
frequency of excitation current allows the use of Lock-In measurement,
which provides an effective narrow bandwidth extraction of the signal.
This reduces the noise in the measurement greatly. Moreover, the
measurement using AC provides some isolation from the thermoelectric
voltages present in the DC measurements.

== Contact resistance
<contact-resistance>
When two metal surfaces touch, they normally do not make contact across
the entire macroscopic contact surface area ($A_m$). Instead, they touch
only at microscopic high points on the surfaces called
#strong[asperities];. The sum of all the contact areas from the
asperities is called the real contact surface area ($A_r$). Normally,
$A_r < < A_m$. The current lines must squeeze together to pass through
the asperities, and this is the primary reason for the creation of
contact resistance and is called the "Constriction Resistance". There
are two main regimes involved in modelling how the asperities affect
contact resistance, and they are determined by comparing the radius of
the spot of asperities contact ($a$) and the electron mean free path
length ($l$). 1. Diffusive regime ($a > > l$): Here, the electrons will
scatter several times as they pass through the contact. Thus, the
transport is diffusive and is governed by the Maxwell equations. The
resistance contribution in this case is given by
$R_(d i f f u s i v e) = frac(rho, 2 a)$. 2. Ballistic regime
($a < < l$): Here, the electrons travel through the contact spot without
scattering. Thus, the resistance is no longer due to the scattering but
rather due to the number of quantum channels available for the electron
wavefunction to transmit. This is Sharvin resistance, and is derived
from semiclassical transport theory to be
$R_(b a l l i s t i c) = frac(4 rho l, 3 pi a^2)$ Normally, metal-metal
contact resistance is ohmic. But due to the massive constriction of
current to the asperities, there is a large current density present
there. This leads to a significant amount of Joule heating. Also of
interest is the fact that thermal fluctuation can result in fluctuations
in $A_r$ - which can cause a fluctuation in the effective resistance of
the device seen. This is a potential source of 1/f noise in the system.
Considering all these effects, it is crucial to measure the submilliohm
resistance using a 4-point method as otherwise we would be measuring the
contact and not the device resistance itself.

== Preparation of sample for 4-point measurement
<preparation-of-sample-for-4-point-measurement>
Note that minimising the contact resistance is good practice even in the
case of 4-point measurements, as contact resistance can result in ohmic
heating of the sample and introduce noise.

Ideally, contacts should be cleaned properly before making connections.
Even with silver conductive paint at contact junction, contact
resistances can be as large as $10 Omega$.

== BNC Cables
<bnc-cables>
The Bayonet Neill-Concelmann (BNC) cable is a coaxial RF cable that is
designed for use in scientific data collection. The dimensions and
material of the BNC cables are designed to provide a characteristic
impedance to the signal. This reduces the phenomena of signal reflection
at the connection point. The coaxial design of the cable acts as a
Faraday cage, essentially shielding the inner wire from external
electromagnetic interference. Normally, an important aspect of using BNC
cables to relay a signal is #strong[impedance matching];. When a signal
is relayed down a BNC cable and it reaches the device/load, the signal
can either be absorbed by the load or it can be reflected back the wire.
The behaviour is quantified by the reflection coefficient, defined as:
$ Gamma = frac(Z_L - Z_0, Z_L + Z_0) $ Where $Z_L$ is the load
impedance, and $Z_0$ is the cable impedance (usually specified very
accurately). Ideally, we would want $Gamma = 0$, which requires
$Z_L = Z_0$, which is the impedance matching criteria. If we have
$Gamma eq.not 0$, we end up having standing waves and jitters in the
cable, which obviously affect measurements significantly. When is
matching required? The effects of impedance mismatch become apparent
only when the cable acts like a transmission line. This happens when the
cable length is significant compared to the signal's wavelength. A rule
of thumb is that matching is required when we have:
$ upright("Cable length") > upright("Wavelength") / 10 $ In our case, we
use driving frequencies upto $approx 100 k H z$. This corresponds to a
wavelength of $approx 300 m$, and a threshold (from the rule of thumb)
of $30 m$. Since the cables we use are significantly shorter, impedance
matching is not something that we concern ourselves with here. 

== Setting up instrument 
It is to be noted that in our experiment we did
not have access to a modulated constant current source that could
generate a clock synchronisation signal compatible with the Lock-In
Amplifier provided. Thus, we resorted to using the Lock-In Amplifier's
internal reference signal to drive a modulated current through the
device being measured. The drive frequency influences the measurement in
many ways. A larger driving frequency may avoid significant 1/f noise
and allow the measurement of faster phenomena (with reasonable time
constants), but it can lead to larger phase lag between the reference
and the signal which may obscure the intrinsic device resistance and
reduce the signal to noise ratio of the measurement as more current is
shunted through the stray load capacitance. With a sample resistance $R$
and a stray capacitance $C$ measured at some frequency $f$, we will
observe a phase shift of the order: $ theta = 2 pi f R C $
