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
  suffix-title: [05\ 22MS037],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  university: [PH4209],
  institute: [*Evolutionary Dynamics*],
  seminar: [Sabarno Saha, 22MS037],

  date: datetime.today(),
)

#task[ *Cooperators and Defectors*

][][
  The prisoner's dilemma is a game where two players can either cooperate or defect. The payoff matrix is given by:
  $
    M =mat(
      4, 1;
      6, 2
    )
  $
  where the first row corresponds to the payoffs for a cooperator and the second row corresponds to the payoffs for a defector. We consider a population of $N=1000$ individuals, where $500$ are cooperators and $500$ are defectors.

  #figure(
    image("assets/coopdef.png", width:80%),
    caption: [Fraction of cooperators and defectors over generations.]
  )
]
#task[ *TFT vs AllD*

][][
  Now, we consider a population of $N=1000$ individuals, where each individuals are either playing TFT or AllD. The payoff matrix is the same as before. We want to see how the frequencies of TFT and AllD evolve over generations.

  We have two initial conditions:
  1. Initially, $250$ individuals are playing TFT and $750$ are playing AllD.
  #figure(
    image("assets/tftalld1.png", width:90%),
    caption: [Fraction of TFT and AllD over generations.]
  )
  2. Initially, $150$ individuals are playing TFT and $850$ are playing AllD.
  #figure(
    image("assets/tftalld2.png", width:90%),
    caption: [Fraction of TFT and AllD over generations.]
  )

  One can find the average expected payoff for TFT and AllD as,
  #set align(center)
#table(
  columns: 3,
  align: center + horizon,
  stroke: (x, y) => (
    right: if x < 3 { 0.5pt } else { none },
    bottom: if y < 2 { 0.5pt } else { none },
  ),
  [], [TFT], [ALLD],
  [TFT], [$m a$], [$b + (m - 1)d$],
  [ALLD], [$c + (m - 1)d$], [$m d$]
)


]
#set align(left)

If only two players are playing this game for $m$ rounds, then there is an equilibrium frequency of TFT given by,
$
  x = (d - b)/(m(a - d) - (b + c) + 2d)
  
$
For our values, it comes out to be $x = 0.2$. However, in both cases TFT goes extinct. This can be explained by how the simulation is performed.

Suppose we select two players from the population, one playing TFT($P_1$) and the other playing AllD($P_2$). They play the game for $m$ rounds and get payoffs $f_1$ and $f_2$ respectively. Now, suppose during some other generation we select $P_1$ and $P_2$ again. For the same number of rounds, $P_1$ will always get the same payoff $f_1$ and $P_2$ will always get the same payoff $f_2$. This is not the natural extension from 2 players to N players. We would expect that if $P_1$ and $P_2$ play the game multiple times, they should have a memory of the previous interactions and their payoffs should change accordingly. Thus every generation, $P_1$ and $P_2$ get payoffs $f_1$ and $f_2$ respectively, instead of the payoff of $P_1$ increasing and the payoff of $P_2$ decreasing. 

As a result, if the number of generations is more than some threshold, players playing each other again increases. This is why TFT goes extinct in the simulation. If we actually give them memory of the previous interactions, then TFT should be able to survive and even dominate the population.

Since, this is not clarified in the question, we have performed the simulation as described in the question. However, if we give them memory of the previous interactions, then TFT should be able to survive and even dominate the population.