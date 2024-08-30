#import "template.typ": *

#let title = "Sentential Logic"
#let author = "Herbert B. Enderton"
#let professor = "Wangzhou Dai"
#let creater = "Guangwei Zhang"
#let time = "Spring 2024"
#let abstract = "This document further extends the concept taught in Discrete Mathematics on Logics. We will focus on the sentinal logic in this lecture."

#show: note_page.with(title, author, professor, creater, time, abstract)

#let abra(..arr) = {
  let res = arr.pos().join(", ")
  [$angle.l$ #res $angle.r$]
}

= Sentential Logic

== Priliminaries

The language of sentential logic is shown below: 

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [Symbol], [Verbose name], [Remarks],
  ),
  "(","left parentesis(括号)", "punctuation",
  ")","right parenthesis", "punctuation",
  $not$, "negation", "english: not", 
  $and$, "and", "english: and",
  $or$, "or", "english: or",
  $->$, "conditional", "if ... then ...",
  $<->$, "bidirectional", "if and only if", 
  $A_i$, "i-th sentence symbol", "countably infinite in use"
)

Notes: 
1. Natural language is a metalanguage for thinking, and rewriting into logical formulas. 
2. _Sequence_ are composed by _Symbols_. 
  - $angle.l (, not, A_1, ) angle.r = (not A_1)$. 
  - length: \#symbol appear
    - empty expression: expression whose length is 0, denoted as $emptyset$. 
    -  $angle.l, angle.r, emptyset$ are symbols in metalanguage. 
3. No symbol is a finite sequence of other symbols. This means $abra(a_1, a_2, ..., a_m) = abra(b_1, b_2, ..., b_n) <==> (m=n) and (a_i=b_i)$. 
  - $a_i, b_j$ is still in metalanguage. 

#definition[
_Expression_ is a sequence consists of finite _symbols_. 
]

If $alpha$ and $beta$ are expressions, then their concatiation $alpha beta$ is still a expression. 

#definition[
Well formed formula(wff) is constructed as follows:
1. Every propositional symbol is a wff (atomic formula).
2. If $alpha, beta$ is wff, then $(not alpha)$ and $(alpha square beta)$ are wffs, where $square$ denotes one of $and , or ->, <->$. 
3. Otherwise, it is not a wff.
]

Expressing rules above rules as BNF: 
$
phi ::=A_i | (not phi_i) | (phi_1 and phi_2)|(phi_1 -> phi_2) | (phi_1 <-> phi_2).
$

Analyzing them as AST will yield formula-building operations, defined as follows: 

#definition[
  $
  E_not(alpha) = (not alpha)\
  E_and (alpha, beta) = (alpha and beta)\
  E_or (alpha, beta) = (alpha or beta)\
  E_-> (alpha, beta) = alpha -> beta\
  E_<-> (alpha, beta) = alpha <-> beta 
  $
]

A sequence of such operation will yield a valid formula. 

#definition[
  Construction sequence is a finite sequence $abra(epsilon_1, ..., epsilon_n)$ of expressions such that for each $i <= n$ we have at least 1 of 
  $
  epsilon_i "is a sentence symbol"; \
  epsilon_i = E_not (epsilon_j) "for some " j<i;\ 
  epsilon_i = E_square(epsilon_j, epsilon_k) "for some " j<i, k<i.
  $

  where $square$ is one of $and, or, ->, <->$. 
]



