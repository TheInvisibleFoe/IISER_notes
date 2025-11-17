#import "/src/library.typ": exercise
#import exercise: project, task, subtask
#import "imports.typ":*
#set math.equation(numbering: "[1]")

#let task = task.with(numbering-format: (..n) => numbering("1", ..n))
#let subtask = subtask.with(markers: ("a)", "1)"))
#set text(lang: "en")

#show: project.with(
  // no: 3,
  type: "PH4101 Assignment",
  suffix-title: [3\ 22MS037],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  box-task-title: [Problem],
  box-hint-title: [Hinweis],
  box-solution-title: [Lösung],

  university: [*Condensed Matter PH4101*],
  institute: [],
  seminar: [Sabarno Saha, 22MS037],

  date: datetime(year: 2025, month: 11, day: 16),
)

#task[Kronig Penny Model][][
  #subtask[
  ]
]

#task[Two dimensional tight binding][][

]
#task[Tight Binding with Staggered Potential][][
  The Hamiltonian for a one dimensional chain with staggered potential is given by
  $
    H = -t sum_n [ketbra(n,n+1) + h.c.] + U sum_n  ketbra(n,n) + V sum_n (-1)^n ketbra(n,n)
  $
  We divide the chain into two sublattices A and B such that even sites belong to A and odd sites belong to B. All "A" sites have on-site potential $U+V$ and all "B" sites have on-site potential $U-V$. One other change takes place, the periodicity of the lattice changes from $a$ to $2a$. This makes the unit cell contain two sites, one from sublattice A and one from sublattice B.
  
  We can now rewrite the Hamiltonian as
  $
    H = -t sum_n [underbrace(ketbra(n_A,n_B),1) + underbrace(ketbra(n_B,n_A+1),2) + h.c.] + (U+V) sum_n underbrace(ketbra(n_A,n_A),3) + (U-V) sum_n underbrace(ketbra(n_B,n_B),4)
  $<p>
  where $n_A$ and $n_B$ denote the site index for sublattice A and B respectively. The terms (1) and (2) denote hopping between A and B sublattices while terms (3) and (4) denote on-site potentials for A and B sublattices respectively. (1) and (2) are hopping terms where (1) denotes hopping from A to B within the same unit cell while (2) denotes hopping from B to A in the next unit cell.
  
  #subtask[
    We now need to find the dispersion relation for this system. To do this, we write the Hamiltonian in the $k$-space basis $ket(k)_A$ and $ket(k)_B$ where
    $
      ket(k)_A = 1/sqrt(N\/2) sum_(n in A) e^(i k n (2 a)) ket(n)
    $
    $      ket(k)_B = 1/sqrt(N\/2) sum_(n in B) e^(i k n (2a )) ket(n)
    $
    Let us note the orthogonality condition
    $
      1/sqrt(N\/2) sum_n e^(i (k - k') n (2 a)) = delta(k - k')
    $
    Plugging in these basis states into the Hamiltonian @p, we get
    $
      H = sum_k [ (U+V) ket(k)_A bra(k)_A + (U-V) ket(k)_B bra(k_B) - t (1 + e^(-i 2 k a)) ket(k)_A bra(k)_B  \ #h(20em) - t (1 + e^(i 2 k a)) ket(k)_B bra(k)_A ]
    $
      
  ]

]
#task[Parallel Chains][][

]
#task[Bloch Theorem][][

]
#task[Lattice Vectors][][

]
#task[Ultracold atoms][][

]
