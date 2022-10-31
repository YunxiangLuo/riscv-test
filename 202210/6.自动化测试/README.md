### 改进mugen中DNF_INSTALL错误信息打印  
- 加入在log中打印缺失软件包信息的功能 [commit](https://github.com/brsf11/mugen-riscv/commit/9520e6381a552e6753840a589d98f1740f9afce7)  
### 测试mugen在anolis上的可用性并在Anolis上运行一次完整的mugen测试并整理结果  
- mugen-riscv中加入anolis上运行mugen的依赖安装支持 [commit](https://github.com/brsf11/mugen-riscv/commit/b969180df696f810d7e38f11ddac3235a1715795)  
- 测试了os-basic和systemd两个测试套 [结果](https://github.com/brsf11/Tarsier-Internship/tree/main/Mugen-Porting/anolis8.6X86Logs)已整理上传，并在分析中  
### 在Anolis上运行anolis-pkg-tests测试框架  
- 成功运行avocado框架，完整运行了一次system_base/util_linux测试套，共计233个测试例，[结果](https://github.com/brsf11/Tarsier-Internship/tree/main/Anolis-pkg-tests-Porting/anolis8.6X86test)已整理上传，并在分析中 