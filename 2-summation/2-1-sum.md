#! https://zhuanlan.zhihu.com/p/684979172
(写在前面: 本文的 Markdown 版本由计算机程序自动生成并投稿.
因此可能会有错误. 这系列是《具体数学》浅显的阅读笔记. )

# 和式及其基本操作

要使得求和便于书写和分析, 我们最好(跟随傅里叶)引入如下的记号:$\sum$.

## 和式与求和记号

**定义 1** (求和记号$\sum$).
对于一个可数的集合$S=\{a_1, a_2, \cdots, a_n\}$,
求和实际上是将这个集合的每一个元素在某一个函数$f:S\to X$作用之后,
把对应的值相加. 记作$\sum_{i \in S} f(i)$;
表示$f\left(a_1\right)+f\left(a_2\right)+f\left(a_3\right)+\cdots+f\left(a_n\right)+\cdots$.

**例子 1**. 考虑

$$
\begin{aligned} & \sum_{\substack{1 \leq k \leq n}} a_k=a_1+a_2+\cdots+a_n . \\ & \sum_{\substack{1 \leq k \leq 100 \\ k \text { odd }}} k^2=\sum_{0 \leq k \leq 49}(2 k+1)^2 .\end{aligned}
$$


### 换元法

如果将 $\sum_{i \in S} f(i)$ 换为 $\sum_{k \in S} f(k)$ ,
求和的表示内容将不变. 这是因为仅仅是"当前 $S$
中的代表"用来表示的字母不同, 从而肯定不会影响整个映射$f$所表达的意思.

**例子 2**. 考虑

$$
\sum_{1 \leq k \leq n} a_k \stackrel{k\text{代换为}s+1}{\stackrel{\rule{1.5cm}{0.4pt}}{\rule{1.5cm}{0.4pt}}} \sum_{1 \leq s+1 \leq n} a_{s+1} \stackrel{s\text{代换为}k}{\stackrel{\rule{1.5cm}{0.4pt}}{\rule{1.5cm}{0.4pt}}} \sum_{1 \leq k+1 \leq n} a_{k+1}
$$


**注:**

有时候$\sum_{a \leq i \leq b} f(i)$也写作$\sum_{i=a}^b f(i)$.
但是看到这样一来, 变量代换之后就得到了

$$
\sum_{i=1}^n a_i\stackrel{k\text{代为}k+1}{\stackrel{\rule{1.2cm}{0.4pt}}{\rule{1.2cm}{0.4pt}}}\sum_{i=0}^{n-1} a_{i+1}
$$

更易于出错.

此外, 我们用$k:=k+1$来表示把$k$代为$k+1$. 最后, 数列可以看做特殊的函数.
实际上书写$a_k$实际上就相当于$f(k)$.

### 求和的性质

尽管我们可以对可数无限个元素进行求和操作, 但是,
那样的数列我们在高等数学的级数部分就已经学过了.
这里先讨论有限项求和的情形.

**定理 1**. 设$K$是某一有限个正整数的集合, 我们有如下的三条规则:

-   常数项进出求和记号: 
$$
\sum_{k \in k} c f(k)=c \sum_{k \in k} f(k);
$$


-   求和记号的拆分:
    
$$
\sum_{k \in K} f(k) g(k)=\sum_{k \in K} f(k)+\sum_{k \in K} g(k);
$$


-   若$p(k)$应用于$K$中的每一个元素之后组成的集合依然是$K$的一个排列,
    那么
$$
\sum_{k \in K} f(k)=\sum_{p(k) \in K} f(p(k)).
$$


上述定理的证明可以直接由定义得到.

**例子 3**. 如$K=\{-1,0,1\}, p(k)=-k$, 由于
$p(-1)=1, p(0)=0$,$p(1)=-1 , p$ 对 $k$ 中每一个元素构成集合为
$\{-1,0,1\}=K$.

**例子 4** (等差数列求和). 求 
$$
S=\sum_{0 \leq k \leq n}(a+b k)
$$
的值.

考虑 $$\begin{aligned}
             & S_2=\sum_{0 \leq k \leq n}(a+b k)                                                           \\
             & \stackrel{k:=n-k}{\stackrel{\rule{0.9cm}{0.4pt}}{\rule{0.9cm}{0.4pt}}} \sum_{0 \leq n-k \leq n}(a+b(n-k))=\sum_{0 \leq k \leq n}(a+b n-b k)
        \end{aligned}$$

令$S+S_2$ 得

$$\begin{aligned}
            S+S_2=2 S & =\sum_{0 \leq k \leq n}(a+b k)+\sum_{0 \leq k \leq n}(a+b n-b k)                   \\
                      & =\sum_{0 \leq k \leq n}(2 a+b n)=(2 a+b n) \sum_{0 \leq k \leq n} 1=(2 a+b n)(n+1)
        \end{aligned}$$

那 
$$
S=\frac{(n+1)(2 a+b n)}{2}.
$$


## Iverson括号

**定义 2** (Iverson 括号). 假设$P$是一个命题, 定义
$$[P]=\left\{\begin{array}{lr}
            1, & \text{命题}P\text{为真} \\
            0, & \text{命题}P\text{为假}
        \end{array}\right.$$

这样的记号便于优化很复杂的求和操作,
并且可以把求和符号的下标转换为命题之间的操作.

**例子 5**. 求和式 $\sum_{0 \leq k \leq n} k$ 可被改为
$\sum_k k[0 \leq k \leq n]$.

如果 $k$ 未指定限定条件, 我们认为 $k \in \mathbb{Z}$. 也就是说上述式子

$$\begin{aligned}
            \sum_k k[0 \leq k \leq n]= & \cdots+(-3 \cdot 0)+(-2 \cdot 0)+(-1 \cdot 0)+(0 \cdot 0)+(1 \cdot 1)+(2 \cdot 1)+\cdots  +(n \cdot 1) \\
            =                          & (0 \cdot 1)+(1 \cdot 1)+\cdots+(n \cdot 1)
        \end{aligned}$$

**例子 6**. 如果$K$与$K'$是两个整数集合, 那么$\forall k$,

$$
[k \in K]+\left[k \in K^{\prime}\right]=\left[k \in\left(K \cap K^{\prime}\right)\right]+\left[k \in\left(K \cup K^{\prime}\right)\right]
$$


由此可以导出对应的和式

$$
\sum_{k \in k} a_k+\sum_{k \in k^{\prime}} a_k=\sum_{k \in k \cap k^{\prime}} a_k+\sum_{k \in k U k^{\prime}} a_k
$$


这是一个很有用的命题. 下面我们会看到它的用途.

**命题 2**.
$[k \in K]+\left[k \in K^{\prime}\right]=\left[k \in\left(K \cap K^{\prime}\right)\right]+\left[k \in\left(K \cup K^{\prime}\right)\right]$对
$k , k^{\prime}$ 为可数集, $\forall k$.

## 常见的求和方法

### 成套方法

这个方法类似于在解答微分方程的时候, 首先求解特解, 然后求解通解.
在这里我们不再赘述.

### 扰动法

要计算$S_n=\sum_{0 \leq k \leq n} a_k$, 可以有两种方法改写

**命题 3**. 扰动法是指

$$\begin{align*}
            \boxed{S_{n}+a_{n+1}}=\sum_{0\leq k\leq n+1}a_{k} & =a_{0}+\sum_{1\leq k\leq n+1}a_{k}                        \\
                                                              & \stackrel{k:=k+1}{\stackrel{\rule{0.9cm}{0.4pt}}{\rule{0.9cm}{0.4pt}}}a_{0}+\sum_{1\leq k+1\leq n+1}a_{k} \\
                                                              & \boxed{=a_{0}+\sum_{0\leq k\leq n}a_{k}}
        \end{align*}$$

**例子 7**. 用上述的方法计算等比数列.
$S_n=\sum_{0 \leq k \leq n} a x^k$. $$\begin{aligned}
            S_n+a x^{n+1} & =a x^0+\sum_{0 \leq k \leq n} a x^{k+1} \\
                          & =a x^0+x \sum_{0 \leq k \leq n} a x^k   \\
                          & =a x^0+x S_n
        \end{aligned}$$

对于$x\neq 1$, 有 
$$
S_n=\sum_{k\neq 1}^n a x^k=\frac{a-a x^{n+1}}{1-x}
$$


**例子 8** (等差数列乘等比数列). 计算

$$
S_n=\sum_{0 \leq k \leq n} k \cdot 2^k.
$$


按照上面的方法, $$\begin{aligned}
            S_n+(n+1) 2^{n+1} & =0+\sum_{0 \leq k \leq n}(k+1) 2^{k+1}                                    \\
                              & = 0+\sum_{0 \leq k \leq n} k \cdot 2^{k+1}+\sum_{0 \leq k \leq n} 2^{k+1} \\
                              & =2 S_n+ 2^{n+2}-2
        \end{aligned}$$

解出 $S_n$, 就是


$$
S_n=\sum_{0 \leq k \leq n} k 2^k=(n-1) 2^{n+1}+2 \text {. }
$$


**例子 9**. 从上面的推导中,
我们知道$\sum_{k=0}^n x^k=\frac{1-x^{n-1}}{1-x}$ , 两边对 $x$ 求导, 就有
$$\begin{aligned}
            \sum_{k=0}^n k x^{k-1} & =\frac{(1-x)\left(-(n+1) x^n\right)+1-x^{n+1}}{\left(1-x^2\right)} \\
                                   & =\frac{1-(n+1) x^n+n x^{n+1}}{(1-x)^2} .
        \end{aligned}$$

同样也可以得到上一式子的结果.

### 求和因子

**例子 10**. 由递推关系 $$\begin{aligned}
             & T_0=0           \\
             & T_n=2 T_{n-1}+1
        \end{aligned}
$$
 倘若两端同时除以$2^n$, 就得到 
$$
\begin{aligned}
             & T_0 / 2^0=0                         \\
             & T_n / 2^n=T_{n-1} / 2^{n-1}+1 / 2^n
        \end{aligned}$$ 令 $S=T_n / 2^n$ ,得
$\left\{\begin{aligned} & S_0=0 \\ & S_n=S_{n-1}+2^{-n}\end{aligned}\right.$,
即 $S_n=\sum_{k=1}^n 2^{-k}$ , 为一等比数列.

对于更为一般的式子, 如 $a_n T_n=b_n T_{n-1}+c_n$, 可变为
$S_n=S_{n-1}+ S_n c_n$的形式.

$1^\circ$ 方法: 使两边同时乘以求和因子 $S_n$:


$$
\underbrace{\boxed{s_{n}a_{n}T_{n}}}_{:=S_{n}}=\underbrace{S_{n}b_{n}T_{n-1}}_{\text{必须得是}S_{n-1}=S_{n-1}a_{n-1}T_{n-1}}+S_{n}c_{n}
$$

由此
$S_n=S_0 a_0 \cdot T_0+\sum_{k=1}^n S_k c_k=S_1 b_1 T_0+\sum_{k=1}^n S_k c_k$
,
那么
$$
T_n=\frac{1}{S_n a_n}\left(S_1 b_1 T_0+\sum_{k=1}^n S_k c_k\right)
$$
.

$2^\circ$ 寻找$S_n$的方法:
由于上式要满足$S_n b_n T_{n-1}=S_{n-1} a_{n-1} T_{n-1}$, 代入展开, 有

$$\begin{aligned}
        s_n & =\frac{s_{n-1} a_{n-1}}{b_n}                                 \\
            & =\frac{s_{n-2} a_{n-1} a_{n-2}}{b_n b_{n-1}}=\cdots          \\
            & =\frac{a_{n-1} a_{n-2} \cdots a_1}{b_n b_{n-1} \cdots b_2} .
    \end{aligned}$$

因此我们就这样找到了求和因子.

**例子 11**. 解由快速排序带来的递归式:

$$\begin{aligned}
             & C_0=0                                                 \\
             & C_n=n+1+\frac{2}{n} \sum_{k=0}^{n-1} C_k \quad, n>0 .
        \end{aligned}$$

将 $C_n$ 两侧同乘以 $n$, 得

$$
n C_n=n^2+n+2 \sum_{k=0}^{n-1} C_k \quad(n>0).
$$


令 $n:=n-1$, 有 
$$
(n-1) C_{n-1}=(n-1)^2+(n-1)+2 \sum_{k=0}^{n-2} c_k.
$$


上面两式相减, 有$n C_n-(n-1) C_{n-1}=2 n+2 C_{n-1}$, 即

$$\begin{aligned}
            C_0   & =0                   \\
            n C_n & =(n+1) C_{n-1}+2 n .
        \end{aligned}$$

将上述 $a_n=n, b_n=n+1, c_n=2 n$, 得
$s=\frac{(n-1) \cdots 1}{(n+1) \cdots 3}=\frac{2}{n(n+1)}$.

得 
$$
C_n=2(n+1) \sum_{k=1}^n \frac{1}{k+1}=2(n+1) H_{n+1}.
$$

