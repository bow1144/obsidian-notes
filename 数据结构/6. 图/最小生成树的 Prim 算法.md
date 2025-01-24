- Prim 算法的核心是**按顶点展开**
- Prim 算法适用于带权无向图
```
void Prim (G, T) {
	T = null;  // 初始设置树为空
	U = {w};   // 添加任意点
	while(V - U) {  // 树中不包含全部顶点
		(u, v) = minEdge(G - T);
		T += (u, v);
		U += v;
	}
}
```
Prim 算法步骤如下：
* 初始化：边集为空，随意加一个点作为点集
* 循环：从图中选择 $\{(u,v)|u \in U, v \in V-U\}$，获得最小权重的边$(u, v)$，加入树T，v加入点集
* 直到所有点都加入点集 V
* 算法总体程序：[858. Prim算法求最小生成树 - AcWing题库](https://www.acwing.com/problem/content/submission/code_detail/36489233/)
Prim 算法的时间复杂度为 $O(|V|^2)$，适合边稠密图

![[{40B9A644-62DC-4793-97B3-9B8F2B591594}.png]]