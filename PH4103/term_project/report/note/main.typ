#import "../src/lib.typ": *
#show "Typst": fancy-typst

#import "@preview/i-figured:0.2.4"
#let nonumber(body) = {
  set heading(numbering: none)
  body
}

#show "LaTeX": fancy-latex
#import "@preview/ctheorems:1.1.3": *
#show: thmrules
// Useing the configuration
#show: tuw-thesis.with(
  header-title: "Lock-in Amplifier based Resistance Measurement",
  lang: "en",
)

#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}

#set math.equation(
  numbering: (..nums) => {
    let section = counter(heading).get().first()
    numbering("(1.1)", section, ..nums)
  },
)
#set math.equation(
  numbering: n => {
    numbering("(1.1)", counter(heading).get().first(), n)
  },
  supplement: [],
)

#maketitle(
  title: [Measurement of sub-milliohm resistance of a copper wire using an SR830 Lock-in Amplifier],
  thesis-type: [PH4103 Term Paper],
  supervisor: [Prof. Kamaraju Natarajan \ #h(1.5em) Prof. Sourin Das],
  authors: (

    (
      name: "Debayan Sarkar",
      email: "22MS002",
      supervisor: none,
    ),
    (
      name: "Diptanuj Sarkar",
      email: "22MS038",
      supervisor: none,
    ),
    (
      name: "Sabarno Saha",
      email: "22MS037",
      supervisor: none,
    ),
  ),
)
#let nonum(eq) = math.equation(block: true, numbering: none, eq)
#abstract[
  #include "abstract.typ"
]
#show link: set text(blue)
#show link: this => {
  let show-type = "filled" // "box" or "filled", see below
  let label-color = blue
  let default-color = rgb(40, 1, 240)

  if show-type == "box" {
    if type(this.dest) == label {
      // Make the box bound the entire text:
      set text(bottom-edge: "bounds", top-edge: "bounds")
      box(this, stroke: label-color + 1pt)
    } else {
      set text(bottom-edge: "bounds", top-edge: "bounds")
      box(this, stroke: default-color + 1pt)
    }
  } else if show-type == "filled" {
    if type(this.dest) == label {
      text(this, fill: label-color)
    } else {
      text(this, fill: default-color)
    }
  } else {
    this
  }
}
#show cite: it => {
  // Only color the number, not the brackets.
  show regex("\d+"): set text(fill: blue)
  // or regex("[\p{L}\d+]+") when using the alpha-numerical style
  it
}

#show ref: it => {
  if it.element == none {
    // This is a citation, which is handled above.
    return it
  }

  // Only color the number, not the supplement.
  show regex("[\d.]+"): set text(fill: blue)
  it
}
#outline()
#pagebreak()

// #set text(font: "Concrete Math")
// #show math.equation: set text(font: "Concrete Math")
// #outline(title: "List of Figures", target: figure.where(kind: image))
// #outline(title: "List of Figures", target: thmbox.where(kind: all)))
// Some Example Content has already been created for you, to show you how to use the configuration
// and to give you some useful information about the structure of a Bachelor Thesis
// You can delete this content and start writing your own content

// Main Content
//
= The Lock-In Amplifier
#include "debtyp/lockin_op.typ"
#include "flicker.typ"
#include "fourprobeone.typ"
#include "experiment.typ"
#include "noise.typ"

= Conclusion
We observed that the four-probe method using a lock-in amplifier is effective for measuring sub-milliohm resistances. The resistance of the given copper wire is measured to be ,
$
  R_w &= (0.27 plus.minus 0.071) m Omega \
  R_w^X &= (0.23 plus.minus 0.087) m Omega 
$

In our analysis of the flicker noise, we found that the noise voltage follows a $1/f$ dependence, both with synchronous filter on and off. The bermuda bandwidth effect observed around 10 kHz remains unexplained and warrants further investigation.


#pagebreak()
//#show: appendix
#include "appendix.typ"
#bibliography("refs.bib")
