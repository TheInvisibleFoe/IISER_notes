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
  suffix-title: [06\ 22MS037],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  university: [PH4209],
  institute: [*Evolutionary Dynamics*],
  seminar: [Sabarno Saha, 22MS037],

  date: datetime.today(),
)

#task[ *Moran Process for competition between TFT and ALLD :* Obtain the fixation probability of TFT for *w=1* for varying population sizes when evolution occurs according to the Moran process. Assume, the two types of individuals making up the population are TFT and ALLD. Take a population of size *N* in which there is just _*one*_ TFT and _*(N-1)*_ ALLD *initially. Neither type can mutate to the other.* \
Use $a=3,b=0,c=5,d=1$ for the payoffs in the PD game between C & D. Use m (rounds of the game)=10

#v(0.5em)
*Payoff to a TFT when it interacts with another TFT is * #h(3em) $F_{T F T, T F T} = m a$

#v(0.5em)
*Payoff to a TFT when it interacts with an ALLD is* #h(3em) $F_{T F T, A L L D} = b + (m-1)d$

#v(0.5em)
*Payoff to an ALLD interacting with another ALLD is* #h(3em) $G_{A L L D, A L L D} = m d$

#v(0.5em)
*Payoff to an ALLD interacting with a TFT is* #h(3em) $G_{A L L D, T F T} = c + (m-1)d$

#v(0.5em)
Write a program in which evolution of the population structure occurs according to the Moran Process i.e. in every generation only *one* individual is picked at random for death and *another* individual is picked for reproduction with a probability proportional to its fitness. *Run the simulation for as long as it takes for any one of the two types to get fixed in the population.* \
Repeat the above simulation for *$N_t=1000$* trials and find out how many times TFT gets fixed ? (Note that the value of $N_t$ is given as a guideline. In some cases, if necessary, you may have to choose $N_t>1000$. Use your judgement to choose an appropriate value for $N_t$ if $N_t=1000$ is not sufficient!)

#v(0.5em)
*Combine all of your results to plot the $N rho_(T F T)$ vs $N$ plot.* \
#text(fill: rgb("#0070C0"))[*Use N=100, 200, 300, 400, 600, 800, 1000*]

][][

  The fitness of an individual is given by $f = 1 - w + w"payoff"$, where $w$ is the selection strength. In this problem, we take $w=1$.  We set the initial population to have one TFT and (N-1) ALLD. We run the simulation for $N_t = 5000$ trials to get a good estimate of the fixation probability. Even in this case, we find that the fixation probability of TFT still has some fluctuations, especially for smaller population sizes. 

  The payoff matrix for the interactions between TFT and ALLD is as follows:
  $
    M = mat(3, 0;
            5, 1)
  $
  The graph of $N rho_(T F T)$ vs $N$ is shown below:
  #figure(
    image("tft_fixation_probability.png", width: 80%),
    caption : [The graph of $N rho_(T F T)$ vs $N$ for the Moran process with TFT and ALLD. The values of N used are 100, 200, 300, 400, 600, 800, and 1000. ]
  )
]