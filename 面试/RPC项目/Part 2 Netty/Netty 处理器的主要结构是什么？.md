
- **Netty** 的处理器主要依赖于 **ChannelPipeline** 和 **ChannelHandler** 两个关键结构来处理 I/O 操作
- **ChannelPipeline** 是一个处理器链，由一系列的 **ChannelHandler** 组成，数据从头流入，。每个处理器负责特定的任务，完成后数据继续流向下一个处理器。这种设计使得处理任务能够被灵活地分解和管理。
- **ChannelHandler** 是 Netty 的核心组件，用于处理 Channel 上发生的事件或 I/O 操作，包括 InboundHandler 和 OutboundHandler
- **Channel** 是 Netty 中的核心通信接口，它表示网络连接的抽象。Netty 通过 Channel 来实现客户端与服务器之间的数据读写