
#import "@preview/physica:0.9.5": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules
#let qe = $suit.club.filled$

// Define theorem environments

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8")
)
#let lemma = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Lemma",
  fill: rgb("#efe6ff")
)
#let corollary = thmbox(
  "corollary",
  "Corollary",
  base: "theorem",      // Corollaries are 'attached' to Theorems
  fill: rgb("#f8e8e8")
)

#let claim = thmbox(
  "claim",         // Definitions use their own counter
  "Claim",
  fill: rgb("#e8f8e8"),
  stroke: rgb("#000000") + 1pt,
  radius : 0.0em,
)
#let definition = thmbox(
  "definition",         // Definitions use their own counter
  "Definition",
  fill: rgb("#e8f8e8")
)

#let exercise = thmbox(
  "exercise",
  "Exercise",
  stroke: rgb("#ffaaaa") + 1pt,
  base: none,           // Unattached: count globally
).with(numbering: "I")  // Use Roman numerals

// Examples and remarks are not numbered
#let example = thmplain("example", "Example").with(numbering: none)
#let remark = thmplain(
  "remark",
  "Remark",
  inset: 0em
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