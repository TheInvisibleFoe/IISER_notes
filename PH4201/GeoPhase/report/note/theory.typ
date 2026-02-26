#import "imports.typ":*

= Theory

The experimental setup to observe the Pancharatnam-Berry phase in polarized light is based on a Michelson interferometer. The interferometer consists of a beam splitter that divides the incoming light into two paths. The uniformly polarized light from the laser source is first passed through a linear polarizer. In one of the arms of the interferometer, there are two quarter waveplates. The first quarter waveplate is fixed at an angle of $45^o$ with respect to the polarization direction of the incoming light, while the second quarter waveplate can be rotated by an angle of $beta$ with respect to the first one. 

The linear polarizer is rotated to maximise the internsity of light entering the beam splitter. The QP1 is aligned with $pi/4$ with respect to the polarization direction of the incoming light, which is ensured by rotating until the fringes disappear. The second QWP is rotated by an angle of $beta$ and the fringe shifts are counted.

At the end of the interferometer, the light is passed through a biconvex lens to focus the light onto a screen where the interference pattern can be observed. The interference pattern will shift as the angle $beta$ of the second quarter waveplate is varied, allowing us to observe the effect of the Pancharatnam-Berry phase on the interference pattern.

#figure(image("assets/intdiag.png", width: 55%), caption: [Experiment Setup for a Michelson Interferometer, to observe the Pancharatnam-Berry phase in polarized light. ])

== Poincare Sphere Representation
The Poincaré sphere is a powerful tool for visualizing the polarization states of light. Each point on the surface of the sphere represents a unique polarization state. The equator of the sphere corresponds to linear polarization states, while the poles correspond to circular polarization states. The points in between represent elliptical polarization states. The Poincaré sphere allows us to understand how the polarization state of light changes as it passes through different optical elements, such as waveplates and polarizers. The Pancharatnam-Berry phase can be visualized on the Poincaré sphere as a geometric phase acquired by the polarization state of light as it undergoes a cyclic evolution on the sphere. 

#figure(image("assets/Poincsph.png", width: 55%), caption: [Poincaré sphere representation of the polarization states of light. ])

== Jones Matrix Formalism
The Jones matrix formalism helps us understand the effect of the optical elements on the polarization state of light. The Jones vector for a linearly polarized light can be represented as:
$
  vb(E) = vec(1,0)
$
Here we consider the x-axis to be the direction of polarization. The effect of a quarter waveplate with an angle of $theta$ can be represented by the following Jones matrix:
$  J_("QWP") (theta) = mat(
    cos^2(theta) + i sin^2(theta), (1 - i) cos(theta) sin(theta);
    (1 - i) cos(theta) sin(theta), sin^2(theta) + i cos^2(theta)
  )
$
For a quarter waveplate with its fast axis at $45^o$, the Jones matrix simplifies to:
$  J_("QWP") (45^o) = 1/sqrt(2) mat(
    1 + i, 1 - i;
    1 - i, 1 + i
  )
$
Thus after passing through the first quarter waveplate, the Jones vector for the linearly polarized light,upto a dynamical phase becomes:
$  vb(E)_1 = J_("QWP") (45^o) vb(E) = 1/sqrt(2) mat(
    1 + i, 1 - i;
    1 - i, 1 + i
  ) vec(1,0) = 1/2 vec(1 + i, 1 - i) = (1+i)/2 vec(1,-i)
$
Then it passes through the second quarter waveplate, which is rotated by an angle of $beta$ with respect to the first one. The Jones vector after passing through the second quarter waveplate is given by:
$  vb(E)_2 &= J_("QWP") (beta) vb(E)_1 = J_("QWP") (beta) J_("QWP") (45^o) vb(E) \
&= mat(
    cos^2(beta) + i sin^2(beta), (1 - i) cos(beta) sin(beta);
    (1 - i) cos(beta) sin(beta), sin^2(beta) + i cos^2(beta)
  ) (1+i)/2 vec(1 , - i) 
$
Then it reflects off the mirror which induces a phase shift of $pi$ on the electric field. Thus the Jones vector after reflection is given by:
$  vb(E)_3 = mat(1, 0; 0, -1) vb(E)_2
$
After passing through the second quarter waveplate again, the Jones vector becomes:
$  vb(E)_4 = J_("QWP") (beta) vb(E)_3
$
Finally, after passing through the first quarter waveplate again, the Jones vector becomes:
$  vb(E)_5 = J_("QWP") (45^o) vb(E)_4
$
At the end of the interferometer, the light is projected onto the original polarization state using a polarizer. The Jones vector after projection is given by:
$  vb(E)_f = e^(-i phi) e^(-2 i beta) vec(1,0)
$
where $phi$ is the dynamical phase acquired during the propagation of light through the interferometer, which does not change unless the elements of the interferometer are changed. The Pancharatnam-Berry phase is given by the geometric phase $e^(- 2 i beta)$. For interference to occur, the final state must be the same as the initial state, which means that the total phase difference between the two paths must be an integer multiple of $2 pi$. Thus, the condition for constructive interference is given by:
$  phi + 2 beta = 2 n pi, n in Z
$

Since the mirrors, beam spitters and waveplates are all static, the dynamical phase $phi$ remains constant. Therefore, by varying the angle $beta$ of the second quarter waveplate, we can observe the interference pattern and see the effect of the Pancharatnam-Berry phase on the interference. 