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
  suffix-title: [03\ 22MS037],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  university: [PH4209],
  institute: [*Evolutionary Dynamics*],
  seminar: [Sabarno Saha, 22MS037],

  date: datetime.today(),
)

#task[
*Moran Process with constant selection but without mutation:* 

Take a population of N=100 individuals
one of which consist of type A and the remaining of type B, initially.
Assume that the fitness of type A is r and the fitness of type B is 1 and neither type can
mutate to the other.

 1. Write a program to obtain the time-evolution of the frequencies of the two types in the population when  evolution occurs according to the Moran Process i.e. in every generation only one individual is picked at random for death and another individual is picked for reproduction with a probability proportional to its fitness. Use r=1.01 Run the simulation for as long as it takes for any one of the two types to get fixed in the population.

2. *Obtaining the Fixation Probability*: Repeat the above simulation for Nt=1000 trials and find out the fraction of times each of the two types A and B get fixed ? Check whether the invasion probability you obtain from the simulation  matches with the theoretical value of invasion probability.

][][
  The fitness of type A is r=1.01 and the fitness of type B is 1. We simulate the process until one of the types gets fixed in the population. Let $x_i$ be the fixation probability of type A starting from the initial state $x=i/N$. The theoretical invasion probability for type A can be calculated using the formula: 
  $
    x_i = (1-r^(-i)) / (1-r^(-N))
  $
  For our case, with $i=1$ and $N=100$, the theoretical invasion probability for type A is:
  $
    x_1 = (1-1.01^(-1)) / (1-1.01^(-100)) approx 0.016
  $
  #figure(
    image("assets/moran_selection.png", width: 65%),
    caption: "Invasion of type A"
  )

  We simulated the Moran process for $N_t = 1000$ trials. The fraction of times type A got fixed in the population was $0.011$ and the fraction of times type B got fixed was $0.989$. 

  #figure(
    image("assets/moran_selection_fixation.png", width: 40%),
    caption: "Fixation of type A with 1000 trials"
  )
  The convergence can be observed as the number of trials increases, and the simulated fixation probability approaches the theoretical value of approximately $0.016$ for type A. Here is the simulated probability of fixation for type A for $N_t = 5000$ trials.
  #figure(
    image("assets/moran_selection_fixation_5000.png", width: 40%),
    caption: "Fixation of type A with 5000 trials. The simulated fixation probability is approximately 0.016."
  )

]


#task[ *Wright Fisher Process with selection*

If half the initial population consists of type A, write a program to obtain the time-evolution of the
frequencies of the two types in the population when individuals making up the population in the next
generation are chosen from members of the current generation with a probability proportional to their
fitness. Use r=0.99
Run the simulation for as long as it takes for any one of the two types to get fixed in the
population.
1. *Obtaining the Fixation Probability*: Repeat the above simulation for Nt=1000 trials and find out the fraction of times each of the two types A and B get fixed ?

2. For any one trial, plot the evolution of frequency of type A and type  with time.
][][
  The Wright Fisher process is a generational process where the entire population is replaced in each generation. The new population is formed by sampling individuals from the current population with probabilities proportional to their fitness. In this case, we have two types: type A with fitness r=0.99 and type B with fitness 1. Initially, half the population consists of type 0 and the other half consists of type 1.

  The fixation probabilities for type A and type B can be calculated using the formula @ox. Let the fitness ratio for type A to type B be $1+s:1$. In our case $s<0$. So we can invert the ratio to get $1+s':1$ which is the ratio of fitness for type B to type A. Let the inital frequency of type B be $x_0=0.5$. Let $alpha = N s'$. Then the fixation probability for type B can be calculated as:
  $
    x_0 = cases((1-exp(-2 alpha x_0)) / (1-exp(-2 alpha)) &quad alpha !=0, x_0 & quad alpha = 0)
  $
  The fitness probability of type B is $0.733$, so that of type A is $0.267$. One sample trajectory of the frequencies of type A and type B over time is shown in the figure below. 
  #figure(
    image("assets/wright_fisher_selection_p2_1000.png", width: 45%),
    caption: "Fixation of type A and type B in the Wright Fisher process with selection. "
  )

  One can actually observe the convergence of the simulated fixation probabilities to the theoretical values as the number of trials increases. For $N_t=100000$ trials, the simulated fixation probabilities are,
  #figure(
    image("assets/wright_fisher_selection_p2_100000.png", width: 45%),
    caption: "Fixation of type A and type B in the Wright Fisher process with selection for 100000 trials. The simulated fixation probabilities are approximately 0.27 for type A and 0.73 for type B."
  )
  Below is the plot of the evolution of frequencies of type A and type B over time for one trial. We can see that type B gets fixed in the population while type A goes extinct.
  #figure(
    image("assets/wright_fisher_selection_trajectory_p2.png", width: 65%),
    caption: "Trajectory of frequencies of type A and type B over time for one trial. "
  )


]
#bibliography("refs.bib")
