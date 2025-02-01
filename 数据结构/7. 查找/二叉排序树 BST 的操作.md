**BST 的插入**：
- 树为空，插入成功
- 根节点和插入结点成功，插入失败
- 小于/大于根节点，插入左/右子树
```
bool BST_Insert(BiTree &T, KeyType k) {
	if(!T) BiTree* T = new BiTree(k); return true;
	else if(k == T->data) return false;
	else if(k < T->data) return BST_Insert(T->left, k);
	else return BST_Insert(T->right, k);
}
```

**BST 的构造**：以此插入元素
```
void Creat_BST(BiTree& T, KeyType str[], int n) {
	T = null; 
	for(KeyType key : str) BST_Insert(T, key);
}
```

**BST 的删除**：
- 没有左右子树：直接删除
- 只有一边子树：整体提升
- 左右子树都有：中序后继替代，删除中序后继
```
void Delete_BNode(BiTree &parent, BiTree &node) {
	if(!node->left && !node->right) free(node);
	else if(!node->left) parent->right = node->right;
	else if(!node->right) parent->left = node->left;
	else {
		BiTree *ne = node->right;
		while(ne->left) ne = ne->left;
		node->val = ne->val;
		Delete_BNode(ne'parent, ne); 
	}
} 
```

-------
![[{E2429D43-79F4-41BF-9193-AB3D0550D45E}.png]]如果是叶子结点，那么插入路径固定，II正确
如果不是叶节点，T3就是叶节点了，III正确
C

![[{3E503E82-1F60-42E6-8DAD-AFB342AFAE65}.png]]
B