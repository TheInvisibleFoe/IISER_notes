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
  header-title: "PH4202",
  lang: "en",
)
#maketitle(
  title: "PH4202: Advanced Statistical Mechanics",
  thesis-type: [Lecture Notes],
  authors: (
    (
      name: "Sabarno Saha",
      email: [#link("mailto:ss22ms037@iiserkol.ac.in")],
      supervisor: "Prof. Bhavtosh Bansal",
    ),
  ),
)
// #abstract[
//   #include "abstract.typ"
// ]

#set heading(numbering: "1.", supplement: [Section])
#let lec-counter = counter("lab")

#let lec(title) = {
  lec-counter.step()
  context { heading(numbering:none, [Lecture #lec-counter.display(): #title], supplement : [Lec.]) }
}


#v(2em)
#figure(
  image("assets/cartoon.jpeg",width:60%)
)

#pagebreak()
#outline(
  title: [Table of Contents(By Topic)],
  target: heading.where(supplement: [Section]),
)

#pagebreak()

#outline(
  title: [Table of Contents(By Lecture)],
  target: heading.where(supplement: [Lec.]),
)
#pagebreak()

#lec("Introduction and Van der Waals equation of state")
#include "lec01.typ"
// #show: appendix
// #include "appendix.typ"
#pagebreak()
#bibliography("refs.bib")
