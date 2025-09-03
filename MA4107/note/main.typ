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
  header-title: "Statistical Inference",
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
#show math.equation: set text(font: "Concrete Math")

#set math.equation(
  numbering: n => {
    numbering("(1.1)", counter(heading).get().first(), n)
  },
  supplement: [],
)

#maketitle(
  title: [MA4107: Statistical Inference],
  thesis-type: [Notes],
  authors: (
    (
      name: "Sabarno Saha",
      email: "ss22ms037@iiserkol.ac.in",
      supervisor: none,
    ),
  ),
)
#let nonum(eq) = math.equation(block: true, numbering: none, eq)
// #abstract[
//   #include "abstract.typ"
// ]
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

#set text(font: "Concrete Math")
#show math.equation: set text(font: "Concrete Math")

#include("sections.typ")

//#show: appendix
