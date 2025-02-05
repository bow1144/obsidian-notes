
BTree 的查找和二叉排序树类似，但是每个结点都是有序表

1. **在 BTree 中找结点**：
	- BTree存储在磁盘上，首先要在磁盘中找到结点，将结点交换在内存上
	- BTree的**层次数**就是磁盘查找数，决定了 BTree 的查找效率
2. **在结点中找关键字**：
	- 在结点表中找关键字，找到则成功
	- 否则到指针的子树中查找
	- 如果找到叶节点（失败结点），说明查找失败

**BTree 的磁盘存取次数与高度正比**，讨论高度时**不包括失败结点**
1. 每个结点关键字最多时，BTree的高度最小，有 $h \geq \log_m(n+1)$
2. 每个结点关键字最少时，BTree的高度最大，每个结点至少 $\lceil m/2 \rceil$ 棵子树，有 $h \leq \log_{\lceil m/2 \rceil} ((n+1)/2)+1$
3. 即 $\log_m(n+1) \leq h \leq \log_{\lceil m/2 \rceil} ((n+1)/2)+1$，例如3阶BTree有8个关键字，高度为 $2 \leq h \leq 3.17$，取整数

------

![[{D0510A76-7E88-4222-B1AF-DCAEAD06FF03}.png]]
- 最大高度：子树最小
	- 根节点2子树（1关键字）
	- 结点/关键字：1/0 2/1 6/4 18/12 54/36
	- 最大恰好五层
- 最小高度：子树最大
	- 根节点5子树（4关键字）
	- 结点/关键字：1/0 5/4 25/20 125/100
	- 最小高度为4
- 偶然发现结点*n*与关键字*k*的关系：$k_h = n_h - n_{h-1}$
~~DC~~
~~*错误原因：BTree的高度不包括失败结点*~~
*错误原因：高度要从关键字为1的层开始计算*
*并且有公式 $\log_m(n+1) \leq H \leq \log_{\lceil m/2 \rceil}((n+1)/2)+1$
*得到最大高度为4，最小高度为3

![[{DDDFCC46-94E0-4A35-9997-F7F8EC905AC5}.png]]
- 最大高度：1/0 2/1 4/2 8/4 ... 2048/1024，看起来是12
- 最小高度：1/0 3/2 9/6 27/18，可得 $m_{max} = \frac{2*(1-3^{h-1})}{1-3} = 3^{h-1}-1$，又 $3^7=2187$，看起来最小高度为 7
*最大高度：*$\log_{\lceil 3/2 \rceil}(1024)+1 = \log_2 1024 + 1 = 11$
*最小高度：*$\log_3 2048 = 6.9 \approx 7$
*AD*

![[{324FB683-C5E7-4D96-A3BD-0C3F664E047E}.png]]
题目翻译：2016个关键字对应的7阶BTree的最大层数
1/0 7/6 49/42 343/294 2401/2058
除了根节点，还有四层
A
*带入公式有 $h_{max} = 5$

![[{6ACEEF80-680F-4FFC-90E4-E78F11889159}.png]]
关键字个数最少：
1. 第一层1个关键字，第二层2\*2=4个关键字
2. 失败层有2\*3=6个失败结点，不计入关键字
A

![[{8B740DD2-F91C-42F2-A936-CEA4FCBF47D1}.png]]
要使含有关键字的结点更多，就要使BTree的分叉更少
根节点有一个关键字，其它结点有两个分叉，一个关键字
D

![[{E787EDC6-D1C5-4566-9A07-6C84778946D3}.png]]
$H_{max} \geq \log_{\lceil m/2 \rceil} (n+1)/2+1 ; 5 \geq \log_3 ((n+1)/2)+1$
$(n+1)/2 > 27$
*结点：1 2 4 8 16 32*
*关键字：0 1 2 4 8 16*
*B*

![[{643A2AFA-3088-4592-8F31-01AEBBCAD76C}.png]]第二层的关键字：1，2，1
第三层的结点：2 3 2
结点：1 3 7 = 11
A