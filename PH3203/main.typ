
#import "template/template.typ": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules
#show: template.with(
  language: "en",
  title-en: "Squeezed States of Light",
  author: "PH3203 Term Paper",
  faculty: "Debayan Sarkar(22MS002)\nDiptanuj Sarkar(22MS038)\nSabarno Saha(22MS037)\n",
  department: "Physical Sciences",
  include-declaration-of-independent-processing: false,
)
#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  x: 1.5cm,
))
#set math.equation(numbering: "(1)")
#let nonum(eq) = math.equation(block: true, numbering: none, eq) 
#let appendix-heading(it) = {
  set align(center)
  it
  line(length: 100%, stroke: 1pt)
  v(1em)
}

#let appendix(body) = {
  set heading(numbering: "A.1 :", supplement: [Annexe])
  show heading: appendix-heading
  counter(heading).update(0)
  body
}
= Introduction
#include "intro.typ"
= Literature Review
#include "litrev.typ"
= Normalized correlation function
#include "normalcorr.typ"
= Coherent States
#include "coherent.typ"
= Squeezed States
#include "sq.typ"
= Production of Squeezed States
#include "production.typ"
= Detection of Squeezed States
#include "detection.typ"
= Applications of Squeezed States
#include "application.typ"
#bibliography("refs.bib")

#pagebreak()
#counter(heading).update(0)
#set heading(numbering: "A.1 :")
#show heading: appendix-heading
= Glauber Sudarshan P function
#include "gspfunc.typ"
= Unitarity of Squeeze and Displacement operators
#include "dispsq.typ"
= Photon antibunching
#include "bunch.typ"