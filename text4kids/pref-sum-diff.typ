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

刚刚介绍了一维前缀和. 

从一维前缀和到二维前缀和. 

- 考虑$S[i][j]:=第 i 行 第 j 列$左上方所有元素的和

#figure(
  image("figs/perf-sum-diff/2d-psum.png")
)

实际上这是容斥原理$n=2$的情况. 

```
void prefixSum2D(int a[][C]){
	int s[R][C];
	s[0][0] = a[0][0];

	for (int i = 1; i < C; i++)
		s[0][i] = s[0][i - 1] + a[0][i];
	for (int i = 1; i < R; i++)
		s[i][0] = s[i - 1][0] + a[i][0];

	for (int i = 1; i < R; i++) {
		for (int j = 1; j < C; j++)
			s[i][j] = s[i - 1][j] + s[i][j - 1]
						                - s[i - 1][j - 1] + a[i][j];
	}
	
}
```

- 还是一种递归的情况

== P1387 最大正方形

#prob[
  在一个 $n times m$ 的只包含 0 和 1 的矩阵里找出一个不包含 0 的最大正方形, 输出边长。
]

- 想法: 把从每一个最小的正方形开始 "扩张"
- 注意扩张的时候能不能复用前面的内容?

要想从上往下扩展, 上面的是扩展好的, 新发现的节点一定靠右下角, 然后看是不是能够合并 
- 定义$f[i][j]:=$以$(i,j)$为正方形的右下角, 可以构成正方形的边长的最大值. 
  - Base case: 只有$a[i][j]=1$的时候才能够作为正方形的右下角节点
  - Inductive case: 考虑可以从哪里扩展?

#figure(
  image("figs/perf-sum-diff/sq-ind.png")
)

$
f[i][j]=min(f[i][j-1], f[i-1][j],f[i-1][j-1])+1, "若"a[i][j]=1
$

- 回顾刚才: 两个重要的因素
  - 状态的定义(如何定义子过程?)
  - 状态的转移
    - Base case是什么?
    - 转移的顺序?

== P2280 激光炸弹

#prob[
  #mitext(`一种新型的激光炸弹, 可以摧毁一个边长为 $m$ 的正方形内的所有目标。现在地图上有 $n$ 个目标, 用整数 $x_i, y_i$ 表示目标在地图上的位置, 每个目标都有一个价值 $v_i$ 。激光炸弹的投放是通过卫星定位的, 但其有一个缺点, 就是其爆破范围, 即那个边长为 $m$ 的边必须与 $x$ 轴, $y$ 轴平行。若目标位于爆破正方形的边上, 该目标不会被摧毁。`)
  - 问最多可以摧毁多少目标?
]

- 枚举所有可能的正方形, 看看哪个最大?
- 枚举的时候要使用前缀和

== P1083 借教室


#prob[
  需要处理接下来 $n$ 天的借教室信息, 其中第 $i$ 天学校有 $r_i$ 个教室可供租借。共有 $m$ 份订单, 每份订单说的是某租借者需要从第 $s_j$ 天到第 $t_j$ 天租借教室（包括第 $s_j$ 天和第 $t_j$ 天）, 每天需要租借 $d_j$ 个教室。

  先到先得, 也就是说我们要按照订单的先后顺序依次为每份订单分配教室。如果在分配的过程中遇到一份订单无法完全满足, 则需要停止教室的分配, 通知当前申请人修改订单。这里的无法满足指从第 $s_j$ 天到第 $t_j$ 天中有至少一天剩余的教室数量不足 $d_j$ 个。

  现在我们需要知道, 是否会有订单无法完全满足。如果有, 需要通知哪一个申请人修改订单。
]

朴素思路: 
- 每个订单就是一个区间操作: 把开始时间$~$结束时间的教室数量减去借的教室数量. 

问题: 前缀和适合不修改, 区间查询

当前的问题: 区间修改, 单点查询. 
- 把一个区间修改之后什么改变的少一些?

$
"原数组" quad &2 quad& [3 quad& 4 quad& 6] quad& 8 \
"差分数组" quad & ~ quad& 1 quad& 1 quad&2 quad& 3\
"+2的数组" quad& 2 quad& [5 quad& 6 quad& 8] quad& 8\
"+2之后的差分数组" quad & ~ quad& 3 quad& 1 quad& 2 quad & 0
$

- 区间里面的后一个数比前一个数差的不会变

如何在差分数组上面表示原数组上的 "区间加"? 
- $[l..r]$上加$x$
- $d[l]<-d[l]+x; d[r+1]<-d[r+1]-x$;

如何得到原数组? 
- 对差分数组求前缀和
- 需要一个初始条件$a_1$. 

但是这道题还不够

- 二分答案: 答案满足单调性

= 差分

== 差分和前缀和互为逆运算

- 前缀和 = 随着序列的累积过程
- 差分 = 序列的变化趋势

#figure(
  image("figs/perf-sum-diff/diff-cum.png")
)

#prob[
  要在区间加一个等差数列怎么做?
]

差分一次不够, 差分两次如何?

$
"原数组" & 1, & 2, & 3, & 4, & 5,& 6\ 
"差分一次"& 1, & 1, & 1, & 1, & 1, &1\
"差分两次" & 1, & 0, & 0, &0, &0, &0\
"在[1..3]加上等差数列(2,4,6)"& 3, & 6, & 9, & 4, & 5, &6\
"差分一次" & 3, &3, & 3,& -5, &1, &1\
"差分两次" & 3, & 0, & 0, &-8, & 6, &0
$

- 等于说对差分1次的数组又做区间加
- 那就再次差分
  - 记得二次差分数组在修改的地方有2处!

(可能还需要更好的数据结构维护两次前缀和, P1438 无聊的数列)

如何获得一般规律? 数学与符号来帮我们啦!

#prob[
  要在区间加一个数列的平方怎么做?
]

差分3次! 

- 根据刚刚的推导, 你能说为什么差分3次就可以化为区间加的问题了吗? 

== 差分的记号

#definition[
  #mitext(`对于一个数列, 定义其差分算子$\Delta f(x)$为`)
  #mimath(`\Delta f(x):=f(x+1)-f(x) .`)
]

- 算子作用在函数上, 给出新的函数. 其本质就是从函数到函数的映射. 

=== (a) 某些多项式的差分

1. 下降幂

#mitext(`如果我们求
	$$
		\Delta (\underbrace{x(x-1) \cdots(x-m+1)}_{m \text { 项 }})
	$$
	就会得到
	$$
		\begin{aligned}
			 & \Delta(\underbrace{(x(x-1) \cdots(x-m+1))}_{m \text { 项 }} \\
			 & =(x+1) x \cdots(x-m+2)-x(x-1) \cdots(x-m+1)                \\
			 & =m\underbrace{(x-1) \cdots(x-m+2)}_{m-1 \text { 项 }}
		\end{aligned}
	$$
	说明$\Delta$算子在上述的多项式上面作用有与求导算子在$x^m$次多项式有类似的效果.`)


  #definition[
    #mitext(`我们先定义
$$
	\underbrace{x(x-1) \cdots(x-m+1)}_{m \text { 项 }}
$$
为$x$的$m$次下降幂. 记作$x^{\underline m}$`)
  ]

从而有#mimath(`\Delta x^{\underline{m}}=m x^{\underline{m-1}} \text {. }`)

=== (b) 差分之后还是原来的函数的函数

#mitext(`希望找一个 $\Delta f(x)=f(x)$. 实际上,
$$
	\begin{aligned}
		 & f(x+1)-f(x)=f(x) \Leftrightarrow f(x+1)=2 f(x), \text { 即 } \\
		 & f(x)=2^x .
	\end{aligned}
$$`)

=== (c) 差分带来的运算

- 扔掉求和的上下标, 研究更广泛的一簇内容! 

#mitext(`$$
	\begin{array}{|ll|}
		\hline  f=\sum g       & \boxed{\Delta f}=g .                 \\
		\hline x^{\frac{m}{}} & m x^{\frac{m-1}{}}                   \\
		2^x                    & 2^x                                  \\
		c^x                    & (c-1) c^x                            \\
		\hline c \cdot u       & c \cdot \Delta u                     \\
		u+v                    & \Delta u+\Delta v                    \\
		u v                    & u \Delta v+E v \Delta u \\
		\hline
	\end{array}
$$`)

#example[分部求和法][
  #mitext(`注意到
$$
	\begin{aligned}
		 & \Delta(u(x) v(x))= u(x+1) v(x+1)-u(x) v(x) \\
		 & = u(x+1) v(x+1)-u(x) v(x+1)                \\
		 & +u(x) v(x+1)-u(x) v(x)                     \\
		 & =u(x) \Delta v(x)+v(x+1) \Delta u(x)
	\end{aligned}
$$

若定义$E f(x):=f(x+1)$, 那么
$$
	\Delta(u v)=u \Delta v+(E v) \Delta u \text {. }
$$
此时, 对两边同时取$\sum$, 有
$$
	\sum u \Delta v=u v-\sum(E v) \Delta u .
$$`)
]

== 二维差分

- 二维平面的方向可就多了! 凭什么选定某一个顺序

转换思路: 差分是前缀和的逆运算

- 差分的前缀和应该等于原数组

怎么办? 考虑一点一点构造差分矩阵

1. 初始状态: 原矩阵 $A$ 是全 0 矩阵, 那其差分矩阵 $B$ 显然也是全 0 矩阵
2. 归纳状态: 往原矩阵填入真实值, 顺便更新差分矩阵
  - 例如：题目中原矩阵的第 $(2,8)$ 个位置应该是 5 , 那相当于将原矩阵以 $(2,8)$ 为左上角, 同样以 $(2,8)$ 为右下角的所有元素加上了 5 。
  - 即: $B[2][8]<-B[2][8]+5; B[3][8]<-B[3][8]-5; B[2][9]<-B[2][9]-5 ; B[3][9]<-B[3][9]+5$. 

== 格局打开: 微积分

如果不再是离散的数列($f: ZZ->RR$), 而是连续的函数($f: RR -> RR$)

- 就打开了微积分的大门(强烈推荐3Blue1Brown的可视化系列视频!)

#figure(
  image("figs/perf-sum-diff/eoc.png", width: 80%)
)