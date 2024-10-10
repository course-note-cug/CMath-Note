#import "template.typ": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm

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

== Grammar

=== Priliminaries

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

A sequence of such operations will yield a valid formula. 

#definition[
  Construction sequence is a finite sequence $abra(epsilon_1, ..., epsilon_n)$ of expressions such that for each $i <= n$ we have at least 1 of 
  $
  epsilon_i "is a sentence symbol"; \
  epsilon_i = E_not (epsilon_j) "for some " j<i;\ 
  epsilon_i = E_square(epsilon_j, epsilon_k) "for some " j<i, k<i.
  $

  where $square$ is one of $and, or, ->, <->$. 
]

=== Structural Recursion

From top to bottom, 
$
S^* = sect.big{S: S" contains all propositional symbol and is closed under 5 operations"}
$

This shows that $S$ is a closure, hence we will use _induction principle_ to construct proofs. 

From bottom to top, 
- $S_0={A_1, ...}$
- $S_i={not alpha : alpha in S_(n-1)} union {alpha square beta : alpha, beta in S_(i-1), square=and, or, ->, <->}union S_(i-1)$.
- $S_*=#sym.union.big _n S_n$ 

This will demonstrate how the wff is constructed. 

These two views will cause the exactly the same set of languages.  

#theorem[
  Two methods of constructing will yield the same set of language, that is
$
S^*=S_* 
$
]

We will show induction principle. 

#theorem[
  Let $P(alpha)$ is a property about wff. Assume 
  - For all propositional symbol $A_i$, $P(A_i)$ holds;
  - For all wff $alpha, beta$, if $P(alpha), P(beta)$ holds, then $P(not alpha)$ and $P((alpha square beta)) $ holds, where $square in {and, or, ->, <->}$. 

  We can determine that forall wff $alpha$, $P(alpha)$ holds.
]

=== Unique readability

#definition[
  wff has exactly one of the following forms, where $alpha$ and $beta$ are wff:
  - atomic formula, that is sentence symbol $A_i$. 
  - $(not alpha)$
  - $(alpha and beta)$
  - $(alpha or beta)$
  - $(alpha -> beta)$
  - $(alpha <-> beta)$

  where $alpha, beta$ and the binomial connective $square$ is unique.
]

This yields the parsing algorithm. 

#algorithm({
  import algorithmic: *
  Function("ParseWFF", args: ($phi$, ), {
    Cmt[$phi$ is the root node ]
    Assign[$T$][$phi$] 
    While(cond: $not$+" all minimal verticies have atomic symbols", {
      Assign[$N$][leaf node that contains no atomic symbols]
      State[assert the first symbol of $N$ must be (]
      If(cond: "second symbol of "+$N$+" is "+$not$, {
        
      })
    })
  })
}
)



