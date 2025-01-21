**DFS 的基本思想**：
- 从一个结点开始访问任意一个未访问的结点
- 不能继续访问时，退回最近一个结点
```
// 邻接表的 DFS
void DFS(ALGraph G, int i) {
	visit(i);
	visited[i];
	for(p=G.vertex[i].firstarc; p; p->nextarc) {
		j = p->adjvex;
		if(!visited[j]) DFS(G, j);
	}
}

// 邻接矩阵的 DFS
void DFS(MGraph G, int i) {
	visit(i);
	visited[i] = true;
	for(int j=0; j<G.vexnum; j++) {
		if(G.edge[i][j] && !visited[j]) DFS(G, j);
	}
}
```

- 和 BFS 一样，DFS的空间复杂度是 $O(|V|)$
- 邻接表存储时，DFS 的时间复杂度时 $O(|V| + |E|)$
- 邻接矩阵存储时，DFS的时间复杂度是 $O(|V|^2)$，都和 BFS 一样
- **DFS生成树和生成森林**：
	- 和 BFS 一样，邻接矩阵唯一生成，邻接表不唯一生成
	- 不管是 DFS 还是 BFS，结点都是唯一的
![[{877ABB8A-3FB6-49A0-B7FA-5966055F8E03}.png]]

--------
![[{18939778-BE90-4B37-9DA1-E3FFB4852427}.png]]
![[{FBA56AC8-CC67-4D31-ABA1-351F1A3D63A1}.png]]
I 错误，不是唯一的
II 你在说什么啊？
III，IV 正确
~~C~~
*注意IV的非强连通图，可以是`1->2->3`，一次就可以访问所有顶点*

![[{38D7B5CB-7E3A-43C7-AF63-D647F69E6A78}.png]]
二者的空间复杂度都是 $O(n)$
CACA

![[{903F85C2-B480-4B71-B370-39C788BBE0A3}.png]]
AA

![[{75BB6A01-BC69-47AC-AAB4-51C1FAFB7CFA}.png]]
abecfd
~~C~~
*一个个找，因为 DFS 序列不是唯一的
注意题目是无向图，顺序可以反
题目有问题？

![[{1E414225-AEB2-4E00-8E7F-F56625F53CC0}.png]]
1，4，
D

![[{24EFE1CD-5A38-4C35-B2D6-00968A16FE85}.png]]
A，BFS找的是单源最短路，所以矮胖

![[{FC075CE3-D95F-47F8-BFE2-BFD928D879FA}.png]]
V1：132
V2：213，231
V3：312，321
D

![[{9CCE3F32-22DF-4CAE-A11D-D597EFB3E49C}.png]]
D