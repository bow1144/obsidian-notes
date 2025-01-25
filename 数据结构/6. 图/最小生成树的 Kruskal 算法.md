Kruskal 算法的核心是**从权值展开**
```
void Kruskal(V, T) {
	T = V;    // 初始化树，仅包含顶点
	numS = n; // 连通分量数
	while(numS > 1) { // 连通分量数大于一
		从 E 中选择权值最小的边 (v, u)
		if u和v不在同一个连通分量 {
			T += (v, u);
			numS--;
		}
	}
}
```

- KrusKal 算法的步骤：
	- 初始时，每个顶点构成一棵树，此时 T 是一个有n棵树的森林
	- 循环：按G的边权值递增依次从 $E-E_T$ 选择一条边，若不构成回路则加入，否则舍弃
- 堆优化的 Kruskal 算法时间复杂度为 $O(|E| \log_2 |E|)$，适合边稀疏而顶点多的图
- Kruskal 算法整体程序：[859. Kruskal算法求最小生成树 - AcWing题库](https://www.acwing.com/problem/content/submission/code_detail/36492517/)

-------------
![[{52AAEE8C-D059-41BF-BF41-DD11A63EF945}.png]]
不可能选成环的
C