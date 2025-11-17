#import "@preview/physica:0.9.5": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/subpar:0.2.2"
#import "@preview/i-figured:0.2.4"
#show: thmrules
#let qe = $suit.club.filled$

#import "/src/library.typ": exercise
#import exercise: project, task, subtask
#import "@preview/codly:1.2.0": *
#show: codly-init.with()
#show link: set text(navy)
#show link: this => {
  let show-type = "box" // "box" or "filled", see below
  let label-color = olive
  let default-color = eastern

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

#codly(languages: (python: (name: "Python", color: rgb("#006699"))))
// Define theorem environments

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8"),
)
#let lemma = thmbox(
  "theorem", // Lemmas use the same counter as Theorems
  "Lemma",
  fill: rgb("#efe6ff"),
)
#let corollary = thmbox(
  "corollary",
  "Corollary",
  base: "theorem", // Corollaries are 'attached' to Theorems
  fill: rgb("#f8e8e8"),
)

#let claim = thmbox(
  "claim", // Definitions use their own counter
  "Claim",
  fill: rgb("#e8f8e8"),
  stroke: rgb("#000000") + 1pt,
  radius: 0.0em,
)
#let definition = thmbox(
  "definition", // Definitions ising_honeycomb_triangularuse their own counter
  "Definition",
  fill: rgb("#e8f8e8"),
)

#let result = thmbox(
  "result", // Definitions use their own counter
  "Result",
  fill: rgb("#cce5FF"),
  stroke: rgb("#000000") + 1pt,
  radius: 0.0em,
  base:none,
)
#let exercise = thmbox(
  "exercise",
  "Exercise",
  stroke: rgb("#ffaaaa") + 1pt,
  base: none, // Unattached: count globally
).with(numbering: "I") // Use Roman numerals

// Examples and remarks are not numbered
#let example = thmplain("example", "Example").with(numbering: none)
#let remark = thmplain(
  "remark",
  "Remark",
  inset: 0em,
).with(numbering: none)

// Proofs are attached to theorems, although they are not numbered
#let proof = thmproof(
  "proof",
  "Proof",
  base: "theorem",
)

#let solution = thmplain(
  "solution",
  "Solution",
  base: "exercise",
  inset: 0em,
).with(numbering: none)


#let nonum(eq) = math.equation(block: true, numbering: none, eq)
#let ot = sym.times.circle
#let xx = $bold(x)$


#let fl= $frak(L)$