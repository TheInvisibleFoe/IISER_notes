#import "template.typ": *
#import "@preview/physica:0.9.1": *
#import "@preview/ctheorems:1.1.2": *

#show: thmrules
#show: super-T-as-transpose // put in a #[...] to limit its scope...
#show: super-plus-as-dagger // ...or use scripts() to manually override

#show: arkheion.with(
  title: "PH3102: QM Assignment 09",
  authors: (
    (name: " Sabarno Saha     22MS037", email: none,  affiliation: "IISERK"),
  ),
)

#set cite(style: "chicago-author-date")
#show link: underline
#let ar = [$angle.r$]
#let al = [$angle.l$]
#let tc = [$times.circle$]
#let vb(ip) = {$bold(hat(ip))$}
#let br(ip) = {$|#to-string(ip.join(",")) angle.r$}

#set math.mat(delim: "[")
#set align(left)

= Perturbing the Infinite square well

  The unperturbed problem is $H_0 = hat(p)^2/(2m) + V'(x)$, where $V'(x)$ and the perturbation $V(x)$ is 
  $ V'(x) = cases(0 quad x:0<x<a, oo quad text("elsewhere")) quad quad ;quad quad   V(x) = cases(V_0 quad x: a/2<x<(3 a)/2, 0 quad text("elsewhere")) $<pert>
  The energy eigenvalues and eigenfunctions to $H_0$ are given as
  #nonum($ E_n = (n^2 pi^2 hbar^2)/(2 m a^2 )quad ,quad  psi_n^((0)) = sqrt(2/a) sin((n pi x)/a)  $)
#answer[
  Considering the nature of the perturbation, the ground state energy should increase to accomdate the perturbation. Since $V_0>0$, the particle in its ground state should have higher energy. The peak of the ground state takes place at $x=a\/2$. Since there is a higher potential at $x=a\/2$, the peak which is proportional to the pdf at $x=a\/2$, will decrease since the addition of a higher potential near it would decrease the pdf and thereafter the peak.
]
#answer[
  We now calculate the first order correction to the ground state energy. The first order correction is given as
   $ E_1^((1))= bra(psi_1^((0)))V ket(psi_1^((0))) = 2/a V_0 integral_(a/3)^((2a)/3)
   sin^2((pi x)/a) d x = [(2 pi + 3^(3/2))/(6 pi)] V_0 = [1/3 + sqrt(3)/(2 pi) ]V_0   $
]
#answer[
  The perturbation $V_0$ is invariant under parity transformation about $x=a\/2$. Thus there will only be mixing with among the states of same parity. The ground state is even parity about $x=a\/2$. Thus will mix with only the states that have even parity around $a\/2$ which have  $n = 3,5,7 ...$ which are odd eigenstates. The lowest excited state with which it will mix is $psi_3$ 

  $ E_1^((2)) bar_(n=3) & = abs((bra(psi_3^((0))) V_0 ket(psi_1^((0)))))^2/(E_1^((0)) - E_3^((0)))\ 
              & =  -( m a^2) /(4 a hbar^2 pi^2) abs(2/a V_o integral_(a/3)^((2a)/3) sin((pi x)/a)sin((3 pi x)/a) d x )^2\
  => E_1^((0)) bar_(n=3) & = -(27 m a^2 V_0^2)/(64 pi^4 hbar^2) 
  $
  The complete corrected ground state function upto the corrections upto a certain order we calculated is given by
  $ E_1 = E_1^((0)) + E_1^((1)) + E_1^((2)) bar_(n=3) = (pi^2 hbar^2)/(2 m a^2)+V_0(1/3 + sqrt(3)/(2 pi)) - (27 m a^2 V_0^2)/(64 pi^4 hbar^2)  $

  // To check mixing of different ground state, we calculate the overlap integral w.r.t $V_0$
  // $  bra(psi_k^((0)))V ket(psi_n^((0))) = 2/a V_0 integral_(a/3)^((2a)/3) sin((k pi x)/a)
  //  sin((n pi x)/a)d x  = (2 pi k + 3 sin((2 pi k)/3) - 3 sin((4 pi k)/3))/(6 pi k) delta_(n k)  \ $
]
#answer[
  We want to find the first order correction to the ground state due to mixing with lowest excited state which is given as
  $ ket(psi_1^((1))) bar_(n=3) = (bra(psi_3^((0))) V_0 ket(psi_1^((0))))/(E_1^((0)) - E_3^((0))) ket(psi_3) &= (3 sqrt(3) V_0)/( 4 pi)(m a^2)/(4 hbar^2 pi^2) sqrt(2/a) sin((3 pi x)/a) \
    & = (3 sqrt(6) V_0m a^(3/2))/(16 pi^3 hbar^2) sin((3 pi x)/a) 
  $
  The corrected ground state with first order corrections upto the first order with the mixing of the ground state with the lowest excited state is given by 
  $ ket(psi_1) = ket(psi_1^((0))) + ket(psi_1^((1))) bar_(n=3) = sqrt(2/a) sin((pi x)/a) + 
  (3 sqrt(6) V_0m a^(3/2))/(16 pi^3 hbar^2) sin((3 pi x)/a) $
]
#answer[
  To infer results for $V_0<0$ in the perturbation we map $V_0 --> - V_0$. The energy eigenvalues and eigenstates are given as
  
  $ E_1 &=  (pi^2 hbar^2)/(2 m a^2)-V_0(1/3 + sqrt(3)/(2 pi)) - (27 m a^2 V_0^2)/(64 pi^4 hbar^2)\
  ket(psi_1) &=  sqrt(2/a) sin((pi x)/a) - (3 sqrt(6) V_0m a^(3/2))/(16 pi^3 hbar^2) sin((3 pi x)/a) $
]
#answer[
  The plots for the unperturbed ground state and pertrubed ground states with $V_0>0$ and $V_0<0$ are plotted below,
  #figure(image("wavefunc.png", width:100%), caption:[Sketches of the ground state wavefunctions])  
]

= Perturbation theory for a 3-level problem

#answer[
  The Hamiltonian of the 3-level system is given as
  #nonum($hat(H) = mat(-u,v,0;v,u,0;0,0,u') quad ;u',u,v >0$)
  To apply perturbation theory to this we seperate $hat(H)$ into $H_0 +V$ where $H_0$ is the zeroth Hamiltonian and $V$ is the perturbation.

  We define $H_0$ and $V$ to be
  $ H_0 =  mat(-u,0,0;0,u,0;0,0,u') quad quad V=mat(0,v,0;v,0,0;0,0,0) $
]
#answer[
  We want to find the energy eigenvalues $E_1^((0)),E_2^((0)),E_3^((0))$ and the energy
  eigenstates $ket(psi_1^((0))),ket(psi_2^((0))),ket(psi_3^((0)))$ of the zeroth
  Hamiltonian. The eigenvalues of a diagonal matrix like $H_0$ are the diagonal entries
  themselves. So the energy eigenvalues are
  $ E_1^((0)) &= -u  quad &  quad E_2^((0)) &= u quad & quad E_3^((0)) &= u' \
    ket(psi_1^((0))) &= vec(1,0,0) quad & quad  ket(psi_2^((0))) &= vec(0,1,0)quad & quad ket(psi_3^((0)))
    & = vec(0,0,1)
  $
]
#answer[
  We calculate the energy corrections upto the second order. The first order and second energy corrections are given by
  $ E_n^((1)) = bra(psi_n^((0)))V ket(psi_n^((0)))\
    E_n^((2)) = bra(psi_n^((0)))V ket(psi_n^((1))) = sum_(k eq.not n) abs(bra(psi_k^((0)))V ket(psi_n^((0))))^2/(E_n^((0)) - E_k^((0)))
    $
    To find them we represent the perturbation $V$ in the eigenbasis of $H_0$
    that is in terms of $ket(psi_1^((0))),ket(psi_2^((0))),ket(psi_3^((0)))$.
  $ V &=
  mat(bra(psi_1^((0)))V ket(psi_1^((0))),bra(psi_1^((0)))V ket(psi_2^((0))),
  bra(psi_1^((0)))V ket(psi_3^((0))) ;

  bra(psi_2^((0)))V ket(psi_1^((0))),bra(psi_2^((0)))V ket(psi_2^((0))),bra(psi_2^((0)))V ket(psi_3^((0))) ;

  bra(psi_3^((0)))V ket(psi_1^((0))),bra(psi_3^((0)))V ket(psi_2^((0))),
  bra(psi_3^((0)))V ket(psi_3^((0))) ;) = mat(0,v,0;v,0,0;0,0,0)
  $
  Let us calculate $E_n^((1))$ using the gram-matrix elements of $V$ using the eigenbasis of $H_0$
  $ E_1^((1)) = E_2^((2)) = E_3^((3))=0 $
  We know calculate $E_n^((2))$ using the matrix elements of $V$ in the eigenbasis of $H_0$
  $
    E_1^((2)) &= abs(bra(psi_2^((0)))V ket(psi_1^((0))))^2/(E_1^((0)) - E_2^((0)))
    = -v^2/(2u) \

    E_2^((2)) &= abs(bra(psi_1^((0)))V ket(psi_2^((0))))^2/(E_2^((0)) - E_1^((0))) = v^2/(2u) \
    E_3^((2)) &= 0

   $
]
#answer[
  We use the expression for the corrections to the eigenstates as  $ket(psi_n^((j)))=sum_(k eq.not n) c_(n k)^((j)) ket(psi_n^((0)))$ to find the first order corrections to the eigenstates. To find out $c_(n k)^((1))$ we use,

  $ c_(n k)^((1)) =  (bra(psi_k^((0)))V ket(psi_n^((0))))/(E_n^((0)) -E_k^((0))) $
  Let us write the matrix of the coefficients of first order corrections $C$ as
  $C_(i j) = c_(i j)^((1))$. The matrix is
  $ C = mat(0,v/(2u),0;-v/(2 u),0,0;0,0,0) $
  The first order correction to the eigenstates are $ket(psi_1^((1))),ket(psi_2^((1))),ket(psi_3^((1))),$ are
  $ ket(psi_1^((1))) &= C_12 ket(psi_2^(0)) +  C_13 ket(psi_3^(0)) = -v/(2 u) ket(psi_2^((0))) = -v/(2 u) vec(0,1,0) \
  ket(psi_2^((1))) &= C_21 ket(psi_1^(0)) +  C_23 ket(psi_3^(0)) = v/(2 u) ket(psi_1^((0))) = v/(2u) vec(1,0,0)\
ket(psi_3^((1))) &= C_32 ket(psi_2^(0)) +  C_31 ket(psi_1^(0)) = 0 $

]
#answer[
  We now solve the problem by diagonalising the matrix $H$. The matrix $H$ is diagonalizable because it is a symmetric matrix and symmetric matrics are normal. By Spectral Theorem, there exists an orthogonal eigenbasis of the matrix. After diagonalizing, we get
  $ H &= mat(-u,v,0; v,u, 0; 0,0,u')  = mat(quad, quad, quad;v_(1),  v_(2),
  v_(3); quad,quad,quad)
   mat(-sqrt(u^2+v^2),0,0;0,sqrt(u^2+v^2),0;0,0,u')  mat(quad, quad, quad;v_(1),  v_(2),  v_(3); quad,quad,quad)^T \
   &= mat(-(sqrt(u^2+ v^2)+u)/v, (sqrt(u^2+ v^2)-u)/v, 0; 1,1,0;0,0,1)
   mat(-sqrt(u^2+v^2),0,0;0,sqrt(u^2+v^2),0;0,0,u')
   mat(-(sqrt(u^2+ v^2)+u)/v ,1 ,0,; (sqrt(u^2+ v^2)-u)/v, 1, 0; 0,0,1)
   $

   The energy eigenvalues that we get from diagonalising the matrix are
    #rect[$ lambda_1 = -sqrt(u^2+v^2) quad;quad
      lambda_2 = sqrt(u^2+v^2) quad;quad      lambda_3 = u' $]
   The third energy eigenvalue is not disturbed by the perturbation $V$. Let us focus on the other ones. In the regime where $v\/u << 1$, we expand eigenvalues as a power series in terms of $v/u$
   #nonum($lambda_1 = -u sqrt(1+(v^2)/(u^2)) = -u - v^2/(2 u) - O(v^4/u^2)=-u - v^2/(2 u) = E_1\ lambda_2 = u sqrt(1+(v^2)/(u^2)) = u + v^2/(2 u) + O(v^4/u^2)=u +(v^2)/(2u) = E_2\ $)
   Thus we can see that this result matches that of perturbative result which
   we have calculated ignoring terms with $O(v^4/u^2)$.
   The eigenvectors are
   $ v_1 = vec(-(sqrt(u^2+ v^2)+u)/v, 1, 0), v_2 = vec((sqrt(u^2+ v^2)-u)/v, 1, 0), v_3 = vec(0,0,1) $
   Let us take the first two eigenvectors and again in the regime of $v\/u<<1$ let us expand into a power series
   $ v_1 &= vec(-u/v (1+sqrt(1+v^2/u^2)),1,0) = vec((-2u)/v,1,0) =
   vec(1,-v/(2u),0) = vec(1,0,0) - v/(2u) vec(0,1,0) =ket(psi_1^((0))) + ket(psi_1^((1))) =ket(psi_1) \
   v_2 &= vec(u/v (sqrt(1+v^2/u^2)-1),1,0) = vec(v/(2u),1,0) 
       = vec(0,1,0) + v/(2u) vec(1,0,0) =ket(psi_2^((0))) + ket(psi_2^((1))) =ket(psi_s) \
   v_2 &= vec(0,0,1) = ket(psi_3)
   $
   Here we have used the approximations $v\/u approx 0$ and $sqrt(1+v^2\/u^2) approx 1+v^2\/2u^2$. We see that the eigenfunctions of the total hamiltonian match the eigenstates we obtained from our perturbation calculations upto to certain order.
]
#answer[
  #set math.mat(delim:"(")
  We calculate the wavefunction renormalization as $Z$ of the ground state which is given by
  $ Z = abs(braket(psi_1^((0)),psi_1)_N)^2 $
  We apply the corrections we obtained from the perturation theory results, to the ground state
  $ & ket(psi_1) = ket(psi_1^((0))) -v/(2 u) ket(psi_2^((0))) = vec(1,-v/(2u),0)\
  => & ket(psi_1)_N = 1/sqrt(1+v^2/(4u^2)) vec(1,-v/(2u),0)\
  => & Z = 1/(1+v^2/(4 u^2))abs(mat(1,0,0)vec(1,-v/(2u),0))^2  = 1/(1 + v^2/(4 u^2))
  $
  The regime of validity of this perturbation problem is $v\/u<<1$. We can see this regime validity appearing in the renormalization problem. Going beyond the regime of this problem, we get
  #nonum($ Z = 1/(1+v^2\/4 u^2)--> 0 , quad a s  quad v/u -->  oo $)
]
