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
rgb("#aaf7ba")).with(numbering: "1.")

#let proof = thmproof("proof", "证明")

#let s = themes.university.register(aspect-ratio: "4-3")
#let s = (s.methods.info)(
  self: s,
  title: [4. 前缀和与差分],
  author: [张桄玮(gwzhang\@cug.edu.cn)],
  date: datetime.today(),
  institution: [郑州一中(Legacy)],
)
#let (init, slides) = utils.methods(s)
#show: init


#let (slide, empty-slide) = utils.slides(s)
#show: slides


= 从运算说起

== 运算 = 函数

- $a+b$实际上是我们有一个二元函数$"add"(a,b)$
  - $"add": RR times RR -> RR$

- 就像C++大家写的`function`一样

- 许多时候的问题: 将一个运算反复多次

```
add(add(add(add(1,2),3),4),5)
```

问题: 这段表达式用加法怎么写?

- 两种记号的优缺点: 
  - C++风格: 很轻松处理多元函数(多加几个逗号);
  - 日常的风格: 二元函数
    - 交换律, 结合律可以很好地被体现. 

== 不断对一个列表相加 = 求和

- 对一个 "不定长的东西" 施以求和

```cpp
// T 是某种类型, f是某个函数
T sum(vector<T> list){
  T result = 零元;
  for(int i=0; i<list.length(); i++){
    result += f(list[i]);
  }
  return result;
}
```

数学上面的记号: 
$
sum_(i in"list") f(i)
$

Python: `sum(map(list, lambda x: ...))`

- 先把列表中的元素映射成想要的值, 然后加起来. 

== 求和记号

#definition[
  对于一个可数的集合$S={a_1, a_2, ..., a_n}$, 求和实际上是将这个集合的每一个元素在某一个函数$f:S -> X$作用之后, 把对应的值相加. 记作$sum_(i in S) f(i)$; 表示$f(a_1)+f(a_2)+f(a_3)+...+f(a_n)+...$.
]

感到恐慌的时候核心指导原则

- 把求和记号写成$sum_(i in "list") f(i)$ 的形式
- 把求和记号拆开成普通的连加号

接下来: 考察一些求和记号的性质

=== a) 换元法(变量代换)

- #mitext(`
如果将 $\sum_{i \in S} f(i)$ 换为 $\sum_{k \in S} f(k)$ , 求和的表示内容将不变.
`)
  - #mitext(`"当前 $S$ 中的代表" 用来表示的字母不同, 从而肯定不会影响整个映射$f$所表达的意思.`)

#example[
  #mitext(`
  \newcommand{\varsub}[2]{\xlongequal{#1}{}}
  $$
		\sum_{1 \leq k \leq n} a_k \varsub{k\text{代换为}s+1}{1.5cm} \sum_{1 \leq s+1 \leq n} a_{s+1} \varsub{s\text{代换为}k}{1.5cm} \sum_{1 \leq k+1 \leq n} a_{k+1}
	$$
  `)
]

- 经常对于整数的指标求和, 所以#mitext(`$\sum_{a \leq i \leq b} f(i)$也写作$\sum_{i=a}^b f(i)$.`)

这样在做变量代换的时候就会发生
#mitext(`
\newcommand{\varsub}[2]{\xlongequal{#1}{}}
$$
		\sum_{i=1}^n a_i\varsub{i\text{代为}i+1}{1.2cm}\sum_{i=0}^{n-1} a_{i+1}
	$$
	更易于出错.`)"换元必换上下限(这绝不是你最后一次遇到这个)"

相当基本: 做抽象, 做简化

变量的代换
- 记号: 用$k:=k+1$来表示把$k$代为$k+1$. 
- 条件: "自由" 的变量(没有具体地特指某一件事儿)

#example[
  初中数学: "上加下减, 左加右减" 感觉不对称? 

  - 变量代换
]

#example[
  说说下列的推导为什么错了?

  #mitext(`$$\left(\sum_{j=1}^n a_j\right)\left(\sum_{k=1}^n \frac{1}{a_k}\right)=\sum_{j=1}^n \sum_{k=1}^n \frac{a_j}{a_k}=\sum_{k=1}^n \sum_{k=1}^n \frac{a_k}{a_k}=\sum_{k=1}^n n=n^2$$.`)
]

=== b) 记号带来的性质

#prop[
  #mitext(
    `设$K$是某一有限个正整数的集合, 我们有如下的三条规则:

	\begin{itemize}
		\item 常数项进出求和记号: $$
			      \sum_{k \in k} c f(k)=c \sum_{k \in k} f(k);
		      $$
		\item 求和记号的拆分: $$
			      \sum_{k \in K} f(k)+ g(k)=\sum_{k \in K} f(k)+\sum_{k \in K} g(k);
		      $$
		\item 若$p(k)$应用于$K$中的每一个元素之后组成的集合依然是$K$的一个排列, 那么$$
			      \sum_{k \in K} f(k)=\sum_{p(k) \in K} f(p(k)).
		      $$
	\end{itemize}`
  )
]

#example[
  #mitext(`如$K=\{-1,0,1\}, p(k)=-k$, 由于 $p(-1)=1, p(0)=0$,$p(1)=-1 , p$ 对 $k$ 中每一个元素构成集合为 $\{-1,0,1\}=K$.`)
]

- 老师讲的: "等差数列求和" 的故事, 求和记号的三条性质可以严肃地捕捉

#example[等差数列求和][
#mitext(`
\newcommand{\varsub}[2]{\xlongequal{#1}{}}
求 $$
		S=\sum_{0 \leq k \leq n}(a+b k)
	$$的值.

	考虑
	$$
		\begin{aligned}
			 & S_2=\sum_{0 \leq k \leq n}(a+b k)                                                           \\
			 & \varsub{k:=n-k}{0.9cm} \sum_{0 \leq n-k \leq n}(a+b(n-k))=\sum_{0 \leq k \leq n}(a+b n-b k)
		\end{aligned}
	$$

	令$S+S_2$ 得

	$$
		\begin{aligned}
			S+S_2=2 S & =\sum_{0 \leq k \leq n}(a+b k)+\sum_{0 \leq k \leq n}(a+b n-b k)                   \\
			          & =\sum_{0 \leq k \leq n}(2 a+b n)=(2 a+b n) \sum_{0 \leq k \leq n} 1=(2 a+b n)(n+1)
		\end{aligned}
	$$

	那 $$
		S=\frac{(n+1)(2 a+b n)}{2}.
	$$
`)

]

== 求区间和

给定一个数列$a$, 希望求出$sum_(i=l)^r a_i$?
- 一个`for`循环即可
- 如果有$10^5$的询问?

定义前缀和数组$s$, 满足$s_i=sum_(i=1)^i a_i$. 

- 要得知$[l..r]$的和, 只需要$s_r-s_(l-1)$
  - 为什么? 试着推导一下

#prob[
  能不能仿照这前缀和, 发明一个前缀 "积" 出来?
]

关键: 对列表一部分施以*加法*, 任何需要的区间可以从一个较大的区间*减去*得到我想要的值. 

对应: 加法运算意义下0相当于乘法中的谁? 加法的逆运算是减法, 乘法的逆运算是谁?

- 一个数 +0 就像是 一个数 $times 1$. 
- 乘法的逆运算是除法

思路: 维护$s_i:=a_1 a_2...a_i$, 要求出某一个区间的时候用除法.

如果对于一个列表做了映射之后的操作是乘法, 就可以写作
$
product_(i in "list") f(i)
$

这就是为什么没有另外花费篇幅介绍$product$的各种性质
- 取一下$log$就又变成求和了...!

== 格局打开: 奇形怪状的运算

#example[
  定义正方形纸片上的运算$arrow.cw.half$表示把正方形纸片顺时针旋转90度.

  - 逆运算: 
    - 把正方形纸片逆时针旋转90度
    - $arrow.cw.half^(-1)=#sym.arrow.cw.half arrow.cw.half arrow.cw.half$
]

#prob[
  #mitext(
    `现在有编号为 $0 \sim 10$ 一共 10 个球, 我们现在有若干个区间的对换. 具体地, 对于区间 $[l . . r]$ 的对换之后, 如果原来这方面的球的编号是 $\cdots, a_l, a_{l+1}, \cdots, a_r, \cdots$, 那么经过这次对换之后，这个区间的球的顺序就变成了 $\cdots, a_{l+1}, a_{l+2}, \cdots, a_r, a_l, \cdots$ 。
现在你有 $n$ 条操作规则, 每条操作规则就是两个数 $l, r$. 现在, 我们想知道你连续执行编号 $a$ 到编号 $b$ 的操作规则之后，得到的内容是多少. 注意有 $m$ 次查询.
数据范围: $1 \leq n, m \leq 10^5, 0 \leq a, b \leq 9,1 \leq l \leq r \leq n .$`
  )
]

- 数: 交换的左端点和右端点
- 运算: 就是我们的交换操作
- 运算的逆运算: 交换, 然后再交换

== JOI2007A 最大的和

#prob[
  读入 $n$ 个整数的数列 $a_1, a_2, ..., a_n$ 和正整数 $k(1 <= k <= n)$, 请输出连续排列的 $k$ 个整数的和的最大值。
]

- 维护前缀和
- 然后只要$O(n)$的时间得到想要的值!

== 回顾: 前缀和

对什么操作比较好? 对什么操作支持得不好?

- 这个数列最好是固定下来的, 不要有变动产生! 

#figure(
  image("figs/perf-sum-diff/pref-sum.png")
)

- 对于区间查询支持的很好!

= 前缀和

== 二维前缀和

从一维前缀和到二维前缀和. 

- 考虑$S[i][j]:=第 i 行 第 j 列$左上方所有元素的和

#figure(
  image("figs/perf-sum-diff/2d-psum.png")
)


