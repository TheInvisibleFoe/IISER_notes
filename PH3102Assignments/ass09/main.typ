#import "template.typ": *
#import "@preview/physica:0.9.1": *
#import "@preview/ctheorems:1.1.2": * 
#show: thmrules
#show: super-T-as-transpose // put in a #[...] to limit its scope...
#show: super-plus-as-dagger // ...or use scripts() to manually override

#show: arkheion.with(
  title: "PH3102: QM Assignment 09",
  authors: (
    (name: " Sabarno Saha", email: "22MS037", affiliation: "IISERK"),
  ),
)

#set cite(style: "chicago-author-date")
#show link: underline
#let ar = [$angle.r$]
#let al = [$angle.l$]
#let tc = [$times.circle$]
#let vb(ip) = {$bold(hat(ip))$}
#let br(ip) = {$|#to-string(ip.join(",")) angle.r$}

#set align(left)

= Perturbing the Infinite square well lol
#answer[
 There are 2 independent spins $arrow(S)_1$, $arrow(S)_2$ which have two independent Hilbert spaces 
  assosciated with them. Thus this systems having 2 spins will be described by the tensor product of both 
  Hilbert spaces giving us the labelling $|S_1,m_S_1 angle.r$ and $|S_2,m_S_2 ar$. Thus to label all 
  the states of the system we need 4 eigenstates.
  
]
#answer[
  The hamiltonian is given as 
  $ hat(H)  &= J vb(S)_1 dot vb(S)_2 \
            &= J/2[vb(S)_(t o t)^2 - vb(S)_1^2 - vb(S)_2^2]
  $
  Let us write our eigenstates $|S_1, m_S_1 ar tc|S_2, m_S_2 ar$ as the tensor product of the eigenstates with the good quantum numbers. 

]
#answer[
  Since the Spin operators $vb(S)_1$ and $vb(S)_2$ acts on independent Hilbert spaces, the operators are
  independent of each other. We thus have $[op(S)_(1 i),S_(2 j)] = 0 $ where $i,j in{x,y,z}$. This gives us the 
  commutation relations $[vb(S)_(t o t), vb(S)_i] =0, i in {1,2}$. Thus we see that $hat(S)_(t o t), hat(S)_1$ and
  $hat(S)_2$ all commute with the Hamiltonian, giving us 
  $ [H,hat(S)_(t o t)] = [H,hat(S)_1] = [H,hat(S)_2] =0 $. 
  We know that we need 4 operators to form a Complete Set of Commuting Observables(CSCO). Let us define
  $hat(S)_z = hat(S)_(1 z) + hat(S)_(2 z)$. We know that Spin angular momentum also follows total angular momentum
  commutation relations. From the addition of angular momenta relations, we get
  $ &[vb(S)_(t o t)^2, S_z]= 0 \
  => &[H, S_z] = 0 $
  Let us denote our eigenstates as $| s, m_s; s_1, s_1 ar$ where we have 
  $ 
    vb(S)_(t o t)^2|s, m_s; s_1, s_2 ar &= s(s+1)hbar^2|s, m_s; s_1, s_2 ar\
    vb(S)_1^2|s, m_s; s_1, s_2 ar &= s_1(s_1+1)hbar^2|s, m_s; s_1, s_2 ar = 3/4 hbar^2|s, m_s; s_1, s_2 ar\ 
    vb(S)_2^2|s, m_s; s_1, s_2 ar &= s_2(s_2 +1)hbar^2|s, m_s; s_1, s_2 ar = 3/4 hbar^2|s, m_s; s_1, s_2 ar\
    S_z|s, m_s; s_1, s_2 ar &= m_s hbar |s, m_s; s_1, s_2 ar
  $
  We can then write our reformed hamiltonian as 
  $ hat(H) = J/2(vb(S)_(t o t)^2 - 3/2 hbar^2 II) $<refham>
  We can see that the energy eigenvalue is independent of $m_s$, thus the levels with same $m_s$ are degenerate.
  We have already seen before that this is the addition of two spin 1/2 momenta we thus get the 
  eigenstates
  
  #set math.cases(reverse: true)
  #underline("Singlet State")
  $ |0,0 ar = 1/sqrt(2)(ket(arrow.t arrow.b) - ket(arrow.b arrow.t )  quad[E_(S=0) = -3/4 J hbar^2] $
  #underline("Triplet State")
  $ cases(|1","1 ar = ket(arrow.t arrow.t), ket(1","0) = 1/sqrt(2) [ket(arrow.t arrow.b ) + ket(arrow.b arrow.t)], ket(1","-1) = ket(arrow.b arrow.b) )= [E_(S=1) = 1/4 J hbar^2]  $
]
#answer[
  The operator $vb(S)_(t o t)(hat(n)) = n_x S_x + n_y S_y + n_z S_z$. Let us now calculate the expectation value of
  $vb(S)_(t o t)(hat(n))$ in the ground singlet state.
  $ expval(vb(S)_(t o t)(hat(n))) &= n_x bra(0","0)S_x ket(0","0) + n_y bra(0","0) S_y ket(0","0) + n_z bra(0","0)S_z ket(0","0) \ 
  &= n_x/2 bra(0","0)S_+ + S_- ket(0","0) + n_y/(2i) bra(0","0) S_+ - S_- ket(0","0)\ 
  &=0 $
  We can see that the expectation value is independent of the value of the $hat(n)$ and thus is exhibits 
  SU(2) symmetry.
]
#answer[
  We now calculate the magnetisations of the three excited states 
  $ expval(vb(S)_(t o t)(hat(n))) &= n_x bra(1","m)S_x ket(1","m) + n_y bra(1","m) S_y ket(1","m) + n_z bra(1","m)S_z ket(1","m) \ 
   &= n_z bra(1","m) S_z ket(1","m)  $
  The total magnetisation for the triplet excited states are
  #set math.cases(reverse: false)
  $ expval(vb(S)_(t o t))= cases(n_z quad quad &m=1,0 quad  quad& m=0, -n_z quad quad & m=-1 ) $
  Classically ferromagnets are magnets with all dipoles aligned in the same direction. Thus the expectation value in the $hat(z)$ direction is non zero. 
  Thus we have $ket(1","1)$ and $ket(1","-1)$ to be classical ferromagnets.

  To adequately describe the singlet state we would require another operator called the staggered magnetism operator which gives us anti-ferromagnets. This results in the
  singlet states being antiferromagnetic.
]

= Broken symmetry and a quantum "phase" transition in a toy model

#answer[
  We have already calculated for the above Hamiltonian. The new Hamiltonian has a small modification over the
  previous one. Using @refham, The new Hamiltonian simplifies to
  $ hat(H) &= J(vb(S)_1 dot vb(S)_2) + B(S_1^z + S_2^z) \ 
  & = J/2(vb(S)_(t o t)^2 - 3/2 hbar^2 II) + B S_z
  $
  The eigenstates are the same with different eigenvalues for energy. We can see that the introduction of the magnetic field
  dependence lifts the degeneracy we saw in the previous step. The Energy eigenvalues are given below\

  #underline("Singlet State") #h(3.0em)$ket(0","0) --> E_(0,0) = -3/4 J hbar^2$

  #underline("Triplet States")
  $ s=1 : cases(ket(1","1) &-->E_(1,1)=1/4 J hbar^2+B hbar,ket(1","1) &--> E_(1,1)=1/4 J hbar^2 ,ket(1","-1) &--> E_(1,-1)=1/4 J hbar^2 - B hbar) $
  #figure(image("evsb.png",width : 120%), caption : [Variation of Energy eigenvalues with $B/hbar$ for both $J>0$ and $J<0$ ]) 
]
#answer[
  We have $J>0, B>0$. From the plot it be can be easily seen that the state $ket(1","-1)$ crosses the state
  $ket(0","0)$
  $ 1/4 J hbar^2 -B hbar = -3/4 J hbar^2 => B = J hbar $
  Before the crossing the ground state was $ket(0","0)$, which after crossing become $ket(1","-1)$. This causes 
  symmetry breaking. As we saw in Q1 $ket(0","0)$ has SU(2) symmetry, but $ket(1","-1)$ does not have 
  SU(2) symmetry. Thus the ground state no longer has SU(2) symmetry.
]
  #answer[
    If we take $J<0$, as shown in the graph, there is no "phase" transition taking place. $ket(1","-1)$ is
    always the ground state. In this case however, the ground state doesnt exhibit SU(2) symmetry.

    #h(1.0em) This can also be expected as 
    again if we consider the staggered magnetism operator, $ket(0","0)$ is an antiferromagnetic state. That means that the state has equal spins in opposite directions.
    However the state $ket(1","-1)$ is ferromagnetic and has a preferred direction. This causes symmetry breaking.
]
=  Gentle introduction to entanglement: the singlet state

#answer[
 #set math.vec(delim: "[")
 #set math.mat(delim: "[")
  The singlet state is given as $ket(chi) = 1/2(ket(arrow.t arrow.b) - ket(arrow.b arrow.t))$. We will be using the Pauli-Matrix
  representations. From $HH(2)$,a 2-dimensional hilbert space, the eigenstates of the $S_z$ are represented as

  $ 
    ket(arrow.t) = vec(1,0) quad quad ket(arrow.b) = vec(0,1)
  $
  For the two interacting spins, there are two independent 2-dimensional Hilbert spaces, so we know that $ket(arrow.t arrow.t) = ket(arrow.t) tc ket(arrow.t),ket(arrow.b arrow.b) = ket(arrow.b) tc ket(arrow.b)ket(arrow.t arrow.b) = ket(arrow.t) tc ket(arrow.b)$ and $ ket(arrow.b arrow.t) = 
  ket(arrow.b) tc ket(arrow.t)$. So we represent all the direct product states
  $ ket(arrow.t arrow.t) = vec(1,0) tc vec(1,0) = vec(1,0,0,0) #h(5em) ket(arrow.b arrow.b)= 
  vec(0,1) tc vec(0,1) = vec(0,0,0,1) \

 ket(arrow.t arrow.b) = vec(1,0) tc vec(0,1) = vec(0,1,0,0) #h(5em) ket(arrow.b arrow.t)= 
  vec(0,1) tc vec(1,0) = vec(0,0,1,0) $
  In the matrix representation , the singlet state is given as
  $ ket(chi) = 1/sqrt(2) {vec(0,1,0,0)- vec(0,0,1,0)} = 1/sqrt(2) vec(0,1,-1,0) $

  The density matrix representation of the singlet state is given as
  $ rho = ketbra(chi,chi) = 1/2 vec(0,1,-1,0)(0,1,-1,0) = 1/2 mat(0,0,0,0;0,1,-1,0;0,-1,1,0;0,0,0,0) $
]
#answer[
 #set math.mat(delim: "[")
  The density matrix $rho in L(HH_1(2) tc HH_2(2))$ where $L(HH_1(2) tc HH_2(2))$ is the dual of the direct product 
  space. The reduced density matrix elements defined as $rho_1 in L(HH_1(2))$ is given as 
  $ bra(a) rho_1 ket(b) = sum_n [bra(a) tc bra(n) ]rho [ket(n) tc ket(b)] $
  where $ket(a),ket(b)$ are the orthonormal eigenkets of $HH_1(2)$ and $ket(n)$ are the eigenstates
  of $HH_2(2)$. Thus the matrix elements of $rho_1$ are given as
  $ bra(arrow.t)rho_1 ket(arrow.t) = bra(arrow.t arrow.t)rho ket(arrow.t arrow.t) + bra(arrow.t arrow.b)rho ket(arrow.t arrow.b) = 1/2 
   quad quad quad bra(arrow.t)rho_1 ket(arrow.b) = bra(arrow.t arrow.t)rho ket(arrow.b arrow.t) + bra(arrow.t arrow.b)rho ket(arrow.b arrow.b) = 0 \ 
    bra(arrow.b)rho_1 ket(arrow.t) = bra(arrow.b arrow.t)rho ket(arrow.t arrow.t) + bra(arrow.b arrow.b)rho ket(arrow.t arrow.b) = 0 
   quad quad quad bra(arrow.b)rho_1 ket(arrow.b) = bra(arrow.b arrow.t)rho ket(arrow.b arrow.t) + bra(arrow.b arrow.b)rho ket(arrow.b arrow.b) = 1/2
$
  The reduced density matrix is 
  $ rho_1 = 1/2 mat(1,0;0,1) =  1/2 II $
]
#answer[
  The eigenvalues of the reduced density matrix $rho_1$ are $lambda_1 = lambda_2 = 1/2$. Thus the Entanglement
  Entropy(EE) of the first state 
  $ S_1 = -Tr[rho_1 ln rho_1] = - sum_i lambda_i ln lambda_i = -2(1/2 ln 1/2) = ln 2 $
  We have that the maximum EE of a two component system is $ln 2$. This tells us that the singlet spin state
  is maximally entangled.
]
#answer[
 #set math.mat(delim: "[")
  We want to find the EE of the state $ket(chi(theta)) = cos(theta)ket(arrow.t arrow.b) + sin(theta)ket(arrow.b arrow.t)$ with the first
  spin state. For this we need to the find the reduced density matrix over the second spin.
  The density matrix is 
  $ rho = mat(0,0,0,0;0,cos^2 theta, cos theta sin theta,0; 0,cos theta sin theta, sin^2 theta, 0;0,0,0,0)
  $

The reduced density matrix is given by $rho_1$
  $ rho_1 = mat(cos^2 theta, 0; 0, sin^2 theta) $
  We want to find the EE of this state. The eigenvalues of $rho_1$ are $lambda_1 = cos^2 theta, lambda_2 = sin^2 theta$. The 
  entanglement Entropy (EE) is given as 
  $ S_1(theta)= -sum_i lambda_i ln lambda_i = -cos^2 ln (cos^2 theta) - sin^2 ln(sin^2 theta) $
  The graph of $S_1(theta)$ vs $theta$ to find states of maximal EE is given as 
  #figure(image("s1.png", width: 120%), caption :[Entanglement Entropy vs $theta$])

  The minimal EE is given as $theta = 0, pi/2 ,pi, (3pi)/2$ with $S_1 = 0$ where the corresponding states 
  are not entangled.\
  The maximal EE is given as $theta = pi/4, (3 pi)/4,(5 pi)/4 , (7 pi)/4$ with $S_1=ln 2$, where the corresponding
  states are maximally entangled.

  The states with minimal and maximal entanglement are
#let vimg1 = {
  figure(table(
  columns: (auto,auto),

  table.header[$theta$][States $S_1(theta) = 0quad$],
  [$0$], [$ket(arrow.t arrow.b)$],
  [$pi/2$], [$ket(arrow.b arrow.t)$],
  [$pi$], [$-ket(arrow.t arrow.b)$],
  [$(3 pi)/2$], [$-ket(arrow.t arrow.t)$],
), caption: "Minimal entanglement states")

    
}
#let vimg2 = {
  figure(table(
  columns: (auto,auto),

  table.header[$theta$][States $S_1(theta) = ln 2 quad$],
  [$pi/4$], [$ket(1","0)$],
  [$(3 pi)/4$], [$-ket(0","0)$],
  [$(5 pi)/4$], [$-ket(1","0)$],
  [$(7 pi)/4$], [$ket(0","0)$],
), caption: "Maximal entanglement states")
    
}

#figure(
    grid(
        columns: 2,     // 2 means 2 auto-sized columns
        gutter: 2mm,    // space between columns
        vimg1,
        vimg2,
    ),
)
]





