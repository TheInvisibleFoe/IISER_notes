
#import "imports.typ":*


= Kramers and Wannier Duality relations
Before the complete solution to the 2D Ising model was published by Onsager , Kramers and Wannier provided the critical temperature of the model, using the duality relations of the model. They showed a relation between the high and low temperature expansions of the model. 

== Duality relation on a square lattice
Let us consider the duality relations of the 2D ising model on a square lattice. We can locate this temperature by considering the duality relations of the model. 

Consider the 2D Ising model on a square lattice $fl$ with the Hamiltonian with periodic boundary conditions,
$
  H = -J sum_{i,j} sigma_i sigma_j -J' sum_{i,k} sigma_i sigma_k
$
where the first sum of spins is over nearest horizontal neighbors $(i,j)$ and the second sum is over nearest vertical neighbors $(i,k)$. 
The periodic boundary conditions imply that the first row is just below the last row and the first column is just to the right of the last column. This is equivalent to a torus.
The partition function can be given as,
$
  Z &= sum_{sigma} exp(-beta H)\
  &= sum_{sigma} exp(K sum_{i,j} sigma_i sigma_j + L sum_{i,k} sigma_i sigma_k )
$<pfn>
We now represent the partition into two similar representations and then find the relation between them, from which we get the critical temperature of the model.

=== Low temperature expansion

Consider the lattice $fl$.  To make the lattice a square one, we force a constraint which makes the number of rows as the same as the number of rows $M$.
Then draw an edge if the spins $sigma_i$ and $sigma_j$ are the same where $i,j$ are nearest neighbors. Let the number of unlike horizontal pairs be $s$ and the number of unlike vertical pairs be $r$.

Then draw an edge if the spins $sigma_i$ and $sigma_j$ are the same where $i,j$ are nearest neighbors.
Then the graph of $fl$ has $M-s$ horizontal edges and $M-r$ vertical edges.
Each summand in the partition function can then be written as,
$
  exp[K (M-2s) + L (M-2r)]\
$
#figure(
  image("assets/ising_dual.png",width : 50%),
  caption : [The lattice $fl$ in dark with filled-in sites and the dual lattice $fl_D$ in light with empty sites. ]
)<dualpic>
We now map a configuration on the lattice $fl$ to its dual $fl_D$ (see above @dualpic). The lattice $fl$ has edges connecting like spins. The sites of $fl_D$ are drawn at the centers of the squares in $fl$. If there is no edge between two sites in $fl$, draw the corresponding edge in $fl_D$ which crosses the hypothetical  edge in $fl$ perpendicularly. Note that this edge in $fl_D$ separates two unlike spins. This generates a set of edges in $fl_D$ have a one-to-one correspondence with the edges in $fl$. Thus, there are $M-s$ horizontal edges and $M-r$ vertical edges in $fl_D$. We can regard the spins in $fl$ to be on the faces of $fl_D$.

One can observe that in any specific row of $fl_D$, there must be an even number of edges. This can be shown to be true, by contradiction. Suppose there is only one edge in a row. Thus, the spins on the left and right of this edge must be different.  The lattice $fl$ has periodic boundary conditions. This implies that the spins on the left and right of this edge must be the same. This is a contradiction. One can extend this argument to any number of odd spins, by noting that the spins left and right of sections which have an even number of edges between them are the same. Thus, there must be an even number of edges in each row of $fl_D$. The square lattice $fl$ and correspondingly the dual lattice $fl_D$ is the same if you rotate by 90 degrees. Thus, the number of edges in each column of $fl_D$ must also be even. 
#figure(
  image("assets/ising_islands.png",width : 50%),
  caption : [The polygons in $fl_D$ formed by the edges. Observe that regions of up $(+)$ spins and down $(-)$ spins are separated by these polygons. ]
)
As a result of this, the edges can be connected to form polygons. A subtle edge case where you cannot form polygons would be when you have three consecutive rows of alternating spins. One way to form polygons from this without violating anything in the previous argument. Consider that the end column has two pseudo-edges on the left and the right, on after the last spin and one before the first spin. Since the three rows alternate in the signs of the spins, we can form a rectangle using the edges above and below the first row and the edges to the left of the first row and to the right of the last row. This rectangle is a polygon in $fl_D$ and does not violate the argument that there must be an even number of edges in each row and column. 

Thus these polygons in $fl_D$ separate this lattice into regions of up spins and down spins. Given a configuration of polygons, there are two spin configurations corresponding to it. The two spin configurations are obtained by flipping the spins in the regions of up spins and down spins. The partition function can be written as,
$
  Z = 2 exp(M(K+L)) sum_(P in fl_D) exp(-2 L r -2 K s)
$
where $P$ is the set of polygons in $fl_D$ and $s$ and $r$ are the number of horizontal and vertical edges in $P$. This is called the low temperature expansion of the partition function because for low temperatures the maximum contribution comes from $r=s=0$, because $K,L$ are large and positive.

#result("Low Temperature Expansion")[
  The low temperature expansion of the partition function is given by,
  $
    Z = 2 exp(M(K+L)) sum_{P in fl_D} exp(-2 L r -2 K s)
  $
  where $P$ is the set of polygons in $fl_D$ and $s$ and $r$ are the number of horizontal and vertical edges in the polygon $P$.
]<ltempZ>

=== High temperature expansion
Now we consider the high temperature expansion of the partition function. Let us consider $exp(K sigma_i sigma_j)$. $sigma_i, sigma_j$ can only take the values $plus.minus 1$. Observe that $(sigma_i sigma_j)^2 = 1$. Taking the exponential and expand the Taylor series for the exponential, we obtain,
$
  exp(K sigma_i sigma_j) &= cosh(K) + sigma_i sigma_j sinh(K) 
$
This means that we can write the partition function @pfn as,
$
  Z  = (cosh(K) cosh(L))^M sum_{sigma} product_(i,j) (1 + v sigma_i sigma_j) product_(i,k) (1 + w sigma_i sigma_k)
$
where $v = tanh(K)$ and $w = tanh(L)$. The first product is over the horizontal nearest neighbors and the second product is over the vertical nearest neighbors. There is an excellent representation of the terms in the partition function in terms of a graph. 

Consider the two products,
#nonum(
$
  product_(i,j) (1 + v sigma_i sigma_j) product_(i,k) (1 + w sigma_i sigma_k)
$
)
Note that there are $2^M$ terms in the expanded product. We can create a graph on the lattice $fl$ for each term in the product. Take any term in the product and then made a graph on the lattice $fl$ by following the following rules,
1. If the term contains  $v sigma_i sigma_j$, then draw a horizontal edge between the sites $i$ and $j$.
2. If the term contains  $w sigma_i sigma_k$, then draw a vertical edge between the sites $i$ and $k$.

Each horizontal and vertical nearest neighbor spin pair contributes to each term in the expansion. A vertical edge $(i ,k)$ can provide a contribution of either $w sigma_i sigma_k$ or $1$ to the term. Similarly, a horizontal edge $(i,j)$ can provide a contribution of either $v sigma_i sigma_j$ or $1$ to the term. Thus, each term in the expansion corresponds to a graph on the lattice $fl$.
Then each term in the expansion can be written in the form 
$
  v^r w^s sigma_1^(n_1) sigma_2^(n_2) ... sigma_N^(n_N)
$
where $r$ is the number of horizontal edges, $s$ is the number of vertical edges, $n_i$ is the number of edges that go into the site $i$. We can now sum over all the spin configurations ${sigma}$ and each $sigma_i$ can only take values $plus.minus 1$. This implies upon summing over all the spin configurations only the terms where $n_i$ is even will contribute to the sum. If any $n_i$ is odd, consider the two spin configurations $sigma_i = plus 1$ and $sigma_i = minus 1$, keeping the rest of the spins the same. The two terms will cancel each other out. Thus, only the terms are considered which have an even number of edges going into each site. We can reduce this further. In the remaining terms, flipping one spin will not change the value of the term. If the spin site already contributes nothing to the term, flipping it does not matter and if the spin site contributes an even edge number to the term flipping the spin also remains the same because $sigma_i^(2n) = 1$. Thus, we have a degeneracy of $2^N$ for each term. 

Thus the partition function can be written as,
#nonum($
  Z = 2^N (cosh(K) cosh(L))^M sum_{r,s} v^r w^s
$)
where the sum is over all the graphs on the lattice $fl$ with $r$ horizontal edges and $s$ vertical edges. Note the terms only contribute if the number of edges going into each site is even. These are constructed into polygons as described in the low temperature expansion. The sum over the horizontal and vertical edges then becomes a sum over the polygons in the lattice $fl$. The high temperature expansion of the partition function can then be written as,
$
  Z = 2^N (cosh(K) cosh(L))^M sum_{P in fl} v^(r(P)) w^(s(P))
$

#result("High Temperature Expansion")[
  The high temperature expansion of the partition function is given by,
  $
    Z = 2^N (cosh(K) cosh(L))^M sum_{P in fl} v^(r(P)) w^(s(P))
  $
  where $P$ is the set of polygons in $fl$ and $r(P)$ and $s(P)$ are the number of horizontal and vertical edges in the polygon $P$.
]<htempZ>

== Duality Relation 
The two expansions of the partition function can be equated to obtain a relation between the low and high temperature expansions. The low temperature expansion @ltempZ and the high temperature expansion @htempZ are very similar except that the low temperature expansion has a summation over the polygons in the dual lattice $fl_D$ and the high temperature expansion has a summation over the polygons in the lattice $fl$. The two lattices $fl$ and $fl_D$ only differ at the boundary conditions, which should not matter in the thermodynamic limit. Thus, the free energy per site obtained using either expression must be equal.

Let the rescaled free energy per site be represented with $k_B T phi$, 
$
  - phi = lim_{N --> oo} N^(-1) ln Z_N
$
Note that if we consider the lattice $fl$ then the number of horizontal or vertical edges $M$ is equal to $N - sqrt(N)$. For the lattice with periodic boundary conditions $M$ is equal to $N$. In both cases if we take the thermodynamic limit $N --> oo$, the limit $M\/N --> 1$. Using @ltempZ and @htempZ, we can write the free energy per site as,
$
  - phi &= K + L + Phi(e^(-2L),e^(-2K))\
  &= ln(2 cosh(K) cosh(L)) + Phi(tanh(K), tanh(L))
$<freeeq>
where $Phi(x,y)$ is the function defined as,
$
  Phi(x,y) = lim_(N --> oo) N^(-1) ln sum_{P in fl} x^(r(P)) y^(s(P))
$
If we perform a suitable variable substitution, the two free energies are equal.
$
  tanh(K^*) &= exp(-2L) \ 
  tanh(L^*) &= exp(-2K)
$<drvarsub>
We obtain from @freeeq and @drvarsub, the duality relation,
$
  & phi(K,L) + K+L = phi(K^*,L^*) + ln(2 cosh(K^*) cosh(L^*)) \
  ==> &phi(K^*,L^*) = phi(K,L) + K + L - ln(2 cosh(K^*) cosh(L^*))
$<dualrel>
Observe the relation @drvarsub maps high temperature coefficients to low temperature coefficients and vice versa. $tanh(x)$ is a monotonically increasing function. If $K^*,L^*$ are high (which means low temperature),
then $K,L$ are low (which means high temperature). This is the duality relation of the 2D Ising model.
We can cast this into a much more symmetric and useful form.

Using the first relation in @drvarsub
$
  &tanh(K^*) = exp(-2L) \
  ==> & sinh(2K^*) = (2 e^(-2L))/(1 - e^(-4L))\
  ==> & sinh(2K^*) sinh(2L) = 2 e^(-2L)/(1 - e^(-4L)) (e^(2L) - e^(-2L))/2 \
  ==> & sinh(2K^*) sinh(2L) = 1
$
A similar calculation can also be done for the second relation in @drvarsub. We obtain the more useful form of the duality relations,
$
  sinh(2K^*) sinh(2L) = 1 \
  sinh(2K) sinh(2L^*) = 1
$<symdr>
Also observe $sinh(2K^*) sinh(2L^*) = (sinh(2K) sinh(2L))^(-1)$. Using this we can recast @dualrel into a much nicer form, the usefulness of which we will see just later.
$
  & phi(K^*,L^*) = phi(K,L) + K + L - ln(2 cosh(K^*) cosh(L^*)) \
  ==> & phi(K^*,L^*) = phi(K,L) - 1/2 ln(4 cosh^2(K^*) cosh^2(L^*) tanh(K^*) tanh(L^*)) \
  ==> & phi(K^*,L^*) = phi(K,L) - 1/2 ln(sinh(K^*) sinh(L^*)) \
  ==> & phi(K^*,L^*) = phi(K,L) + 1/2 ln(sinh(2K) sinh(2L)) 
$
The duality relations between the dual lattice $fl_D$ and the lattice $fl$ in terms of the variables $K$ ,$L$, $K^*$ and $L^*$ are given by,
$
  & sinh(2K^*) sinh(2L) = 1 \
  & sinh(2K) sinh(2L^*) = 1 \
  & phi(K^*,L^*) = phi(K,L) + 1/2 ln(sinh(2K) sinh(2L))
$<dsymrel>

Now we arrive at our main point, the argument to find the critical temperature of the 2D Ising model. Consider the Isotropic case when $J = J'$ which implies $K = L$ and $K^* = L^*$.  At the critical point the free energy per site should be non-analytic function of $T$ and thus of $K$. If the free energy is non-analytic for some $K = K_c$, then it should also mean that the free energy is non-analytic for $K^* = K_c^*$.  Generally this should correspond to a different value of $K^*$, but if there is only one critical temperature, then that would be at $K^* = K_c^* = K_c$. Note that the free energy functionals at the critical point should be equal, even for the anisotropic case, because $sinh(2K) sinh(2L) = 1$. The critical temperature is then given by the condition,
$
  & sinh(2K_c) = 1 \ 
  ==> & e^(2K_c) = 1 + sqrt(2)  \
  ==> & K_c = ln(1 + sqrt(2))/2 \
  ==> & T_c = J/(k_B ln(1 + sqrt(2))\/2) \
  ==> & T_c approx 2.69185 J/k_B
$<critsqlat>
#figure(
  image("assets/sinh2KL.png", width: 80%),
  caption: [
    The duality relation $sinh(2K) sinh(2L) = 1$ in the $K-L$ plane. The critical line is shown in blue. The duality relation maps the region $I$ to the region $I I$ and vice versa. The critical line is the line where the free energy remains the same under the duality transformation.]
)

For the anisotropic case, see the figure below the duality relation maps region $I$ to region $I I$ and vice versa. The free energy remains the same under the duality transformation on the line 
$ 
  sinh(2K)sinh(2L) = 1 
$<critline>
 Thus, if there is only one line of critical points for the anisotropic 2D Ising model, it must be on this line.

#result("Critical Temperature of the 2D Ising Model")[
  The duality relations between the high and low temperature expansions are given by,
  #nonum($
    sinh(2K^*) sinh(2L) = 1 \
    sinh(2K) sinh(2L^*) = 1 \
    phi(K^*,L^*) = phi(K,L) + 1/2 ln(sinh(2K) sinh(2L))
  $)
  Using these, if there is only critical point the critical temperature of the 2D Ising model is given by,
  $ T_c &= J/(k_B ln(1 + sqrt(2))\/2) \ 
  & approx 2.69185 J/k_B $.
]<critT>

We can extend these duality relations on the square lattice to other types of lattices as well. The solution to the 2D Ising model by Baxter relies on the Honeycomb-Triangular duality relations and the star-triangle relations.
