#import "../src/lib.typ": *
// Typst does not support global variables, so for now we import
// everything we need into an import file and import it here and
// for all subfiles.
// Some Macros are also defined in the import file.
#import "imports.typ": *

#show: codly-init.with()
#codly(languages: (python: (name: "Python", color: rgb("#006699"))))
// No idea what this does, but it seems fancy.
#show "Typst": fancy-typst
#show "LaTeX": fancy-latex

// Next line HAS to be HERE for ctheorems to work properly
#show: thmrules

// Document type for this template
#show: tuw-thesis.with(
  header-title: "Peek-a-Boo",
  lang: "en",
)
#maketitle(
  title: "Non Linear Dynamics Notes",
  thesis-type: [PH4104 Notes],
  authors: (
    (
      name: "Sabarno Saha",
      email: [#link("ss22ms037@iiserkol.ac.in")],
      supervisor: "Prof. Anandamohan Ghosh",
    ),
  ),
)
#abstract[
  #include "abstract.typ"
]




#outline()

#pagebreak()



#include "intro.typ"
#include "2Dsystems.typ"
#include "cons.typ"
#include "limitcyc.typ"
#include "lorenz.typ"
#include "maps.typ"
#include "hamiltonian.typ"
#include "PDE.typ"


//#show: appendix
#include "appendix.typ"
#bibliography("refs.bib")
