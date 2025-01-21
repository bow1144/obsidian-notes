**BFS 求非带权图的单源最短路径问题**：
- 将单源作为 BFS 的起点，初始化路径长度为无穷
- 每一次遍历到一个新节点，将路劲标记为 +1

```
void BFS_MIN_Distance(Graph G, int u) {
	// 初始化路劲长度
	for(int i=0; i<G.vexnum; i++) d[i] = INF;
	visited[u] = true;
	d[u] = 0;
	EnQueue(Q, u);

	while(!isEmpty(Q)) {
		DeQueue(Q, u);
		for(w = FirstNeighbor(G, u); w>=0; w = NextNeighbor(G, u, w))
			if(!visited[w]) {
				visited[w] = true;
				d[w] = d[u] + 1;  // 关键步
				EnQueue(Q, w);
			}
	}
}
```

**广度优先生成树**：
- 由图生成的遍历树
- 邻接矩阵生成唯一遍历树，邻接表的遍历树不唯一

-------------
![[{AF06D5F5-741D-476D-8076-8A482397E9CE}.png]]
I对，BFS 只能解决不带权的最短路问题
A

![[{2AC59716-A7E4-43E5-930A-4E2466EDD268}.png]]
A

![[{20C78594-8BCD-453C-94D6-EC376039F536}.png]]
BD

![[{80545352-16B9-417C-B54A-98051521DF86}.png]]
BFS：124536
DFS：125436
AB

![[{BF5DF455-1626-4795-9431-5E3BE292613D}.png]]
邻接表的时间复杂度：C

![[{244D1136-EECE-46FC-AA51-4A3E469433A4}.png]]
D