- BFS（广度优先搜索）类似树的层序遍历，基本思想是按层访问邻接结点
- **BFS 的基本思想**：
	1. 从起点开始
	2. 依次访问各个邻接结点，并入队
	3. 依次访问队内结点，将各个邻接结点入队
	4. 重复第三步，直到目标结点入队或全部遍历

```
// 邻接表实现 BFS
void BFS(ALGraph G, int i) {
	visit(i);
	visited(i) = true;
	EnQueue(Q, i);
	while(!isEmpty(Q)) {
		DeQueue(Q, v);
		for(p=G.vertics[v].firstarc; p; p=p->nextarc) { // v的所有邻接点
			w = p->adjvex;
			if(!visited[w]) {
				visited[w] = true;
				visit(w);
				EnQueue(Q, w);
			}
		}
	}
}
```

```
// 邻接矩阵实现 BFS
void BFS(MGraph G, int i) {
	visit(i);
	visited[i] = true;
	EnQueue(Q, i);
	while(!isEmpty(Q)) {
		DeQueue(Q, v);
		for(w=0; w<G.vexnum; w++) {
			if(G.edge[v][w] && !visited[w]) {
				visit(w);
				visited[w] = true;
				EnQueue(Q, w);
			}
		}
	}
}
```

- BFS 最坏的情况下需要遍历每个点，空间复杂度为 $O(|V|)$
- 邻接表存储时，每个顶点每条边都要访问，时间复杂度为 $O(|V|+|E|)$
- 邻接矩阵存储时，每个点都需要遍历，时间复杂度为 $O(|V|^2)$
