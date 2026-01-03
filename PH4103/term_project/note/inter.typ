#import "imports.typ": *

#let nonumber(body) = {
  set heading(numbering: none)
  body
}
#pagebreak()
#align(horizon)[

  #nonumber[= Intermission]
  _The report has talked about models that have been mathematically quite intuitive to solve. We move onto the biggest task of the article. The big behemoth known as the 2D Ising Model. The solution outlined here is the one given at @baxter1982.  The original solution was by Onsager in @Onsager1944. It was simplified later by his PhD student, Bruria Kaufman, @kaufman1949partition by analyzing spinors. Fisher @Fisher1966 presented a solution by analyzing something called a decorated lattice, using the number of Dimer configurations in a lattice given by Kastelyn @kasteleyn1961statistics. The solutions outlined in Baxter require some mathematical heavy lifting, using complex functions and complex variables. Coming up with a solution of this form is quite hard but is easy to follow once you have seen it. We will try to "motivate" the solution of the model. For ease of understanding the major results of each important subsection will be summarized in Result boxes at the end._

  _The format of the second part of the article will begin with Rudolf Peierls's Proof @Peierls1936 that a phase transition takes place at a non-zero temperature for lattice with dimension $d>1$. Then using duality relations of Lattices, Kramers and Wannier @Kramers1941 found out the critical temperature of the 2D Ising Model. We then outline the solution of the Ising Model at the critical temperature. We start with this, since at critical temperature we deal with fairly easy trigonometric functions, however, lower than critical temperatures, we resort to elliptic functions.  Let's brew a cup of coffee and begin on the perilous journey to Mordor in our quest to understand the 2D Ising Model._

]


#pagebreak()
