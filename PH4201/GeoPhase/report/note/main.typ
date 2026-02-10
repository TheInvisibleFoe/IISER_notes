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
  header-title: "Mach-Zehnder Interferometer",
  lang: "en",
)
#maketitle(
  title: "Mach-Zehnder Interferometer: Measurement of Refractive Index of Air",
  thesis-type: [PH4201: Adv. Optics Lab Report],
  authors: (
    (
      name: "Debayan Sarkar",
      email: [22MS002],
      supervisor: [],
    ),
      (
      name: "Sabarno Saha",
      email: [22MS037],
      supervisor: [],
    ),
      (
      name: "Diptanuj Sarkar",
      email: [22MS038],
      supervisor: [],
    ),
 
  ),
)

// #show table.cell.where(y: 0): set text(weight: "medium")
// Bold titles.
// #show table.cell.where(x: 1): set text(weight: "bold")

#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)

#set table(
  fill: (_, y) => if calc.odd(y) { rgb("EAF2F5") },
  stroke: frame(1pt + rgb("21222C")),
)
#include "stuff.typ"

= Supplementary Data

#include "supplementary.typ"




// #show: appendix
// #include "appendix.typ"
// #pagebreak()
// #bibliography("refs.bib")
