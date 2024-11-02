#import "@preview/ctheorems:1.1.2": * 
#let arkheion(
  title: "",
  abstract: [],
  keywords: (),
  authors: (),
  date: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 30mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: "New Computer Modern", lang: "en")
  show math.equation: set text(weight: 400)
  show math.equation: set block(spacing: 0.65em)
  set math.equation(numbering: "(1)")
  set heading(numbering: "Q1.a.")

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    // H1 and H2
    if it.level == 1 {
      pad(
        bottom: 10pt,
        text(it)
      )
    }
    else if it.level == 2 {
      pad(
        bottom: 8pt,
        it
      )
    }
    else if it.level > 3 {
      text(11pt, weight: "bold", it.body + " ")
    } else {
      it
    }
  }

  line(length: 100%, stroke: 2pt)
  // Title row.
  pad(
    bottom: 4pt,
    top: 4pt,
    align(center)[
      #block(text(weight: 500, 1.75em, title))
      #v(1em, weak: true)
    ]
  )
  line(length: 100%, stroke: 2pt)

  // Author information.
  pad(
    top: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        #if author.keys().contains("orcid") {
          link("http://orcid.org/" + author.orcid)[
            #pad(bottom: -8pt,
              grid(
                columns: (8pt, auto, 8pt),
                rows: 10pt,
                [],
                [*#author.name*],
                [
                  #pad(left: 4pt, top: -4pt, image("orcid.svg", width: 8pt))
                ]
              )
            )
          ]
        } else {
          grid(
            columns: (auto),
            rows: 2pt,
            [*#author.name*],
          )
        }
        #author.email \
        #author.affiliation
      ]),
    ),
  )

  align(center)[#date]

  // // Abstract.
  // pad(
  //   x: 3em,
  //   top: 1em,
  //   bottom: 0.4em,
  //   align(center)[
  //     #heading(
  //       outlined: false,
  //       numbering: none,
  //       text(0.85em, smallcaps[Abstract]),
  //     )
  //     #set par(justify: true)
  //     #set text(hyphenate: false)

  //     #abstract
  //   ],
  // )

  // Keywords
  if keywords.len() > 0 {
      [*_Keywords_* #h(0.3cm)] + keywords.map(str).join(" · ")
  }
  // Main body.
  set par(justify: true)
  set text(hyphenate: false)

  body
}

#let arkheion-appendices(body) = {
  counter(heading).update(0)
  counter("appendices").update(1)

  set heading(
    numbering: (..nums) => {
      let vals = nums.pos()
      let value = "ABCDEFGHIJ".at(vals.at(0) - 1)
      if vals.len() == 1 {
        return "APPENDIX " + value
      }
      else {
        return value + "." + nums.pos().slice(1).map(str).join(".")
      }
    }
  );
  [#pagebreak() #body]
}

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8"),
  radius: 0em,
  stroke: rgb(black) 
)
#let  question = thmbox(
  "question",
  "Q",
  radius: 0em,
  fill: rgb(white),
  stroke: rgb(black)
)
#let propn = thmbox(
  "proposition ",
  "Proposition",
  radius: 0em,
  fill: rgb("#e0e0e0"),
  stroke: rgb(black)
)
#let lemma = thmbox(
  "lemma",
  "Lemma",
  radius: 0em,
  stroke: rgb(black)
)
#let answer = thmplain(
"lol",
"Answer",
titlefmt: smallcaps,
bodyfmt: body => [
    #body #h(1fr) $square$
  ]
)
#let proof = thmplain(
"proof",
"Proof",
base: "theorem",
titlefmt: smallcaps,
bodyfmt: body => [
    #body #h(1fr) $square$
  ]
)
#let answer = thmenv(
"answer", // identifier
"heading", // base - do not attach, count globally
1, // base_level - use the base as-is
(name, number , body, color: black) => [
  #h(1.2em)  #rect[*Answer #number *]
 #h(0.2em)
 #body
 #v(0.5em)

// #if c>initc {
  
// }
// #h(1.2em) #rect[*Answer #counter(heading).display()#number #initc #type(c) *]
// #h(0.2em)
// #body
// #v(0.5em)
]
)
// #let initc = 0
// #let answer = thmenv(
// "answer", // identifier
// "heading", // base - do not attach, count globally
// 1, // base_level - use the base as-is
// (name, number , numbering:"a.", body, color: black) => [
// // fmt - format content using the environment
// // name, number, body, and an optional color
// // #let c = context counter.at(here())
// #let c = number
// #c
// #locate(loc => {
//   let c = counter(heading).at(loc).at(0)
  
//   let count = 61
//   if c>initc {
//     let count = 61
//     let initc = c

//   }
//   else if c ==initc {
//     let count = count+1
//     text("lol")
//   }
//   h(1.2em) 
//   rect[*Answer #counter(heading).display()#number #initc #count *]
//   h(0.2em)
//   body
//   v(0.5em)
// })
// // #if c>initc {
  
// // }
// // #h(1.2em) #rect[*Answer #counter(heading).display()#number #initc #type(c) *]
// // #h(0.2em)
// // #body
// // #v(0.5em)
// ]
// )
#let nonum(eq) = math.equation(block: true, numbering: none, eq)
