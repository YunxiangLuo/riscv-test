# 2022年11月工作

# 1. 测试规划和系统测试

## 1.1 测试用例库规范

- [测试用例库规范](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E8%A7%84%E5%88%92%E5%92%8C%E7%B3%BB%E7%BB%9F%E6%B5%8B%E8%AF%95/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E8%A7%84%E8%8C%83.md)

- 组织整理原有测试用例库并设计新的测试用例标准 RISCV-testcase

    - 审查已经整理的原有的测试用例
    
    - 设计新的标准排版标准
    
    - 设计机器人和模板以标准化过程
    
    - 设计 GitHub CI 帮助自动审查
    
      [产出1](https://github.com/ArielHeleneto/RISCV-testcase/tree/master/.github)
      [产出2](https://github.com/ArielHeleneto/RISCV-testcase/issues)

## 1.2 openEuler RISC-V在众测平台的实践

- [openEuler RISC-V在众测平台的实践](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E8%A7%84%E5%88%92%E5%92%8C%E7%B3%BB%E7%BB%9F%E6%B5%8B%E8%AF%95/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E8%A7%84%E8%8C%83.md)

## 1.3 RISC-V龙蜥镜像mugen测试  

- 官方发布的软件源中大概只有300+软件包，手动解决了mugen依赖和配置（使用了oE RISC-V 的tcl和expect）  
- 完整地测试了os-basic测试套138个测试例  
- 通过36个测试例，失败102个，其中41个为qemu环境造成  
- 剩余61个未通过测试例大致分为3类  
    - 软件缺失（包括因为paramiko依赖没有解决无法安装和没有预装）48个  
    - 可能为系统bug，需要进一步分析 12个  
    - 其他，和openEuler行为不一致 1个  
- [测试结果](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E8%A7%84%E5%88%92%E5%92%8C%E7%B3%BB%E7%BB%9F%E6%B5%8B%E8%AF%95/RISCVAnolis8.6)
## 1.4 RISC-V龙蜥测试软件源mugen测试  

- 本次测试使用镜像[来源](https://mirrors.openanolis.cn/alt/risc-v/images/)，软件源：[an8](http://build.openanolis.cn/kojifiles/repos/anolis-riscv64-repo-external/an8/riscv64/) [gcc](http://build.openanolis.cn/kojifiles/repos/anolis23-riscv64-repo-external/gcc/) [an8extra](http://build.openanolis.cn/kojifiles/repos/anolis-riscv64-repo-external/an8extra/riscv64/) [anolis-riscv](http://build.openanolis.cn/kojifiles/rsync/alt/risc-v/riscv64/)  
- 为保证测试结果有效性，本次测试了筛选过后的mugen os-basic测试套中的56个测试用例  
- 测试结果：46个用例通过，10个用例失败  
- 10个测试失败用例的日志文件在此目录的logs/os-basic中  
- 通过的46个用例列表为passed_tests  
[测试结果](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E8%A7%84%E5%88%92%E5%92%8C%E7%B3%BB%E7%BB%9F%E6%B5%8B%E8%AF%95/RISCVAnolis8.6-22-11-24)

## 1.5 eulaceura操作系统自动化测试

- [eulaceura自动化测试结果（206个测试套）](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E8%A7%84%E5%88%92%E5%92%8C%E7%B3%BB%E7%BB%9F%E6%B5%8B%E8%AF%95/eulaceura/logs)
- [eulaceura测试报告](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E8%A7%84%E5%88%92%E5%92%8C%E7%B3%BB%E7%BB%9F%E6%B5%8B%E8%AF%95/eulaceura/README.md)

## 1.6 RISCV openEuler 22.03 V1自动化回归测试  

- 经过一次os-basic-riscv完整测试和对之前出错的新产生问题的用例单独测试，排除了所有用例的问题，[部分测试结果](https://github.com/renjiedai/PLCT_TEST/tree/master/WEEK5_20221114-20221120/issue%E7%9A%84%E5%9B%9E%E5%BD%92%E6%B5%8B%E8%AF%95%E7%BB%93%E6%9E%9C)

- [issue评论](https://gitee.com/openeuler/RISC-V/issues/I5UQ31?from=project-issue#note_14440971_link)  

## 1.7 包分类

- [openEuler 22.03 RISC-V（应用）包分类](https://github.com/FIFCC/testing/tree/main/package)

# 2. 自动化测试工具开发

## 2.1 qemu_test.py优化  

- 增加了根据软件源生成测试列表的功能 [commit](https://github.com/brsf11/mugen-riscv/commit/8d9ad2dad58fcc77ec6ad7842c05b1b8bc1049f6)  
- 增加了输入测试配置文件的功能 [commit](https://github.com/brsf11/mugen-riscv/commit/25b974ee8a39d5c83a647a30397f4cda93dc6d7f)  
- 功能的完善和bug修复 [commit1](https://github.com/brsf11/mugen-riscv/commit/35ad0797cb054f81c9e5aab687bc59c0402f0309) [commit2](https://github.com/brsf11/mugen-riscv/commit/42d7c931bfc065b1ec13bfdb0b92494134f41cd5)  
- 针对上周更新的功能添加了使用教程 [commit](https://github.com/brsf11/mugen-riscv/commit/2c1bec772e95fc81c81a0ca9f1d45f00c4876437) 
- 整合了自动检测样例需求并为虚拟机增加硬盘挂载点的功能
- 添加了自动监测scp能否传输并进行修改的功能
- 完善了脚本-m参数的启动
- 测试例的添加 [commit](https://github.com/brsf11/mugen-riscv/pull/9/files)

## 2.2 anolis x86 mugen和anolis-pkg-test原型搭建和试用  

- anolis-pkg-tests官方更名为anolis-sys-tests  
- anolis-sys-tests因为avocado配置存在很多问题，本周未进一步研究  
- mugen测试  
    - systemd测试套 129/160 os-basic 57/138 (openEuler riscv systemd 120/160 os-basic 60/138)  
    - 本次测试所用python版本为3.6，paramiko库安装有问题  
    - os-basic未通过测试90%是由于paramiko有问题，涉及到两种情况，其一需要多节点和ssh，其二用到DNF_INSTALL，使用python3.9解决paramiko问题后预计属于第二种情况的测试用例还能通过一部分  
    - 剩下小部分用例未通过原因是anolis和openEuler行为不同    

## 2.3 对deepin的autopkgtest进行调研

- 调研生成的[报告仓库](https://github.com/KotorinMinami/debian-autopkgtest)

## 2.4 openQA框架调研

- [openQA框架调研(进行中)](https://github.com/renjiedai/PLCT_TEST/blob/master/WEEK5_20221114-20221120/openqa%E6%A1%86%E6%9E%B6%E8%B0%83%E7%A0%94/openqa%E6%A1%86%E6%9E%B6%E8%B0%83%E7%A0%94.md)

## 2.5 其它

- 新入职实习生对Mugen-RISCV进行学习，完成相应的配置以及运行了简单的初始程序，并分析相关日志（包括仓库中的使用以及开发的 python 脚本），[产出](https://github.com/vegetable-yx/PLCT_test0/tree/main/mugen)

## 2.4 解决openEuler 22.03 QEMU网桥问题，QEMU间已可以ping通，网络测试和HPC测试环境基础建设

- 文档后续添加，拟进行技术分享

# 3. 测试用例库建设

## 3.1 设计测试用例库模板

- [测试用例库模板](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/Template/testcase/name.md)

## 3.2 测试用例库

[总入口](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE)

- [完成Xfce部分测试用例](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/Xfce/Desktop%20Manager/testcase)
- [完成Firefox测试用例](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/Firefox/testcase)
- [完成Libreoffice部分测试用例](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/Libreoffice/testcase)
- [完成Thunderbird测试用例](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/Thunderbird/testcase)
- [完成VLC测试用例](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/VLC/testcase)
- [完成GIMP测试用例](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8B%E5%BA%93%E5%BB%BA%E8%AE%BE/GIMP/testcase)

## 3.3 测试用例库软件调研（调研比较后，决定使用git形式）

- [禅道的调用报告](https://github.com/Michaelnlearn/PlctWorking/tree/main/CANDAO)
- [禅道部署测试](https://github.com/Michaelnlearn/PlctWorking/tree/main/CANDAO/Server)

## 3.4 openEuler QA radiatest

- 交流和申请账号，用于获取上游测试用例，复用到RISCV oE测试中

# 4. 众测

1. [Chromium众测文档](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E4%BC%97%E6%B5%8B/%E4%BC%97%E6%B5%8B%E9%A2%98%E7%9B%AE/Chromium)
2. [Libreoffice众测报告验证和审核](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E4%BC%97%E6%B5%8B/%E4%BC%97%E6%B5%8B%E5%AE%A1%E6%A0%B8/11%E6%9C%88%E5%AE%A1%E6%A0%B8%E8%AE%B0%E5%BD%95)
3. [众测审核文档汇总](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E4%BC%97%E6%B5%8B/%E4%BC%97%E6%B5%8B%E5%AE%A1%E6%A0%B8)
4. [众测报告汇总](https://gitee.com/yunxiangluo/testsuites)

# 5. 内部测试
1. [Mysql 测试](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E5%86%85%E9%83%A8%E6%B5%8B%E8%AF%95/%E6%B5%8B%E8%AF%95%E7%94%A8%E4%BE%8BMySQL.xlsx)
2. [测试龙蜥QEMU在Ubuntu上的安装和网络，编写安装和设置文档](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E5%86%85%E9%83%A8%E6%B5%8B%E8%AF%95/%E9%BE%99%E8%9C%A5QEMU%E5%9C%A8Ubuntu%E4%B8%8B%E7%9A%84%E5%AE%89%E8%A3%85%E4%B8%8E%E8%AE%BE%E7%BD%AE)

# 6.缺陷跟踪

## 6.1 根据RISCV openEuler 22.03 V1自动化回归测试结果，更新缺陷issue信息
- atune测试套共一个样例未通过[issue](https://gitee.com/openeuler/RISC-V/issues/I5UQ5U#note_14405220)
- djvulibre测试套中测试例oe_test_djvulibre_01仍未通过，而测试例oe_test_djvulibre_02运行通过，后经确认为脚本问题，实则为全部通过[issue](https://gitee.com/openeuler/RISC-V/issues/I5UQ6I#note_14405224)
- pcp测试套全部通过[issue](https://gitee.com/openeuler/RISC-V/issues/I5UQ4R#note_14405214)
- 测试套rabbitmq-server-riscv全部通过[issue](https://gitee.com/openeuler/RISC-V/issues/I5UQ5J#note_14405235)
- [java-1.8.0-openjdk](https://gitee.com/openeuler/RISC-V/issues/I5UQ78)
- [easymock](https://gitee.com/openeuler/RISC-V/issues/I5UQ6P?from=project-issue)
- [freeradius](https://gitee.com/openeuler/RISC-V/issues/I5UQ6Y#note_14486228)
- [clamav](https://gitee.com/openeuler/RISC-V/issues/I5UQ69#note_14485643)

## 6.2 60个缺陷issue手动回归测试：

- [测试结果](https://github.com/YunxiangLuo/riscv-test/tree/main/202211/%E7%BC%BA%E9%99%B7%E8%B7%9F%E8%B8%AA/issues)

## 6.3 关闭验证通过的issue
- [审核自动化和手动回归测试结果，关闭验证通过的issue](https://gitee.com/openeuler/RISC-V/issues)

## 6.4 历史缺陷汇总

- [完成Thunderbird 缺陷](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E7%BC%BA%E9%99%B7%E8%B7%9F%E8%B8%AA/%E7%BC%BA%E9%99%B7%E5%BA%93/Thunderbird/%E7%BC%BA%E9%99%B7%E6%8A%A5%E5%91%8A.md)
- [完成VLC 缺陷](https://github.com/YunxiangLuo/riscv-test/blob/main/202211/%E7%BC%BA%E9%99%B7%E8%B7%9F%E8%B8%AA/%E7%BC%BA%E9%99%B7%E5%BA%93/VLC/%E7%BC%BA%E9%99%B7%E6%8A%A5%E5%91%8A.md)

