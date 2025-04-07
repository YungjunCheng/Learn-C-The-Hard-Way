+ 按照上面的指导，使用Valgrind和编译器修复这个程序。
见excise/ex4/ex4-fixed.c

+ 在互联网上查询Valgrind相关的资料。
https://valgrind.org/
https://valgrind.org/docs/manual/manual.html
https://www.cprogramming.com/debugging/valgrind.html

+ 下载另一个程序并手动构建它。尝试一些你已经使用，但从来没有手动构建的程序。
# 下载源码
wget https://curl.se/download/curl-8.7.1.tar.gz

# 解压并进入目录
tar -xzvf curl-8.7.1.tar.gz
cd curl-8.7.1

# 配置（启用 HTTPS 支持）
./configure --with-openssl

# 编译安装
make
sudo make install

# 验证安装
curl --version

+ 看看Valgrind的源码是如何在目录下组织的，并且阅读它的Makefile文件。不要担心，这对我来说没有任何意义。
.
├── coregrind/                # 核心引擎：程序插桩、内存管理、线程调度
│   ├── m_main.c             # 主循环逻辑
│   └── m_scheduler.c        # 线程调度器
├── VEX/                     # 中间代码生成器：将机器码转为VEX IR
│   ├── priv/                # 平台指令解码实现
│   └── guest_generic_bb_to_IR.c # 中间代码生成逻辑
├── memcheck/                # 内存检测工具：非法访问、泄漏检测
│   ├── mc_main.c            # 内存检测主逻辑
│   └── tests/               # 内存检测测试用例
├── cachegrind/              # 缓存分析工具：统计缓存命中率
├── callgrind/               # 调用图分析工具：函数耗时统计
├── helgrind/                # 线程竞争检测工具：数据竞争分析
├── drd/                     # 数据竞争检测工具（替代helgrind部分功能）
├── *.supp                   # 平台误报抑制规则（如darwin16.supp、solaris12.supp）
├── README.*                 # 平台专用文档（如README.mips、README.android）
├── configure.ac             # 构建配置脚本：检测系统环境
├── Makefile.am              # Automake构建规则模板
├── valgrind.spec.in         # RPM包构建规范
├── tests/                   # 自动化测试套件
│   ├── linux/               # Linux平台专项测试
│   └── memcheck/tests/      # 内存检测工具测试
├── docs/                    # 用户手册和开发者文档
│   ├/memcheck/mc-manual.xml # Memcheck工具手册
│   └/coregrind/docs/        # 核心API文档
├── README_DEVELOPERS        # 开发者指南：贡献规范、调试技巧
├── AUTHORS                  # 贡献者列表
├── NEWS                     # 版本更新日志
├── auxprogs/                # 辅助工具（如日志分析脚本）
├── vg-in-place              # 快速启动脚本：无需安装直接运行开发版
└── shared/                  # 平台无关的共享代码（如字符串处理函数）
