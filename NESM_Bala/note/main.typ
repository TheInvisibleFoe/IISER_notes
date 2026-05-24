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
  header-title: "Elements of NESM",
  lang: "en",
)
#maketitle(
  title: "Elements of NESM",
  thesis-type: [Solutions],
  authors: (
    (
      name: "Sabarno Saha",
      email: [#link("mailto:sabarnohere@gmail.com")],
      supervisor: "lol",
    ),
  ),
)
#abstract[
  #include "abstract.typ"
]




#pagebreak()
#outline()


#pagebreak()
// #show: appendix
// #include "appendix.typ"
// #pagebreak()
#include "chapter1.typ"
#bibliography("refs.bib")
