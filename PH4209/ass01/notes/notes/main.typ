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
  type: "PH4209 Assigment",
  suffix-title: [01\ 22MS037],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  university: [PH4209],
  institute: [*Evolutionary Dynamics*],
  seminar: [Sabarno Saha, 22MS037],

  date: datetime.today(),
)
*ALGORITHM*
```
Divide population of size N equally between two types of individuals A and B represented by the numbers 0 & 1 
Define mutation rates u1 and u2
Start loop over generations (total =T)
  Start loop over entire population (size=N)\
  Check if the individual chosen is of type 0 or type 1
    If type 0, mutate individual from 0 to 1 with probability u1
      Pick a random number r between 0 and 1
      If r < u1, mutate individual from 0 to 1, else leave unchanged
    If type 1, mutate individual from 1 to 0 with probability u2
      Pick a random number r between 1 and 0
      If r < u2, mutate individual from 1 to 0, else leave unchanged
  Close loop over population
  Calculate frequency of type 0 and type 1 in the population
  Record generation versus frequency data
Close loop over generations
```

#task[Run simulations using $u_1=0.003$ and $u_2=0.001$ for 3 different population sizes $N=50, 1000, 10000$ for $T=2000$ generations.][][
We consider a population of size $N$ with two types of individuals: type A and type B. 
$
  A harpoons.ltrb_(u_1)^(u_2) B
$
  where $u_1$ is the mutation rate from type A to type B, and $u_2$ is the mutation rate from type B to type A.
  The master equation is ,
  $
    dv(f_A, t) = u_2 f_B - u_1 f_A = -f_A (u_1 + u_2) + u_2  \
    dv(f_B, t) = u_1 f_A - u_2 f_B = -f_B (u_1 + u_2) + u_1
  $
  The steady state solution is given by,
  $
    f_A^"ss" = u_2 / (u_1 + u_2) quad ; quad
    f_B^"ss" = u_1 / (u_1 + u_2)
  $
  For $u_1=0.003$ and $u_2=0.001$, we have,
  $
    f_A^"ss" = 0.25 quad ; quad
    f_B^"ss" = 0.75
  $
  We run simulations for $N=50, 1000, 10000$ for $T=2000$ generations. The results are shown below:
  #figure(
    image("assets/mutation_no_selection_N50.png", width: 85%),
    caption: [Simulation results for $N=50$, with rates $u_1=0.003$ and $u_2=0.001$. The solid lines represent the steady state fractions $f_A^"ss"=0.25$ and $f_B^"ss"=0.75$ for $2000$ generations],
  )
  \
  #figure(
    image("assets/mutation_no_selection_N1000.png", width: 85%),
    caption: [Simulation results for $N=1000$, with rates $u_1=0.003$ and $u_2=0.001$. The solid lines represent the steady state fractions $f_A^"ss"=0.25$ and $f_B^"ss"=0.75$ for $2000$ generations],
  )
  \
  #figure(
    image("assets/mutation_no_selection_N10000.png", width: 85%),
    caption: [Simulation results for $N=10000$, with rates $u_1=0.003$ and $u_2=0.001$. The solid lines represent the steady state fractions $f_A^"ss"=0.25$ and $f_B^"ss"=0.75$ for $2000$ generations],
  )
  We see that the fluctuations around the steady state fractions decrease with increasing population size $N$. One expects complete deterministic behavior in the limit $N --> oo$.
]

#task[Repeat simulation for $N=1000$ using $u_1=0.07$ and $u_2=0.001$; Use $T=2000$ in both cases.][][
  The steady state fractions for $u_1=0.07$ and $u_2=0.001$ are given by,
  $
    f_A^"ss" = u_2 / (u_1 + u_2) = 0.0141 quad ; quad
    f_B^"ss" = u_1 / (u_1 + u_2) = 0.9859
  $
  We run simulations for $N=1000$ for $T=2000$ generations. The results are shown below:
  #figure(
    image("assets/mutation_no_selection_N1000_diffu_u.png", width: 90%),
    caption: [Simulation results for $N=1000$, with rates $u_1=0.07$ and $u_2=0.001$. The solid lines represent the steady state fractions $f_A^"ss"=0.0141$ and $f_B^"ss"=0.9859$ for $2000$ generations],
  )
]
