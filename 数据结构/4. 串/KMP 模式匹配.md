### KMP 算法

- 简单匹配低效的根源：**重复与子串的前缀自身比较**
- **子串的部分概念**：
	- **部分匹配值PM**：最长相等前后缀；以`"abcac"`为例，PM为`0 0 0 1 0`
	- **PM的作用**：计算移动位数
$$移动位数 = 已匹配字符数 - 最后匹配位的PM值$$
- KMP的**时间复杂度**：$O(m+n)$
- **KMP的原理**：移动到**最长的前后缀相等处**

### PM 序列的改进

- 需要找到上一个成功匹配位，不太方便
- 将PM序列整体**右移一位**，第一个空缺补上 -1，得到`next`数组
- 为使公式简洁，对 next 数组整体 +1
- 例如`abcac`的 next 数组为 `0 1 1 1 2`
- 计算移动位数（失配位：子串没有匹配的那一位）
$$ 移动位数 = 失配位 - next[失配位] $$
![[{87B9EC95-0CA9-4760-9E6A-0B35B28787EB}.png]]
$$ 移动位数 = 5 - next[5] = 5 - 2 = 3 $$
- 得到子串指针变换公式：`j = next[j]`

### next 序列的求解

- next 函数公式
$$ next = \begin{cases}
0, \,\, j=1 \\
max\{k | 1<k<j\ and\ p_1...p_{k-1} = p_{j-k+1}...p_{j-1}\}，此集合不为空 \\
1, \,\, 其它情况 
\end{cases}
$$

```
void get_next(SString T, int next[]) {
	int i = 1, j = 0;
	next[1] = 0;
	while(i < T.length) {
		if(!j || T.ch[i] == T.ch[j]) next[++i] = ++j;
		else j = next[j];	
	}
}
```

### KMP 匹配

- 匹配成功时：i，j向前移动
- 失败时：j回溯，i不变

```
int Index_KMP(SString S, SString T, int next[]) {
	int i=1, j=1;
	while(i<=S.length && j<=T.length) {
		if(!j || S.ch[i]==T.ch[j]) i++, j++; // 匹配成功，继续比较
		else j = next[j]; // 模式串移动
	}
	if(j > T.length) return i-T.length; // 匹配成功
	else return 0; // 匹配失败
}
```

### KMP 的效率

* 一般情况下普通匹配的时间近似为$O(m+n)$，因此至今仍被使用
* 主串与子串有很多**部分匹配**时，KMP 的优势才能体现

### KMP 的再改进

- 当`p[j] == p[next[j]]`时，会导致连续失配
- 解决方法：递归，将`next[j]`修正为`next[next[j]]`，直到`p[j] != p[next[j]]`
- 此时的数组变为`nextval`

------
![[{2881920B-ADC6-449E-BE5E-F8C5B028460E}.png]]
B，不会变小

![[{18FE7377-32E1-47DE-B437-92AF91307282}.png]]
C，D

![[{CC250B2C-2872-418B-8B42-96B6F8AE3932}.png]]
D，j回溯

![[{0A367E6A-8EF0-412D-B20D-755DFDBC87A1}.png]]
B，i不变

![[{CB198DB0-F693-4E57-AA20-CECFEABCBE92}.png]]
先算PM：`0120`；再算next：`0123`
A

![[{EFC80858-C250-417E-A082-B350E797937F}.png]]
PM:    `001231123451`
next: `011234223456`
C

![[{E6F5DD2D-CEAD-4108-82DF-3A4A471F736D}.png]]
C，-1 开头

![[{59C0F040-E358-43D2-A357-16974F295769}.png]]
p:       `ababaaababaa`
next:    `011234223456`
nextval: `010104210104`
C
*核心思路是递归*

![[{171A61F9-DF16-4A5E-A0F3-178C573F5367}.png]]
i，j从0开始
PM：`001120`
next：`011223`
失配后：i不变，j回溯，j=(3-1)=2
C

![[{7AD610A7-9093-431F-A182-DD32162E440E}.png]]
PM：`001120`
next：`011223`
匹配6次，发现失配，回溯
匹配4次，成功
B