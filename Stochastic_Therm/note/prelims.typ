#import "imports.typ": *

= Preliminaries
To completely understand, verify and most importantly appreciate the solutions of the models outlined here, some preliminaries must be talked about. The Ising Model is quite well researched because it is an analytically solved model where we observe a phase transition. Some of the models here are quite ridiculous to study from a physical standpoint, however they provide insights into the solutions of other models that are harder to solve. So physicists cherish and appreciate and sometimes obsess over the models that we can solve analytically.


== The General Ising Model
== Phase Transitions and Critical points
== The Scaling Hypothesis
== Universality
== Correlations <corr>
Let us understand correlations from the point of view of the Ising Model. Let us consider two Ising Spins $sigma(x)$ and $sigma(x')$. Then the correlation function is defined as
$ g(d) = expval(sigma(x)sigma(x')) - expval(sigma(x)) expval(sigma(x')) $
where $d = |x-x'|$. The second term represents how they behave when they are isolated and independent. The first term shows how on an average the behaviour of the one the spins influences the other spin. Here we thus quantify how the behaviour changes between cases when are allowed to interact and when they are kept isolated. For more intuition and better explanations consider reading chapter 10 of @sethna2006statistical.

