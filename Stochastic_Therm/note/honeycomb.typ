#import "imports.typ":*

#let hl = $frak(H)$
#let tl = $frak(T)$


= Honeycomb-Triangular Duality
The Ising model can be constructed on any lattice, the ones of our concern here are the honeycomb and the triangle lattices. Unlike the square lattice which is self-dual, the honeycomb lattice is dual to the triangular lattice and vice versa. 


#figure(
  image("assets/honey_tri_dual.png",width : 50%),
  caption : [The honeycomb lattice with sites in red and black and the triangular lattice sites in turqoise formed by duality. ]
)<honeytri>

The different colors on the honeycomb lattice  in @honeytri show the fact that it is a bipartite graph. 
#definition("Bipartite Graph")[
A bipartite graph is a graph whose vertices can be divided into two disjoint sets such that every edge connects a vertex in one set to a vertex in the other set. 
]<bipartite>
In the case of the honeycomb lattice, the vertices can be colored red and black such that no two adjacent vertices have the same color. This just means that the red vertices are only connected to the black vertices and vice versa.

The honeycomb lattice $hl$ is defined on $N$ sites and in general depends on three interaction coefficients. The square lattice $fl$ has two interaction coefficients in two directions $J$ and $J'$. The edges in $hl$ has edges in three directions with interaction coefficients $-k_B T L_i$ where $i in {1,2,3}$. The labels in @starrellab show the directions of the edges in the honeycomb lattice. The 2D Ising model on the honeycomb lattice $hl$ takes the following partition function for $N$ sites,
$
  Z_N^hl ({sigma}) = sum_(sigma) exp( L_1 sum_(i,j) sigma_i sigma_j + L_2 sum_(i,k) sigma_i sigma_k + L_3 sum_(i,l) sigma_i sigma_l )
$<pfnhoney>
The first summation is over the edges in the direction labelled by $L_1$, the second summation is over the edges in the direction labelled by $L_2$ and the third summation is over the edges in the direction labelled by $L_3$. 

The partition function for the triangular lattice $tl$ is defined similarly with interaction coefficients $-k_B T K_i$ where $i in {1,2,3}$. The edges in the triangular lattice are labelled by $K_1$, $K_2$, and $K_3$ as shown in @starrellab. The partition function for the triangular lattice is given by,
$
  Z_N^tl ({sigma}) = sum_(sigma) exp( K_1 sum_(i,j) sigma_i sigma_j + K_2 sum_(i,k) sigma_i sigma_k + K_3 sum_(i,l) sigma_i sigma_l )
$<pfntri>
The first summation is over the edges in the direction labelled by $K_1$, the second summation is over the edges in the direction labelled by $K_2$ and the third summation is over the edges in the direction labelled by $K_3$. The indexing is done so as the edges labelled by $L_i$ are in a direction perpendicular to the edges labelled by $K_i$.

#figure(
  image("assets/edge_star.png", width: 50%),
  caption: [The directions are in the edges labelled by $L_1$, $L_2$, and $L_3$ for the honeycomb lattice. The red and black vertices are the two sets of the bipartite graph. The directions are in the edges labelled by $K_1$, $K_2$, and $K_3$ for the triangular lattice. ]
)<starrellab>

#figure(
  image("assets/polygon_tri.png", width: 50%),
  caption: [Polygons in the triangular lattice seperate up spin regions from the down spin regions in the honeycomb lattice. ]
)<edgestar>

Following a similar argument to that of the square lattice ising model, we can form polygons on the dual triangular lattice $tl$ of the honeycomb lattice $hl$. Observe from @startridiag that each black vertex can map to one vertex in the triangular lattice. There is certain row-like structure in the honeycomb lattice $hl$, with alternating red and black vertices. Thus, a triangular lattice of $N$ is the dual lattice of a honeycomb lattice of $2N$ vertices. We now perform a low temperature expansion of the honeycomb lattice with $2N$ sites,
$
  Z_(2N)^hl ({K}) = 2 exp(N(L_1 +L_2 +L_3)) sum_(P in tl) exp(-2L_1 r_1 - 2L_2 r_2 - 2L_3 r_3) 
$<ltemphcomb>
The summation is over the polygons in the triangular lattice $hl$ with $r_i$ being the number of edges in the polygon in the direction labelled by $L_i$. Note that for $2N$ sites the number of horizontal edges is $N$.

Performing a high temperature expansion for the triangular lattice $tl$ for $N$ sites, we obtain,
$
  Z_N^tl ({K}) = (2 cosh(K_1) cosh(K_2) cosh(K_3))^N sum_({P in tl}) v_1^(r_1) v_2^(r_2) v_3^(r_3)
$
where $v_i = tanh(K_i)$ for $i in {1,2,3}$. In the thermodynamic limit, this summation over polygons will be the same as the summation over polygons in @ltemphcomb. Comparing the two expansions we obtain the following relation holds true,

$
  Z^hl_(2N) ({L}) = (2 s_1 s_2 s_3)^(N\/2) Z_N^tl ({K})

$<dualrelht>
where 
$
  s_i &= 1/2 exp(2L) sech^2(K_j)\
&=sinh(2L_j) = (sinh(2K_j))^(-1) quad quad quad j in {1,2,3}
$
if the following relations hold,
$
  tanh(K_j) = exp(-2L_j) quad quad quad j in {1,2,3}
$
Similar to the square lattice, this is the duality relations between the honeycomb and triangular lattices. This maps the high temperature expansion of the honeycomb lattice to the low temperature expansion of the triangular lattice and vice versa. 

#result("Honeycomb-Triangular Duality")[
The honeycomb lattice $hl$ is dual to the triangular lattice $tl$ and vice versa. The high temperature expansion of the honeycomb lattice with $2N$ sites is equal to the low temperature expansion of the triangular lattice with $N$ sites and vice versa.

The relation between the two partition functions on the honeycomb $hl$ and triangular $tl$ lattices is given by,
$
  Z^hl_(2N) ({L}) = (2 s_1 s_2 s_3)^(N\/2) Z_N^tl ({K})

$
where 
$
  s_i &= 1/2 exp(2L) sech^2(K_j)\
&=sinh(2L_j) = (sinh(2K_j))^(-1) quad quad quad j in {1,2,3}
$
if the following relations hold,
$
  tanh(K_j) = exp(-2L_j) quad quad quad j in {1,2,3}
$
]


This is not enough for us to locate the critical point of the Ising model on $hl$ or $tl$. This maps a high temperature expansion of $hl$ to a low temperature expansion of $tl$ and vice versa. The star triangle relation derived just after this maps a low temperature expansion of $hl$ to a low temperature expansion of $tl$ and vice versa. Using the relations in this section and the star triangle relations in the next section, we can also locate the critical point of the 2D Ising model on $hl$ and $tl$.

