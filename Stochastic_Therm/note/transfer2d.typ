
#import "imports.typ": *

= Transfer Matrices for the 2D Ising Model Problem
<tmatprops>

#remark("Motivation")[
  This derivation is done in a bottom up approach, meaning we build up will the tools and details that are required to solve the model later on. There are properties of the Transfer matrix that we will derive later. I will try to provide justification as and when possible. One can also start by reading @Tcsection, and then refer to the relevant properties in @tmatprops to better understand the motivation for the properties.
]

The way we will solve for the eigenvalue is by using the Transfer Matrix method. The square lattice will be taken and rotated by $pi/4$,[cf @sql_rot]. Then we will find some properties of the matrices which will help us determine the eigenvalues.

#subpar.grid(
  figure(image("assets/sq_latt.png", width:50%), caption: []), <sql_a>,
  figure(image("assets/rot_sq_latt.png", width:90%), caption:[] ), <sql_b>,
  columns:(1fr,1fr),
  caption: [(a) The square lattice $fl$ with interaction coefficients $K$ and $L$ in different directions. (b) The same square lattice drawn diagonally $fl_R$.  The filled and not filled in circles are drawn in both the pictures to show how $fl$ to the rotated version],
  label: <sql_rot>,
)

The model will have periodic boundary conditions enforced. Note that $fl_R$ is a bipartite graph, with the filled circles being one set and the hollow ones being the other set. To enforce periodic boundary conditions we put a constraint on $fl_R$ that the number of rows are even. If the first row starts with the filled circles and the top row is with hollow circles. Now if periodic boundary conditions are enforced, the graph will still be bipartite. The free energy is evaluated in the thermodynamic limit, which does not depend on how the number of rows go to infinity. Similarly enforce this conditions on the columns. The rightmost column will be to the left of the first column. Note that if the number of sites in each row is the same, the graph will still be bipartite.


Let us consider a set of three rows, one with black circles and one with white ones. The spin vectors of each of the rows from bottom to top is $phi,phi'',phi'$ in that order. The partition function then, has the term $V_(phi,phi'')W_(phi'',phi')$ Then we define the transfer matrices as,
$
  braket(phi,VV,phi') &= V_(phi,phi') = exp(sum_(j=1)^n [K sigma_(j+1) sigma'_j + L sigma_j sigma'_j])
$<vform>
$
  braket(phi,WW,phi') &= W_(phi,phi) = exp(sum_(j=1)^n [K sigma_(j) sigma'_j + L sigma_j sigma'_(j+1)])
$<wform>
For translational invariance, we will implement toroidal boundary conditions, which entails $sigma_(n+1) = sigma_1$, along with proper row placement, as discussed before.

Let us consider $m times n$ lattice for this. Then using these, we can easily construct the partition function in terms of the transfer matrices,
$
  Z_N &= sum_(phi_1) ... sum_(phi_m) braket(phi_1,VV,phi_2) braket(phi_2,WW,phi_3) ... braket(phi_(m-1),VV,phi_m) braket(phi_m,WW,phi_1)\
  &= sum_phi braket(phi,VV WW ... VV WW, phi) = Tr(VV WW ... VV WW) \
  &= Tr((V W)^(m/2) ) = sum_(j=1)^m Lambda_j^m
$<eigslambda>
where $Lambda_j^2$ is the j-th eigenvalue of the matrix $VV WW$. Note that for the last equality we use Schur's Decomposition theorem, because in general $VV WW$ is not symmetric.

This is where the constraint of even number of rows comes into consequence. If the number of rows is odd, we will have $(VV WW)^k VV$ or $(VV WW)^k WW$ in the end, not the nice form $(VV WW)^k$ which we are using. Note that all the elements of the matrix $VV WW$ are non-negative. Thus, the Perron Frobenius Theorem applies, which states that the largest eigenvalue is positive and its eigenspace in non-degenerate @meyer2000applied. In the thermodynamic limit we then obtain,
$
  Z_N ~ Lambda_(m a x)^(m)
$<pfn2dising>
where $Lambda_(m a x)^2$ is numerically the largest eigenvalue of the matrix $VV WW$. 

== Interchanging Relations
Note that the transfer matrices $VV , WW$ can be regarded as functions of the variables $K,L$. Thus, we have $VV = V(K,L) "and" WW = W(K,L)$. Suppose we consider two sets of interaction coefficients $K,L$ and $K',L'$. We are interested in what happens when we switch the $ K <--> K'$ and $L<-->L'$. Thus, we want to know that when the following relation holds,
$
  V(K,L)W(K',L') = V(K',L') W(K,L)
$<gencomm>

Again using our notation from the previous section of the three rows from the bottom to the top row being denoted by $phi = {sigma_1, ..., sigma_n}, phi'' = {sigma''_1, ...,sigma''_n}, phi' = {sigma'_1,...,sigma'_n}$, we are interested in the matrix element $V_(K,L) W_(K',L')(phi, phi') = braket(phi,VV(K,L), phi'') braket(phi'', WW_(K',L'),phi')$. This is given by
$
  V W(phi, phi') = sum_(sigma''_1) ... sum_(sigma''_n) product_(j=1)^n exp(sigma''_j (K sigma_(j+1) + L sigma_j + K' sigma'_j + L' sigma'_(j+1) ))
$<Xcommute>
Note that this expression inside the product containing the $sigma''_j$ is unique to one summand in the whole sum. Thus, we can write the whole sum in the form of,
$
  V W(phi, phi') = product_(j=1)^n X(sigma_j, sigma_(j+1); sigma'_j, sigma'_(j+1)) "where "X "is given by"\
  X(a,b,c,d) = sum_(f= plus.minus 1) exp[f (L a + K b + K' c + L' d)]
$<xform>
where the variables $a,b,c,d$ take the values $plus.minus 1$. Note that for any number $M$, the expression @Xcommute, remains unchanged under the following transformation,
$
  X(a,b,c,d) mapsto e^(M a c) X(a,b,c,d) e^(-M b d)
$
This is because when we take the product in @Xcommute, the term $e^(M a c) = exp(M sigma_(j) sigma'_j)$ is cancelled by the factor in the previous term, $e^(-M b d) = exp(M sigma_(j-1+1) sigma'_(j-1+1)) = exp(-M sigma_(j) sigma'_j)$. Thus, if we exchange the terms $K <--> K'$ and $L <--> L'$, if we find a number $M$ such that
$
  X'(a,b,c,d) = e^(M a c) X(a,b,c,d) e^(-M b d)
$<xcond>
where $X'$ is of the form @xform with the interaction coefficients swapped. This can be viewed as a nice graph and from this visualization we can easily infer what the number $M$ should be. From star-triangle relation @boltzwform and @startriweight, given three spins ${sigma_1, sigma_2, sigma_3}$, we get the following relation,
$
  w(sigma_i, sigma_j, sigma_k) &= exp(K_1 sigma_j sigma_k + K_2 sigma_k sigma_i + K_3 sigma_i sigma_j)\
  &= R cosh(L_1 sigma_i + L_2 sigma_j + L_3 sigma_k)
$<strel>
for some number R. Then if the both the graphs are equivalent, on transformation from the triangle to star, the corresponding transformed graphs also must be the equivalent. On both the graphs we can see a $(L,K',M)$ triangle. Using the star-triangle relation above, set $ K_1 = L, K_2 = K', K_3 = M$, we get the following relations,
$
  w(c,a,f)& = exp(L f a + K' f c + M a c) = R cosh(L_1 c + L_2 a + L_3 f)\
  w(b,d,f)& = exp(L f b + K' f d + M b d) = R cosh(L_1 b + L_2 d + L_3 f)\
$<strelmodel>

#subpar.grid(
  figure(image("assets/tri_ising.png", width:70%), caption: []), <startri_a>,
  figure(image("assets/star_ising.png", width:70%), caption:[] ), <startri_b>,
  rows: 2,
  caption: [(a)The $L,K',M$ triangles and their corresponding (b) stars ],
  label: <startri_pic>,
)
If we consider the equivalence of the graphs and thus, if $L_1 = K$ and $L_2 = L'$, there exists a number $M$ such that @xcond holds true. This holds if,
$
  sinh(2K) sinh(2L) = sinh(2K') sinh(2L')
$<commcond>
Thus, @gencomm holds true if @commcond is satisfied. 


// The following chunk of algebra should convince you of the same if the graphical argument seems unsatisfactory, however it is correct.

// #theorem("Existence of M")[\
//   Let $L, K, K',L'$ be non negative numbers. Let $phi = {sigma_1, ..., sigma_n}$ and $phi' = {sigma'_1,..., sigma'_n}$. Let the function $h: {-1,1}^n times {-1,1}^n times RR^4_(>=0) --> RR$ , s.t.

//   $
//     h(phi, phi'K,L,K',L') = product_(j=1)^n X(sigma_j, sigma_(j+1); sigma'_j, sigma'_(j+1)) "where "X "is given by"\
//     X(a,b,c,d) = sum_(f= plus.minus 1) exp[f (L a + K b + K' c + L' d)]
//   $
//   Here $a,b,c,d$ can assume the values $plus.minus 1$. Then $exists M$ s.t.
//   $
//     X'(a,b,c,d) e^(M b d)= e^(M a c) X(a,b,c,d)
//   $<exkkpone> where $X'$ is obtained by exchanging $K <--> K'$ and $L<-->L'$ iff
//   $
//     sinh(2K) sinh(2L) = sinh(2K') sinh(2L')
//   $<exkkptwo>
// ]
// #proof()[
//   $(==>)$ Using @exkkpone, @strel and @strelmodel, we get ,
//   $
//     X'(a,b,c,d) e^(M b d) &= sum_{f = plus.minus 1} w(c,a,f) exp(f(K b + L' d ))
//   $<theq1>
//   $
//     e^(M a c) X(a,b,c,d) &= sum_{f = plus.minus 1} w(b,d,f) exp(f(K c + L' a ))
//   $<theq2>
//   Using the second equality from @strel, we obtain @theq1
//   $
//     sum_{f = plus.minus 1} cosh(L_1 c + L_2 a + L_3 f) exp(f(K b + L' d ))
//   $
//   and @theq2 is given by,
//   $
//     sum_{f = plus.minus 1} cosh(L_1 b + L_2 d + L_3 f) exp(f(K c + L' a ))
//   $
//   @exkkpone then gives us, after some algebra,
//   $
//     &e^(L_3) cosh(K c + L' a + L_1 b + L_2 d) + e^(-L_3) cosh(K c + L' a - L_1 b - L_2 d)\
//     = &e^(L_3) cosh(K b + L' d + L_1 c + L_2 a) + e^(-L_3) cosh(K b + L' d - L_1 c - L_2 a)
//   $
//   THIS IS GOING NOWHERE. HAVE TO CHECK THE WHOLE CALCULATION.
// ]


== Inversion Relations
Now we move onto the Inversion Relations. Suppose, $K,L,K',L'$ are given. We are interested in when $V_(K,L) (phi, phi'') W_(K',L') (phi'', phi')$ is a diagonal or a near diagonal matrix. Using @xform, for this to be a diagonal matrix if $a eq.not c$ or $b eq.not d$, $X(a,b;c,d) = 0$. In general this cannot be proved to be true.
However, what can be shown is
$ X(a,b;c,d) = 0 quad "if" quad a eq.not c " and " b=d $<xinvcond>
for certain constraints on $K,L, K',L'$

There are then 4 possibilities

$
  {a,b,c,d} &= {1,1,-1,1}\
  &= {1,-1,-1,-1}\
  &= {-1,1,1,1}\
  &= {-1,-1,1,-1}
$
These result in the following two equations once plugged into @xform and letting $X$ vanish,
$
  cosh(L +K-K'+L') =0
$<invcond1>
$
  cosh(L -K-K'-L') =0
$<invcond2>
Adding and subtracting @invcond1 and @invcond1, we get,
$
  sinh(L-K')sinh(L'+K) &= 0\
  cosh(L-K')cosh(L'+K) &= 0\
$
There are no real solutions. There are two complex solutions. 
The two solutions are
$
  L = K' + i pi / 2 quad quad L' = -K \
$<invsoln>
or
$
  L = K' quad quad L' = -K + i pi / 2 \
$<invsoln2>
We choose, following Baxter, the solution @invsoln. This condition now implies a stronger constraint on the spin chains. Let us only consider the non-zero elements of this matrix. This implies that if $sigma_j, sigma'_j$ are unlike, then $sigma_(j+1), sigma'_(j+1)$ also has to be unlike, for a non-zero element of $V_(K,L) W_(K',L')$. Note in our model we assume periodic boundary conditions. Let us set a pair of spins as our reference, and label it as $(sigma_0,sigma'_0)$.

There are two cases for :
1. *$(sigma_0, sigma'_0)$ are unlike*. This, in turn implies all spin pairs $(sigma_j, sigma'_j)$ must all be unlike. Otherwise, this particular matrix entry in $V W$ is 0.
2. *$(sigma_0, sigma'_0)$ are like*. There are, then 2 possibilities for *$(sigma_1, sigma'_1)$ *. They can be like or they can be unlike. This choice goes on till we encounter the last pair of spins. Suppose at some $0<t <= n$, $(sigma_t, sigma'_t)$ is unlike and for all $0<=j<t$ the spin pairs are like. This implies from the previous condition that for all $j>t$, the spin pairs must be unlike. Then we encounter a problem at the last spin. $(sigma_n, sigma'_n)$ must be unlike. However, $(sigma_0, sigma'_0)$ is a like spin pair. This means that the matrix element will be zero. We appear to be at a contradiction. All of this is resolved if no $t$, where for $t-1$, we have like spins and $t$ we have unlike spins. Thus, it means that if $(sigma_0, sigma'_0)$ are like spins, then the whole spin chain must take the same values. 

Using @invsoln and all like spins, we get,
$
  X_("like") &= cosh(2L + i pi/2)\
  &= 2 i sinh(2L)
$<likesp>
Again using @invsoln and all unlike spins($a eq.not c$ and $b  eq.not d$), for a choice of $a,b$, we obtain,
$
  X_("unlike") = - 2 i a b sinh(2K)
$<ulsp>
As a result of this, we can write out the matrix $VV(K,L) WW(L+i pi \/2 ,-K)$. To this consideration, let us define a matrix whose non-zero elements are those with unlike spins. Thus, we get
$
  R = delta(sigma_0, -sigma'_0) ... delta(sigma_n, -sigma'_n)
$<ulmatdef>
It is also worth noting that $R^2 = II$. Each non-zero element is of the form @xform. For the unlike spin elements note that each spin is taken into consideration twice, as a result of which the dependence on $a "and" b$ vanish. A non-zero element of unlike spins looks like,
$
  & (- 2 i sinh(2K))^n sigma_0 sigma'_0 sigma_1 sigma'_1 sigma_1 sigma'_1 ... sigma_n sigma'_n sigma_0 sigma'_0\
  = & (- 2 i sinh(2K))^n product_(j=0)^n sigma_j^2 sigma'_j^2\
  = & (- 2 i sinh(2K))^n
$<ulelem>
Thus, we obtain, from @ulelem, @ulmatdef, @invsoln, @likesp and @ulsp,
$
  VV(K,L) WW(L+i pi \/2 ,-K) = (2i sinh(2L))^n II + (- 2i sinh(2K))^n R
$<inverserel>


== Symmetries
We will also be looking for the symmetries of the matrices $VV$ and $WW$. If we look at a form of $V$ and $W$ from @vform and @wform, we can see that if we $(K,L) <--> (L,K)$ and swap $phi$ and $phi'$, it would be the same as exchanging $V$ and $W$. Swapping $phi$ and $phi'$, constitutes taking a transpose of the matrix. Thus, we obtain,
$
  V(K,L) &= W^T (L,K)\
  W(K,L) &= V^T (L,K)
$<lkint>
Negating $K$ and $L$ is the same as negating $-phi$ or $-phi'$. Note that $-phi = R phi$ and $-phi' = R phi'$. We obtain,
$
  V(-K,-L) = R V(K,L) = V(K,L) R
$<negKL>
This also implies that $V$ and $R$ commute. A similar relation also holds for $W(K,L)$.

$V$ and $W$ also have some symmetries because of the exponential form. This can be seen if we consider a different formulation. Let $r$ be the number of unlike pairs of spins $(sigma_(j+1), sigma'_j)$ and let $s$ be the number of unlike pairs $(sigma_j,sigma'_j)$. Noting periodic boundary conditions, we can see that for each $r$ there will be a corresponding $s$. This can be easily seen, when one considers the Ising chain with periodic boundary conditions to be a ring of spins. A proof by contradiction can be easily, by assuming that $r+s$ be odd, and then the contradiction should follow due to the choice of boundary conditions. This implies that $r+s$ should be even.

We can reformulate @vform as

We can relax our condition on $n$. Since we later obtain the free energy functional, which is obtained in the thermodynamic limit, it does not matter how we approach infinity. Thus, we can set $ n=2p $<evenchain> and only allow even length of Ising Chains. This allows us to introduce an extra level of symmetry which will help us later. 

When we approach infinity with only even length chains the elements of the $VV$ matrix can be written as,
$
  V(K,L) = exp[plus.minus 2 s' K  plus.minus 2 r' L]
$<vform2>
where $s' = (n-2s)/2$ and $r' = (n-2r)/2$. Note that $s'$ and $r'$ are integers in the range $(0,p)$. Note if we negate $exp(2K)$ or $exp(2L)$, it would be the same, under the condition @vform2. If we displaced $K$ and $L$ by $plus.minus i pi/2$ in the complex plane (which is the same as $exp(plus.minus 2K)--> - exp(plus.minus 2K)$ and similarly for $exp(plus.minus 2L)$), the expression would remain unchanged iff $(n-2s)$ and $(n-2r)$ are even numbers. Thus, we obtain,
$
  V(K plus.minus i pi / 2, L plus.minus i pi / 2) = V(K,L)\
  W(K plus.minus i pi / 2, L plus.minus i pi / 2) = W(K,L)\
$<negklmat>

This form of  the matrix @vform2 allows us to infer more about the eigenvalues of the transfer matrices.
== Commuting Relations
This is the penultimate stop before we embark onto solving the Ising Model. We want to find commuting relations for the transfer matrices $VV$ and $WW$.

Let us again note @vform and @wform. Their forms are very similar. If we take line of column on this tilted lattice, and then shift by one column. Let us define $C$ to be a matrix which does this. This can be defined as a $2^n times 2^n$ matrix, s.t.,
$
  C = delta(sigma_1,sigma'_2)...delta(sigma_n,sigma'_1)
$<cform>

This shifts the columns by one. Let's see what this does for the spin vector $phi$,

$
  phi &= (sigma_1,sigma_2, ... ,sigma_(n-1),sigma_n)^T \
  C phi &= (sigma_2,sigma_3, ... ,sigma_n,sigma_0)^T
$
Note another property of the matrix $C$, which is $C^n = II$.
Our choice of boundary conditions, along with @vform and @wform, we obtain that
$
  VV(K,L) &= C^(-1) VV(K,L) C\
  WW(K,L) &= C^(-1) WW(K,L) C\
$
From @vform and @wform, @cform, we can infer a relation between the matrices $VV$ and $WW$. Shifting the columns and then rearranging we obtain,
$
  braket(phi,VV,C phi') = V_(phi,C phi') &= exp(sum_(j=1)^n [K sigma_(j+1) sigma'_(j+1) + L sigma_j sigma'_(j+1)])\
  & = exp(sum_(j=1)^n [K sigma_j sigma'_j + L sigma_j sigma'_(j+1)]) = braket(phi,WW,phi)
$
This directly implies that $VV$ and $WW$ commute, since $VV$ and $C$ commute.
$
  WW(K,L) = VV(K,L) C
$<vwcommute>
This shows that $VV$, $WW$ and $C$ all mutually commute. Using this we can also see that if @commcond is satisfied,
$
  V(K,L) V(K',L') = V(K',L') V(K,L)
$<vvinvcommute>
This, along with @vwcommute, also implies that
$
  W(K,L) W(K',L') = W(K',L') W(K,L)
$<wwcommute>
Also using, @negKL, we obtain that $VV$ and $WW$, also commute with the negating spin matrix $R$,
$
  VV(K,L) R &= R VV(K,L)\
  WW(K,L) R &= R WW(K,L)
$
So far we have found a set of matrices that mutually commute with each other. Assuming the condition @commcond is satisfied, the set of operators that commute with each other is given below. Let $(K_i,L_i) quad i in I$,where $I$ is some indexing set, be s.t.,
$
  sinh(K_i) sinh(L_i) = k^(-1)
$<commcondk>
for some constant $k$. Then the set of operators that all mutually commute is given as,
$
  {V(K_i,L_i)}_{i in I} union.big {W(K_i,L_i)}_{i in I} union.big {R,C}
$<scoset>
Finally, we can eliminate the matrix $WW$ from @inverserel, to obtain,
$
  VV(K,L) VV(L+i pi \/2 ,-K) C = (2i sinh(2L))^n II + (- 2i sinh(2K))^n R
$<invrelwithoutw>
== Functional relation of the Eigenvalues.

Note the set in @scoset. Since they all commute, they share a common set of eigenvectors. Note that the set of eigenvectors need not be an eigenbasis. Let us choose a common eigenvector $xx$. Note that this eigenvector cannot depend on $K_i,L_i$. This makes sense if we think of it in a different light. Let @commcondk be satisfied for a fixed value of $k$. Then we get a set of ordered pairs $(K_i,L_i)$ all satisfying @commcondk. Then let's define a family of matrices $M_i = V(K_i,L_i)$. Note that even if we change $(K_i,L_i)$ constrained to @commcondk, $xx$ is still an eigenvector of $M_i$. Thus, if we think of it as just a family of commuting set of operators, without any dependence on $K_i,L_i$, $xx$ would still be an eigenvector. However, the family ${V}_{i in I}$ completely changes if $k$ changes in @commcondk. Thus, naturally the eigenvector $xx$ in general should change. As a result, it is natural that the eigenvector $xx$ does not depend on $K_i,L_i$, but it does depend on $k$. The eigenvalue of the matrix $V(K_i,L_i)$ corresponding to $xx(k)$ will in general depend on $(K_i,L_i)$. We obtain the following relations,
$
  V(K,L) xx(k) &= v(K,L) xx(k)\
  C xx(k) &= c xx(k)\
  R xx(k) &= r xx(k)
$<eigs>
Note that from @ulmatdef, $R$ is a symmetric matrix. As a result, $R$ can only assume real eigenvalues @hoffman1971linear. Note from the crucial properties defined under @ulmatdef and @cform, we obtain that,
$
  c^n = r^2 = 1
$
As a consequence, $r$ can only assume the values $r plus.minus 1$. Using @invrelwithoutw , we can rewrite the eigenvalues $v(K,L)$ as a function of $K,L$ and a choice of $r = plus.minus 1$.
$
  v(K,L) v(L+i pi \/2 ,-K) c= (2i sinh(2L))^n + (- 2i sinh(2K))^n r
$<invreleigt>
Let us now define the eigenvalues of the matrix $VV WW$, on which rests our final calculation. Let $Lambda^2(K,L)$ be the eigenvalue of $VV(K,L) WW(K,L)$. Thus, we can write,
$
  Lambda^2(K,L) &= v^2(K,L) c \
  Lambda(K,L) &= v(K,L) c^(1 / 2) \
$
Let us identify $xx(k)$ with some eigenvector of $VV WW$, say $xx_j$. Let the eigenvalue of $VV WW$ corresponding to $xx_j$ is $Lambda^2_j$. We now identify $Lambda^2(K,L)$ with the corresponding $Lambda_j$. This identification complete, we will now work with the notation of $Lambda(K,L)$. This allows us to write @invreleigt as ,
$
  Lambda(K,L) Lambda(L+i pi \/2 ,-K) = (2i sinh(2L))^n + (- 2i sinh(2K))^n r
$<inversereleig>
This will later on help us completely find an expression of $Lambda_j = Lambda(K,L)$. The whole ordeal of finding the solution of $Lambda_j$, will first be shown for $k=1$, which we know from @critsqlat by Kramers and Wannier @Kramers1941, to be the critical temperature. A better explanation of why the case of $k=1$ is shown first, will be clear from the next section. The choice of $k=1$, allows us to express $Lambda(K,L)$ in the form of simple trigonometric functions. Other choices of $k$ requires the use of some rather eccentric functions called Elliptic Functions.





























