### 赋值
- 与传统语言不同，R语言的**创建新变量**采用`<-` 或者 `->`，例如`x<-rnorm(5)`和`rnorm(5)->x`，其中`rnorm`是五个正态分布的数字

### 输入输出
- `source("filename")`可以在当前会话中执行一个脚本
- 文本输出`sink("filename")`，将输出结果重定向到一个文件中
	- `sink("filename", append = TRUE/FALSE, split = TRUE/FALSE)`有两个参数，`append`表示是否追加文件，`FALSE`表示替换同名文件，`split`表示将结果输出到控制台，`FALSE`表示仅保存到文件中
	- 但是图片输出到文件后不会输出到屏幕上
- 图形输出，例如`png("filename.png")`
- 从键盘中输入数据
	- `mydata <- data.frame(age=numeric(0), gender=character(0)`
	 `mydata <- edit(mydata)`
	- `data <- scan()`
- 嵌入数据集`mydata <- read.table(header=TRUE, text=myDatatxt)` 

### 包
- 想用包就用`library()`载入这个包，不知道怎么用就`help(package = 'package_name`)输出包的简短描述

### 结果复用
```
data <- c(10, 20, 30, 40, 50)
mean_val = mean(data)
sd_val = sd(data)    # 标准差
norm_data <- (data - mean_val) / sd_val  # 标准化数据
```


