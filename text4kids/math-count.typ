#import "@preview/touying:0.4.2": *
#import "@preview/ctheorems:1.1.2": *
#import "@preview/mitex:0.2.4": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold

#show: thmrules


#let theorem = thmbox("theorem", "定理", fill: rgb("#c2dcc2"))
#let corollary = thmplain(
  "corollary",
  "推论",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "定义", inset: (x: 1.2em, top: 1em)).with(numbering: "1")

#let example = thmplain("example", "例子").with(numbering: none)
#let prob = thmplain("prob", "问题", inset: (x: 1.2em, top: 1em, bottom:1em)).with(fill: 
rgb("#dfebdf")).with(numbering: none)

#let prop = thmplain("prop", "性质", inset: (x: 1.2em, top: 1em, bottom:1em)).with(fill: 
rgb("#def5c3")).with(numbering: "1.")

#let proof = thmproof("proof", "证明")

#let s = themes.university.register(aspect-ratio: "4-3")
#let s = (s.methods.info)(
  self: s,
  title: [8. 基本计数技术; 容斥原理],
  author: [张桄玮(gwzhang\@cug.edu.cn)],
  date: datetime.today(),
  institution: [郑州一中(Legacy)],
)
#let (init, slides) = utils.methods(s)
#show: init


#let (slide, empty-slide) = utils.slides(s)
#show: slides

= 枚举基本定理

== 如何数数?

一句话讲完今天的内容:

#theorem[
  $
  |A|=sum_(a in A) 1.
  $
]

- 这玩意有用吗😂
- 加法和乘法的本质
- 寻找$f: A->B$一一的映射, 那么$|A|=|B|$

计数的本质是集合的生成(枚举). 

- 加法原理: $|A union B|=|A|+|B| 满 足(A sect B = emptyset)$
- 乘法原理: $|A times B|=|A||B|$.

== 从集合的视角观察以前的内容

马上: 加法原理, 乘法原理. 
#slide[
#prob[
  $n>1, n in ZZ$, 求满足$x+y<=n$的有序正整数对$(x,y)$的个数. 
]

- 全部的集合: $S={(x,y): x+y <=n; x,y in ZZ^+}$
- 分类: $A_k={(k,y):(k,y)in S}, k=1,2,3,...,n-1$.
  - $|A_k|=n-k$
- 两两之间没有交集
- $|S|=sum_(k=1)^(n-1)|A_k|=1/2n(n-1)$
]

#slide[
#prob[
  求$n$元集合$S={a_1, a_2, ..., a_n}$的子集的个数. 
]

考虑第$k$步, 是否选择$a_k$作为子集的元素. 每一步都有2中方法

]

= 练习题

== P5520 简单组合问题

P3197 越狱

== P2822 组合数的求法

== P3807 Lucas定理

== P2290 树的计数

== P3197 另一个模板题

