# 10月工作

### 测试规划

1. [openEuler RISC-V的测试与质量保证](https://github.com/YunxiangLuo/riscv-test/blob/main/202210/1.%E6%B5%8B%E8%AF%95%E8%A7%84%E5%88%92/openEuler%20RISC-V%E7%9A%84%E6%B5%8B%E8%AF%95%E4%B8%8E%E8%B4%A8%E9%87%8F%E4%BF%9D%E8%AF%81.pptx)
2. [RISC-V oE 自动化测试](https://github.com/YunxiangLuo/riscv-test/blob/main/202210/1.%E6%B5%8B%E8%AF%95%E8%A7%84%E5%88%92/RISC-V%20oE%20%E8%87%AA%E5%8A%A8%E5%8C%96%E6%B5%8B%E8%AF%95.pptx)

### 操作系统发布测试

1. openEuler RISC-V 22.03V1测试

> - [测试报告入口](https://github.com/YunxiangLuo/oe2203_20220930)
> - [QEMU安装文档](https://gitee.com/openeuler/RISC-V/blob/master/release/openEuler-22.03/qemu/README.md)
> - [Unmatched安装文档](https://gitee.com/openeuler/RISC-V/blob/master/release/openEuler-22.03/unmatched/README.md)
> - [Visionfive安装文档]( https://gitee.com/openeuler/RISC-V/blob/master/release/openEuler-22.03/visionfive/README.md)
> - [D1安装文档](https://gitee.com/openeuler/RISC-V/blob/master/release/openEuler-22.03/d1/README.md)

2. [Eulaceura RISC-V测试](https://github.com/YunxiangLuo/riscv-test/blob/main/202210/2%20%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F%E5%8F%91%E5%B8%83%E6%B5%8B%E8%AF%95/Eulaceura/README.md)

### 社区众测

1. [Libreoffice众测题目发布](https://github.com/YunxiangLuo/riscv-test/tree/main/202210/3.%E7%A4%BE%E5%8C%BA%E4%BC%97%E6%B5%8B/Libreoffice)
2. [VLC](https://github.com/YunxiangLuo/riscv-test/tree/main/202210/3.%E7%A4%BE%E5%8C%BA%E4%BC%97%E6%B5%8B/VLC%E6%B5%8B%E8%AF%95%E6%8A%A5%E5%91%8A%E5%AE%A1%E6%A0%B8)和[GIMP](https://github.com/YunxiangLuo/riscv-test/tree/main/202210/3.%E7%A4%BE%E5%8C%BA%E4%BC%97%E6%B5%8B/GIMP%E6%B5%8B%E8%AF%95%E6%8A%A5%E5%91%8A%E5%AE%A1%E6%A0%B8)众测报告审核
3. [eclipse](https://github.com/YunxiangLuo/riscv-test/tree/main/202210/3.%E7%A4%BE%E5%8C%BA%E4%BC%97%E6%B5%8B/Eclipse%EF%BC%88%E8%BF%9B%E8%A1%8C%E4%B8%AD%EF%BC%89)和[chromium](https://github.com/YunxiangLuo/riscv-test/tree/main/202210/3.%E7%A4%BE%E5%8C%BA%E4%BC%97%E6%B5%8B/Chromium%EF%BC%88%E8%BF%9B%E8%A1%8C%E4%B8%AD%EF%BC%89)测试和众测文档的编写

### 缺陷提交和回归测试

1. [openEuler RISC-V回归测试](https://github.com/YunxiangLuo/riscv-test/blob/main/202210/4.%E7%BC%BA%E9%99%B7%E6%8F%90%E4%BA%A4%E5%92%8C%E5%9B%9E%E5%BD%92%E6%B5%8B%E8%AF%95/README.md)

### 测试用例库建设

1. 历史测试用例的汇总
2. 测试用例库工具原型搭建和调研
3. [包（应用）分类3000+](https://github.com/YunxiangLuo/riscv-test/blob/main/202210/5.%20%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/packagelist/packages_202210302157.csv)
4. Deepin测试环境文档编写

> - [Deepin RISC-V 安装手册](https://github.com/xforcevesa/Work-PLCT/blob/master/Deepin/Installation_Guide.md)

> - [Deepin-installation Guide](https://github.com/GICEGreenIce/deepin-installation)

### 自动化测试

1. Mugen工具二次开发

> - 改进mugen中DNF_INSTALL错误信息打印，加入在log中打印缺失软件包信息的功能 [commit](https://github.com/brsf11/mugen-riscv/commit/9520e6381a552e6753840a589d98f1740f9afce7)  

> - 验证mugen上游更新的可靠性 [更新前log](https://github.com/KotorinMinami/plct-working/blob/main/WorkReport/logs/2022-10-12-17:10:23.log) [更新后log](https://github.com/KotorinMinami/plct-working/blob/main/WorkReport/logs/2022-10-12-17:10:23.log)

> - 添加mugen-riscv中os-basic与rsyslog的测试例。[commit_os](https://github.com/brsf11/mugen-riscv/pull/7/files) , [commit_rsys](https://github.com/brsf11/mugen-riscv/pull/8/files).

2. Anolis操作系统上的自动化测试

>  2.1 测试mugen在anolis上的可用性并在Anolis上运行一次完整的mugen测试并整理结果  

>  - mugen-riscv中加入anolis上运行mugen的依赖安装支持 [commit](https://github.com/brsf11/mugen-riscv/commit/b969180df696f810d7e38f11ddac3235a1715795)  
>  - 测试了os-basic和systemd两个测试套 [结果](https://github.com/brsf11/Tarsier-Internship/tree/main/Mugen-Porting/anolis8.6X86Logs)已整理上传，并在分析中  

>  2.2 在Anolis上运行anolis-pkg-tests测试框架  

>  - 成功运行avocado框架，完整运行了一次system_base/util_linux测试套，共计233个测试例，[结果](https://github.com/brsf11/Tarsier-Internship/tree/main/Anolis-pkg-tests-Porting/anolis8.6X86test)已整理上传，并在分析中 
>

3. Debian衍生谱系自动化测试框架调研和原型搭建

> - 对Debian系的自动化测试框架进行调研,使用autopkgtest进行debian的systemd软件包的测试。 [report](https://github.com/KotorinMinami/plct-working/blob/main/WorkReport/reports/report.md) , [log & summary](https://github.com/KotorinMinami/plct-working/blob/main/WorkReport/debian_logs%26sum)