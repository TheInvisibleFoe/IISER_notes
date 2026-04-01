#import "/src/library.typ": exercise
#import exercise: project, task, subtask
#import "imports.typ":*
#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  x: 1.5cm,
))
#set math.equation(numbering: "(1)")
#show ref: it => {
  let eq = math.equation
  let el = it.element
  // Skip all other references.
  if el == none or el.func() != eq { return it }
  // Override equation references.
  link(el.location(), numbering(
    el.numbering,
    ..counter(eq).at(el.location())
  ))
}

#let task = task.with(numbering-format: (..n) => numbering("1", ..n))
#let subtask = subtask.with(markers: ("a)", "1)"))
#set text(lang: "en")

#show: project.with(
  // no: 3,
  type: "PH4209 Assignment",
  suffix-title: [04\ 22MS037],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  university: [PH4209],
  institute: [*Evolutionary Dynamics*],
  seminar: [Sabarno Saha, 22MS037],

  date: datetime.today(),
)

#task[ *Moran Process with selection and Mutation*

  Take a population of N=10,000 individuals all of which consist of type 0 initially.
For simplicity,
assume that the sequence length of all individuals is L=1.
Assume the mutation rate from type 1 to type 0 is 0. Let $u=0.01$ be the mutation rate from type 0 to
type 1 and $f_0=1$.001 is the fitness of type 0 and $f_1=1$ is the fitness of type 1.
+  Write a program to obtain the time-evolution of the frequencies of the two types in the population subject to both mutation and selection. Run the simulation for as long as it takes for frequencies to equilibrate.
+  Repeat the above simulation for $u=0.01$ and $f_0=1.1$. Assume that half of the initial population are type 0 and the remaining half are type 1.
+ Repeat the simulation 2. with $N = 100$ .
In all cases, plot the evolution of frequency of type 0 and type 1 with time.
Compare your results for the equilibrium frequency in either case with the theoretical
predictions obtained from analysing the quasi-species equation!

][][
We shall simulate evolution with both selection and mutation using the Wright-Fisher process. The quasi species equation is given by,
$
  dv(x_i,t) = sum_j f_j u_(j i) x_j - phi x_j
$
where ,
$x_j$ is the frequency of type j in the population, $f_j$ is the fitness of type j, $u_(j i)$ is the mutation rate from type j to type i and $phi$ is the average fitness of the population given by $phi = sum_j f_j x_j$. In our case the mutation matrix is given quite easily. There is only one allowed mutation, that is from type 0 to type 1 with a rate u. Hence, $u_(0 1) = u$ and $u_(1 0) = 0$. The mutation matrix $U$ is then given by,
$
  U = mat(1-u,u;
          0,1)
  $
Since our population consists of only two types, we can write the quasi species equation in terms of the frequency of type 0 alone. Let $x_0$ be the frequency of type 0 in the population. Then, the frequency of type 1 is given by $x_1 = 1 - x_0$. The quasi species equation can then be written as,
$
  dv(x_0,t) &= f_0 (1-u) x_0 + f_1 u (1-x_0) - phi x_0 \
  &= x_0 [f_0 (1-u) - phi]
$

The equilibrium frequency of type 0 can be obtained by setting $dv(x_0,t) = 0$. This implies, $x_0^* = 0$ or $phi = f_0 (1-u)$. The mixed state solution leads to ,
$
  x_0^* = (f_0(1-u) - f_1)/(f_0 - f_1)
$
Instead of taking derivatives to do stability analysis to check which of the two solutions is stable, we can rewrite the quasi species equation as,
$
  dv(x_0,t) = x_0 (x_0 - x_0^*) (f_0 - f_1)
$
From the above equation, we can see that if $f_0 > f_1$, then the solution $x_0^*$ is stable mixed equilibrium state. 

1. For the first part of the problem, we have $f_0 = 1.001$ and $f_1 = 1$. For these parameters, the equilibrium frequencies are,
$
  x_0^* = 0 quad "and" quad x_0^* = (1.001 times 0.99 - 1)/(1.001 - 1) <0
$
Thus the only stable equilibrium state is $x_0^* = 0$. This means that the population will eventually be taken over by type 1. The frequency of type 0 will eventually go to zero.
#figure(
  image("assets/selmut_p1.png", width: 70%),
  caption :[Wright Fisher process with selection and mutation: $f_0 = 1.001$ and $u = 0.01$]
)
2. For the second part of the problem, we have $f_0 = 1.1$ and $f_1 = 1$. The initial frequencies are $x_0 = 0.5$ and $x_1 = 0.5$. For these parameters, the equilibrium frequencies are,
$
  x_0^* = 0 quad "and" quad x_0^* = (1.1 times 0.99 - 1)/(1.1 - 1) = 0.89
$
Thus the stable equilibrium state is $x_0^* = 0.89$, where the stable solution is the mixed state. This means that the population will eventually reach an equilibrium state where the frequency of type 0 is $0.89$.
#figure(
  image("assets/selmut_p2.png", width: 70%),
  caption :[Wright Fisher process with selection and mutation: $f_0 = 1.1$ and $u = 0.01$]
)
3. For the third part of the problem, we have $N = 100$. The equilibrium frequencies are the same as in the second part of the problem, that is $x_0^* = 0.89$. However, since the population size is smaller, the fluctuations around the equilibrium state will be larger. 
#figure(
  image("assets/selmut_p3.png", width: 70%),
  caption :[Wright Fisher process with selection and mutation: $f_0 = 1.1$, $u = 0.01$ and $N = 100$]
)

A small note on algorithm implementation. To use mutation and selection together in the Wright-Fisher process, the selection process can be done without using a nested for loop. Since to probabilities of selection are bernoulli random variables, the sum of these together will be a binomial random variable. Hence, we can directly sample the number of offspring of each type from a binomial distribution. 

]

