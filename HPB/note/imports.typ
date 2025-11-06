#import "@preview/physica:0.9.5": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/subpar:0.2.2"
#import "@preview/i-figured:0.2.4"
#show: thmrules
#let qe = $suit.club.filled$

#import "@preview/codly:1.2.0": *
#show: codly-init.with()
#show link: set text(navy)

// Hyperref type links
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

// Multi column numerbered list column wise numbered
#let zip-long(..arrays, fill: none) = {
  let arrays = arrays.pos()
  let max-len = calc.max(..arrays.map(x => x.len()))
  let filler = x => if x.len() == max-len { x } else {
    x + (fill,) * (max-len - x.len())
  }
  array.zip(..arrays.map(filler))
}

#let solution(body) = body

#let options(body) = context {
  if type(body) != content or body.func() != [].func() { return }
  let items = body
    .children
    .filter(x => x.func() == enum.item)
    .enumerate()
    .map(((i, x)) => [#numbering(enum.numbering, i + 1) #x.body])
  if items.len() == 0 { return }
  set raw(lang: "r")
  grid(
    columns: 2,
    column-gutter: 1.65em,
    row-gutter: par.leading,
    ..zip-long(..items.chunks(int((items.len() + 1) / 2))).flatten(),
  )
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
  stroke: rgb("#151b54") + 1pt,
  padding: (top: -1.0em, bottom: -2.0em),
  base: none, // Unattached: count globally
  radius: 0.0em,
).with(numbering: "1") // Use Roman numerals

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
#let hint = thmplain(
  "hint",
  [#h(1em) Hint],
  base: "exercise",
  padding: (top: -0.5em, bottom: 0.0em),
  inset: 0em,
).with(numbering: none)


#let solution = thmplain(
  "solution",
  "Solution",
  base: "exercise",
  inset: 0em,
).with(numbering: none)

// Set default font to Concrete Math Bold
// #set text(font: "Concrete Math")

// Math align* environment without numbering
#let nonum(eq) = math.equation(block: true, numbering: none, eq)


// custom symbols
#let ot = sym.times.circle

#let dt = $limits(X)_tilde$
#let mse = "MSE"
#let vr = "Var"
#let un = "Unif"
#let ex = "Exp"
#let be = "Ber"
#let bi = "Binom"
#let po = "Poi"
#let no = $cal(N)$
#let ga = "Gamma"
#let ca = "Cauchy"
#let bet = "Beta"
#let neq = $eq.not$
#let mse = "MSE"
#let vr = "Var"
#let neq = $eq.not$
