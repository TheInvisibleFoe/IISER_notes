#import "@preview/physica:0.9.5": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/subpar:0.2.2"
#import "@preview/i-figured:0.2.4"
#show: thmrules
#import "@preview/colorful-boxes:1.4.3"
#import "@preview/showybox:2.0.4"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#codly(languages: (python: (name: "Python", color: rgb("#006699"))))


// // Alternate Link styles, have to experiment later.
// #show link: set text(navy)
// #show link: this => {
//   let show-type = "box" // "box" or "filled", see below
//   let label-color = olive
//   let default-color = eastern

//   if show-type == "box" {
//     if type(this.dest) == label {
//       // Make the box bound the entire text:
//       set text(bottom-edge: "bounds", top-edge: "bounds")
//       box(this, stroke: label-color + 1pt)
//     } else {
//       set text(bottom-edge: "bounds", top-edge: "bounds")
//       box(this, stroke: default-color + 1pt)
//     }
//   } else if show-type == "filled" {
//     if type(this.dest) == label {
//       text(this, fill: label-color)
//     } else {
//       text(this, fill: default-color)
//     }
//   } else {
//     this
//   }
// }



// After proof end, insert a QED symbol
#let qe = $suit.club.filled$

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
  stroke: rgb("#000000") + 1pt,
  radius: 0.0em,
)

#let result = thmbox(
  "result", // Definitions use their own counter
  "Result",
  fill: rgb("#CDF1D6"),
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


// #let result(..args) ={
//   let title= args.pos().at(0)
//   showybox(
//   title :title,
//   frame: (
//     border-color: blue,
//     title-color: blue.lighten(30%),
//     body-color: blue.lighten(95%),
//     footer-color: blue.lighten(80%)
//   ),
//   footer: "Information extracted from a well-known public encyclopedia"
// )[

// ]
// }

// Macros for commonly used symbols and constructs

// align* environments
#let nonum(eq) = math.equation(block: true, numbering: none, eq)

#let cq = counter("q")
#let q(content) = { set text(fill:red,weight:"bold", font:"CMU Sans Serif")
                    cq.step()
                    [*Q*]
                    context cq.display()
                    [*: *]
                     content
                    }


#let ctd = counter("td")
#let td(content) = { set text(fill:blue,weight:"bold", font:"CMU Sans Serif")
                ctd.step()
                [*TODO *]
                context ctd.display()
                [*: *]
                  content
                                    }


                                    
// Basic Symbols
#let ot = sym.times.o
#let xx = $bold(x)$
#let pm = sym.plus.minus
#let mp = sym.minus.plus
#let infty = sym.infinity
#let eps = $epsilon.alt$
#let kb = $k_B$
#let int = $integral$
#let neq = sym.eq.not
#let prod = $product$

/// Expval with probabilitites
#let lol(..args) = {
  let expr = args.pos().at(0, default: none)
  let func = args.pos().at(1, default: none)

  if func == none {
    $lr(chevron.l.double expr chevron.r.double)$
  } else {
    $lr(chevron.l.double func#h(0pt)mid(|)#h(0pt)expr#h(0pt)mid(|)#h(0pt)func chevron.r.double)$
  }
}
#let pexpval = lol

// #let defn(..args) = {
//   let tit = args.pos().at(0, default: none)
//   let body = args.pos().at(1, default: none)
  
//   colorbox(
//   title: tit,
//   color: (
//     fill: rgb("#f0f8ff"),
//     stroke: rgb("#00bfff"),
//     title: rgb("#002366")
//   ),
//   radius: 4pt,
//   width: auto
// )[
//   #body
// ]}
// stoch therm
#let aep = $dot(S)$
#let kx = $k_(x x')$
#let kxp = $k_(x' x)$
#let xh = $hat(x)$
#let ph = $hat(p)$

#let wn = $hat(xi)(t)$
#let wno(t) = {$hat(xi)(#t)$}
#let fg = $cal(F)(xh,t)$
#let pxs = $p^"ss"_(x)$
#let pps = $p^"ss"_(x')$
#let svh = $med circle.small med$
#let ito = $med circle.filled.tiny med$
#let pr = $p(x;t)$
#let lfp = $bold(frak(L))$
#let odr = $D^((1)) (x,t)$
#let odiff = $D^((2)) (x,t)$

#let vbu(input) = {$upright(bold(#input))$}

#let mdr = $vb(D)^((1)) (vb(x),t)$
#let mdiff = $vbu(D)^((2))(vb(x),t) $
// trying out macros for greek letter.
#let aa = $alpha$
#let bb = $beta$
#let ll = $lambda$



// Define a macro to disable numbering in a section and exclude it
// from the outline
#let nonumber(body) = {
  set heading(numbering: none, outlined: false)
  body
}
