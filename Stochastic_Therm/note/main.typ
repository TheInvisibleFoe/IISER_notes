#import "../src/lib.typ": *
// Typst does not support global variables, so for now we import
// everything we need into an import file and import it here and
// for all subfiles.
// Some Macros are also defined in the import file.
#import "imports.typ": *

#import "@preview/colorful-boxes:1.4.3"
#show: codly-init.with()
#codly(languages: (python: (name: "Python", color: rgb("#006699"))))
// No idea what this does, but it seems fancy.
#show "Typst": fancy-typst
#show "LaTeX": fancy-latex

// Next line HAS to be HERE for ctheorems to work properly
#show: thmrules

// Document type for this template
#show: tuw-thesis.with(
  header-title: "An approach to TUR",
  lang: "en",
)
#maketitle(
  title: "Stochastic Thermodynamics",
  thesis-type: [Notes],
  authors: (
    (
      name: "Sabarno Saha",
      email: [#link("mailto:sabarnohere@gmail.com")],
      // supervisor: "Prof. PK Mohanty",
      sup: [],
    ),
  ),
)
// #abstract[
//   #include "abstract.typ"
// ]

#let lec-counter = counter("chap")

#let chap(title) = {
  lec-counter.step()
  context { heading(numbering:none, [Chapter #lec-counter.display(): #title], supplement : [Chap.]) }
}
#show: super-plus-as-dagger

#pagebreak()
#include("intro.typ")
#pagebreak()
#outline()
#pagebreak()

#chap("Stochastic Processes")
#include("stochpr.typ")
#chap("Thermodynamics")
#include("thermo.typ")


//#show: appendix
#include "appendix.typ"
#bibliography("refs.bib")
