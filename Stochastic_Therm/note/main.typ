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
  header-title: "2D Ising Model",
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
  title: [2D Ising Model],
  thesis-type: [Research Project],
  authors: (
    (
      name: "Sabarno Saha",
      email: "ss22ms037@iiserkol.ac.in",
      supervisor: "Prof. Anandamohan Ghosh",
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
#pagebreak()
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
#set heading(numbering: none)
#heading(outlined: false)[Acknowledgements]

I would like to thank Prof. Anandamohan Ghosh for his guidance and support throughout this project. I am also grateful to my peers and colleagues for their valuable discussions and feedback. Finally, I would like to acknowledge the resources and tools that facilitated this research. I would specially thank the creators of `numba` and `jit` compilers for making numerical simulations efficient and extremely fast. Finally I would like to thank `mathcha` for existing and helping me with all the figures. All hail Baxter! All hail Onsager!

On the very rare chance some reader has the dire misfortune of going through this report, I would like to thank them for their time and patience. Also on that note, I would like to apologise for any mistakes or errors that may have crept in noticed or unnoticed. The unfortunate reader is welcome to contact me at `iamsabarno[at]gmail[dot]com` for any clarifications, corrections or suggestions. Enjoy the ride!
#pagebreak()
#set heading(numbering:"1.1.")


#include "Intro.typ"
// #include "prelims.typ"
#include "1Dising.typ"
#include "mfmodel.typ"
#include "inter.typ"
#include "peierls.typ"
#include "kramerswannier.typ"
#include "honeycomb.typ"
#include "strtri.typ"
#include "transfer2d.typ"
#include "crit2disingmodel.typ"
#include "elliptic.typ"
#include "2Dising.typ"
#include "generaleig.typ"
#include "freeenergy.typ"
#include "criticality.typ"
#include "scalingrel.typ"
#include "numericalsim.typ"



#pagebreak()
//#show: appendix
#include "appendix.typ"
#bibliography("refs.bib")
