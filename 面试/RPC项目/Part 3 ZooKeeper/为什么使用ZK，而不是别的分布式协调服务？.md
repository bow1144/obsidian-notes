
- **成熟稳定**：很多大数据应用，例如 Kafka，Hadoop 使用的都是ZK，这表明 ZK 已经经历了大量生产环境的验证，具备了很高的稳定性和成熟度
- **高可靠一致性**：ZK 满足 CAP 理论中的 CP系统，优先保证一致性和分区容错性，在某些情况下会牺牲可用性
	- **高可靠性**：ZK 使用主从架构，部分节点宕机也能提供服务，多节点冗余保证了数据一致性，即使主节点崩溃也能快速选举出新的主节点保证使用
	- **数据一致性保障**：顺序一致性、原子性、所有节点数据同步、最终一致性
	- **Zab协议保证一致性**：原子广播、主从同步、崩溃恢复、崩溃安全