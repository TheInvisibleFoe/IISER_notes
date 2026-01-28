#import "../imports.typ":*

= Coarse graining
We need coarse graining to create seperations between the slow timescales of mesoscopic dynamics and the fast timescales of the heat reservoirs. This helps in achieving a simple closed description without worrying about the fast micrscoppic dynamics.

Generally there are quite a few techniques used to eliminate fast dynamics and achieve an effective description. They are,
- *Coarse Graining*: These technique group states together in such a way that the internal dynamics among states in a group are much faster than the dynamics among different groups.
- *Decimation Procedures*: These seek to eliminate states that have fast dynamics.

== Adiabatic Elimination

Let's understand via an example.
Consider three states $1,2$ and f. "f" is a high energy state that stands for fast and is an intermediate step from 1 to 2. Since the f states is a high energy state, the system is quite unstable in that state. As a result, the dwelling time on the f state is very short. We perform *adiabatic elimination*. We are in such a time-scale of measurement that the dwells on "f" seem very short. So we could, somehow, create an effective theory by eliminating the "f" state and modifying the jump rates.

$
  dv(p_1,t) &= k_(1 f) p_f - k_(f 1) p_1 \
  dv(p_f,t) &= k_(f 1) p_1 + k_(f 2) p_2 - (k_(1 f) + k_(2 f)) p_f\
  dv(p_2,t) &= k_(2 f) p_f - k_(f 2) p_2
$
Since the dynamics of the f state is much faster compared to the slower dynamics of the other states, it always stays close to a steady state. Basically over the time $d t$ required to see resolvable change in the states $1,2$, $p_f$ would already tend to a stationary-esque state. Thus, we would get,
$
  dv(p_f,t) &= 0\
  p_f &= (k_(f 1) p_1 + k_(f 2) p_2) / (k_(1 f) + k_(2 f))
$
Plugging these in the master equation results in,
$
  dv(,t) vec(p_1,p_2) =mat(-k^e_21, k^e_12; k^e_21, -k^e_12) vec(p_1,p_2)
$
The effective jump rates in the matrix are given by
$
  k^e_21 &= (k_(2 f) k_(f 1)) / (k_(1 f) + k_(2 f))\
  k^e_12 &= (k_(1 f) k_(f 2)) / (k_(1 f) + k_(2 f))
$
What does this mean physically? The first of the effective rates can be seem as jumps of the form,
$
  1 --> 2 = ((1 --> f)(f --> 2))/((f --> 1) + (f --> 2))
$
The system goes from $1-->2$, by traversing the intermediate step $1--> f -->2$. This results in the form of our numerator in the effective jump rates. However, the rates need to be scaled down. Due to microscopic reversibility, the system might come back to state $1$, $f --> 1$. On the other hand, if the system jumps to state $2$, it might not have come from $1$, it might have just gone from $2 --> f$ back to $2$, $f-->2$. This same idea applies to the second of the jump rates.
This is an example of a Decimation procedure. Suppose that before coarse graining, the system satisfied detailed balance with distributions $p_1^"ss",p_f^"ss",p_2^"ss"$.
$
  k_(f 1) p_1^"ss" = k_(1 f) p_f^"ss"\
  k_(f 2) p_2^"ss" = k_(2 f) p_f^"ss"
$
Using these, now note that,
$
  & (k_(1 f) k_(2 f))/(k_(1 f) + k_(2 f))p_f^"ss"=(k_(1 f) k_(2 f))/(k_(1 f) + k_(2 f))p_f^"ss"\
  ==> & k_(1 f)/(k_(1 f) + k_(2 f)) k_(f 2) p_2^"ss" = k_(2 f)/(k_(1 f) + k_(2 f)) k_(f 1) p_1^"ss" \
  ==>& k_21^e p_1^"ss" = k_12^e p_2^"ss"
$
Thus the system satisfies detailed balance even after the decimation procedure.


== Free energy over different coarse-graining levels

The coarse graining also creates an important distinction in the boltzmann probabilities. The energies of a coarse-grained mesostate have a free energy structure. Suppose the mesostate $x$ is composed of microstates $xi in x$. Then the boltzmann weight of $x$ is given by the sum of boltzmann weights of the inner structures.
$
  & exp(- beta eps_x) ~ sum_(xi in x) exp(- beta eps_xi) \
  ==> & eps_x = - kb T ln(sum_(xi in x) exp(- beta eps_xi))
$
Thus the coarse graining causes the energies to assume a free energy like structure. The nice thing about this structure is that it remains consistent over different coarse graining levels.
Suppose a coarse grained mesostate $x$ comprised of mesoscates $y in x$ which are composed of microstates $xi in y$. Then,
$
  eps_x &= - kb T ln(sum_(y in x) exp(- beta eps_y)) \
  eps_y &= -kb T ln(sum_(xi in y) exp(- beta eps_xi))
$
It is then obvious to see, if we did not have an intermediate coarse grained layer $y in x$, the energies of $x$ would still be the same. We could group the microstates into the same group as before,
$
  eps_x &= - kb T ln(sum_(xi in x) exp(- beta eps_xi)) = -kb T ln(sum_(y in x) sum_(xi in y) exp(- beta eps_xi))\
  &= - kb T ln(sum_(y in x) exp(- beta eps_y))
$
The last equality follows from our definitions of coarse grained energy. In doing this consistency check, we have not assumed how the states are assigned to different groups.

== Work done over different mesoscopic scales

This coarse graining also effects the calculation of the work done. We compare the definitions of work done in the two coarse graining levels $x$ and $y$. Consider a trajectory $xx$ with $N$ jumps. Consider manipulation with the parameter $ll = ll(t)$.#q([Need to think about why temps do not change with $ll$.])

$
  w^((y)) &= sum_(k =0 )^N int_(t_k)^t_(k+1) dv(ll,t) pdv(eps_y_k,ll)
$
$
  w^((x)) &= sum_(k =0 )^N int_(t_k)^t_(k+1) dv(ll,t) pdv(eps_x_k,ll)
  = sum_(k=0)^N int_(t_k)^t_(k+1) dv(ll,t) pdv(,ll)(-kb T ln(sum_(y in x_k) exp(- beta eps_y)))\
  &=  sum_(k=0)^N int_(t_k)^t_(k+1) dv(ll,t) pdv(,ll)(-kb T ln(sum_(y in x_k) exp(- beta eps_y)))\
  &= sum_(k =0 )^N int_(t_k)^t_(k+1) dv(ll,t) expval(pdv(eps_y_k,ll))_(x,"eq")
$
The two definitions are equivalent if the states $y in x$ are at equilibrium with each other. This generally happens when the dynamics inside the mesostate $x$ is quite fast and the states $y in x$ quickly settle to equilibrium. #q([Do we require equilbrium or is steady state fine?]) This is a coarse graining procedure, as opposed to adiabatic elimination which is a decimation procedure. We can see that the descriptions of work are equivalent provided we seperate the timescales of the dynamics.

== Coarse grained Entropy production

The Schnackenberg formula gives us the form of entropy production in discrete systems,
  $
    aep_"tot" = kb/2 sum_(x,x') J_(x x') ln((k_(x x') p^"ss"_x)/(k_(x' x) p^"ss"_x'))
  $
However, this is a lower bound for the actual entropy production, as we shall see now. To see why this happens, we can break our coarse-grained systems into two cases,
1. The states $y$ in a coarse grained group $x$ are in equilibrium with themselves and the reservoir. When this happens, there is no entropy production within the mesostate $x$.
2. If the states $y$ are out of equilibrium with each other, coarse-graining described the microscopic pathways between the states $y$, reducing the entropy production rate.
#figure(
  image("../assets/coarse_entbound.png", width:70%)
)
Then the jumps say between $x$ and $x'$ can happen via multiple pathways, $r$ in number, with the effective rate $k_(x x') = sum_r k_(x x')^((r))$. The actual total entropy production is $aep_("tot","act")$,
$
  aep_("tot","act") = kb/2 sum_(x x' r) J_(x x')^((r)) ln((k_(x x')^((r)) p^"ss"_x')/(k_(x' x)^((r)) p^"ss"_x))
$
where $J_(x x')^((r))$ is,
$
  J_(x x')^((r)) = kx^((r)) pps - kxp^((r)) pxs quad forall x neq x, forall r
$
The effecitve current $J_(x x')$ is,
$
  J_(x x') = sum_r J_(x x')^((r))
$
The effective entropy production or the Schnackenberg formula, with the effective current and effective rates.
The actual entropy production can be related to the schnakenberg formula,
$
  aep_("tot","act") &= kb/2 sum_(x x' r) J_(x x')^((r)) ln((k_(x x')^((r)) p^"ss"_x')/(k_(x' x)^((r)) p^"ss"_x)) \
  &= kb sum_(x x') sum(r) kx^((r)) pps ln((kx^((r)) pps)/(kxp^((r)) pxs))\
  & >= kb sum(x x') kx pps ln((kx pps)/(kxp pxs)) = aep_("tot")
$
To obtain to the inequality of entropy productions we have used the logsum inequality.
