# openEuler 22.03 RISC-V 20229026和22.03-V1(20221014)版本验收测试报告

修订记录

| 日期       | 修订版本 | 修改章节           | 修改描述   |
| ---------- | -------- | ------------------ | ---------- |
| 2022/9/30 | 1.0.0    | 初始   | 罗云翔 程龙灿 李昊翔 黄烁 |
| 2022/10/14 | 1.0.1    | 22.03-V1   | 罗云翔 程龙灿 |

**摘要**

文本主要描述openEuler 22.03 RISC-V版本的整体测试过程，详细叙述测试覆盖情况，并通过问题分析对版本整体质量进行评估和总结。


# 1   概述

openEuler是一款开源操作系统。当前openEuler内核源于Linux，支持RISC-V处理器，能够充分释放计算芯片的潜能，是由全球开源贡献者构建的高效、稳定、安全的开源操作系统。

本文主要描述openEuler 22.03-V1 RISC-V 版本的总体测试活动，按照社区开发模式进行运作，结合社区Tarsier团队制定的版本计划规划相应的测试计划及活动。测试报告覆盖新需求、继承需求的测试执行情况和评估，并结合各类专项测试活动和版本问题单总体情况进行整体的说明和质量评估。

# 2   测试版本说明

本文档测试对象是openEuler 22.03 RISC-V 2022年9月26日和openEuler 22.03-V1 RISC-V（20221014）发布版本，发布范围相较22.03 LTS RISC-V版本主要变动：

1. 软件包选型升级
2. 新增软件：Xfce桌面，Chromium浏览器，Firefox浏览器，Libreoffice办公套件，Tunderbird电子邮件客户端，Eclipse，VLC视频播放工具，GIMP图片编辑工具
3. 新增全栈支持Unmatched开发板，全栈支持VisionFive开发板，部分支持D1开发板
4. 修复bug和cve

测试环境如下：

| 硬件/QEMU | 硬件配置信息 | 测试结果 |
| ----------------------------------- | ------------------------------------------------------------ | ------------------------- |
| HiFive Unmatched | CPU: SiFive Freedom U740 SoC <br />内存：16GB DDR4<br />存储设备：SanDisk Ultra 32GB micro SD | 通过 |
| VisionFive | CPU: JH7100 <br />内存：8GB DDR4<br />存储设备：SanDisk Ultra 32GB micro SD | 通过 |
| D1 | CPU: C906 <br />内存：2GB DDR4<br />存储设备：SanDisk Ultra 32GB micro SD | 基本通过，存在部分缺陷 |
| Qemu 6.2/7.0 | CPU: 8<br />内存：8GB <br />存储设备：文件 | 通过 |

20220926版本测试活动策略如下：

| **需求**                        | **测试分层策略**                                             |
| ------------------------------- | ------------------------------------------------------------ |
| 支持HiFive Unmatched | 对HiFive Unmatched进行安装、基本功能、兼容性及稳定性的测试 |
| 支持VisionFive | 对VisionFive进行安装、基本功能、兼容性及稳定性的测试通过 |
| 支持D1 |启动失败 [启动log](./d1/d1_log.txt) |
| 支持常用软件和系统设置功能软件 | 验证常用软件和系统设置功能软件在openEuler RISC-V版本上的可安装和基本功能 |
| 支持Xfce桌面 | 验证Xfce桌面系统在openEuler RISC-V版本上的可安装和基本功能 |
| 支持Chromium软件 | 验证Chromium软件的安装和软件的基本功能 |
| 支持Firefox软件 | 验证Firefox软件的安装和软件的基本功能 |
| 支持Libreoffice软件 | 验证Libreoffice软件的安装和软件的基本功能 |
| 支持Tunderbird软件 | 验证Tunderbird软件的安装和软件的基本功能 |
| 支持Eclipse软件 | 验证Eclipse软件的安装和软件的基本功能 |
| 支持VLC软件 | 验证VLC软件的安装和软件的基本功能 |
| 支持GIMP软件 | 验证GIMP软件的安装和软件的基本功能 |

openEuler 22.03-V1(20221014)版本测试活动策略如下：

| **需求**                        | **测试分层策略**                                             |
| ------------------------------- | ------------------------------------------------------------ |
| 支持HiFive Unmatched | 对HiFive Unmatched进行安装、基本功能、兼容性及稳定性的测试 |
| 支持VisionFive | 对VisionFive进行安装、基本功能、兼容性及稳定性的测试通过 |
| 支持D1 |对D1进行安装、部分基本功能、兼容性及稳定性的测试通过， 缺陷：WiFi 和蓝牙功能不可用，LibreOffice 启动闪退，修改屏幕分辨率后 xfce 显示可能出现问题，HDMI 接口热插拔可能不可用 |
| 支持常用软件和系统设置功能软件 | 验证常用软件和系统设置功能软件在openEuler RISC-V版本上的可安装和基本功能 |
| 支持Xfce桌面 | 验证Xfce桌面系统在openEuler RISC-V版本上的可安装和基本功能 |
| 支持Chromium软件 | 验证Chromium软件的安装和软件的基本功能 |
| 支持Firefox软件 | 验证Firefox软件的安装和软件的基本功能 |
| 支持Libreoffice软件 | 验证Libreoffice软件的安装和软件的基本功能，D1启动闪退 |
| 支持Tunderbird软件 | 验证Tunderbird软件的安装和软件的基本功能 |
| 支持Eclipse软件 | 验证Eclipse软件的安装和软件的基本功能 |
| 支持VLC软件 | 验证VLC软件的安装和软件的基本功能 |
| 支持GIMP软件 | 验证GIMP软件的安装和软件的基本功能 |

本次版本测试快照构建规则：[ORSP004](https://gitee.com/openeuler/RISC-V/blob/master/proposal/ORSP004.md)

本次版本测试快照责任人：周嘉诚

# 3   Bug分级定义

- P1 / blocking 指阻塞性bug修复之前什么都不能干。例如用户数据丢失可能列为P1

- P2 / important 指用户几乎总会遇到并影响使用，例如常用用例中程序崩溃、关键功能无法使用等

- P3 / normal 指用户经常遇到并且影响使用体验的bug

- P4 / improvement 不紧急的bug

- P5 / wishlist

# 4 测试环境安装

- [x] [使用QEMU安装RISC-V openEuler](./qemu/README.md)

- [x] [使用Unmatched开发板安装RISC-V openEuler](./unmatched/README.md)

- [x] [使用Visionfive开发板安装RISC-V openEuler](./visionfive/README.md)

- [x] [使用D1开发板安装RISC-V openEuler](./d1/README.md)

openEuler 22.03 RISC-V 20220926 QEMU和Unmatched，Visionfive、D1版本通过或基本通过测试发布，

# 5 测试结论

openEuler 22.03 RISC-V 20220926 版本整体测试按照Tarsier团队的计划，共完成了一轮重点特性测试（20220922）+一轮自动化测试（常用软件和系统设置功能）+一轮回归测试+版本发布验收测试（20220926）；其中第一轮测试聚焦在新移植软件的安装和基础功能测试；一轮自动化测试验证交付版本的常用软件和系统设置功能；一轮回归测通过测试第一轮报告的缺陷，验证缺陷的修复和影响程度；版本发布验收测试是在版本正式发布至官网后开展的轻量化验证活动，旨在保证发布件和测试验证过程交付件的一致性。

openEuler 22.03 RISC-V 20220926 版本共发现问题 32个，P1 0 个，P2 1 个，P3 15 个，P4 13 个，P5 3 个，其他问题均已修复，回归测试结果正常。版本整体质量较好。

## 5.1 重点组件测试

对产品所有继承特性进行评价，用表格形式评价，包括特性列表（与特性清单保持一致），验证质量评估，**测试报告见组件名称的链接**。

| 序号 | 组件/特性名称 | 特性质量评估 | 备注 |
| ---- | ----------------------------------------- | :-------------------------: | ---------------------------------------------------------------------------------------------------------------------- |
| 1 | [支持HiFive Unmatched](./unmatched/测试报告.xlsx) | <font color=green>█</font> | 全栈支持Unmatched开发板 |
| 2 | 支持VisionFive | <font color=green>█</font> | 全栈支持VisionFive开发板 |
| 2 | 支持D1 | <font color=green>▲</font> | 部分支持D1开发板, 缺陷：WiFi 和蓝牙功能不可用，LibreOffice 启动闪退，修改屏幕分辨率后 xfce 显示可能出现问题，HDMI 接口热插拔可能不可用 |
| 3 | [支持xfce桌面](./xfce/测试报告.xlsx) | <font color=green>█</font> | 安装和卸载正常，整体核心功能(重要组件和系统插件)稳定正常，整体质量良好，发现缺陷9个。  QEMU和VisionFive屏保锁屏不能解锁（本发行版将卸载屏保程序）, unmatched屏保解锁成功|
| 4 | [支持Chromium浏览器](./chromium/测试报告.xlsx) | <font color=green>█</font> | 安装和卸载正常，整体核心功能(重要组件和系统插件)稳定正常，整体质量良好，发现缺陷2个。 |
| 5 | [支持Firefox浏览器](./firefox/测试报告.xlsx) | <font color=green>█</font> | 安装和卸载正常(此版本源包含97和100两个版本Firefox，安装需使用包全名进行安装，即dnf install firefox-97xxxxx)，整体核心功能(重要组件和系统插件)稳定正常，整体质量良好，发现缺陷8个。 |
| 6 | [支持Libreoffice浏览器](./libreoffice/测试报告.xlsx) | <font color=green>█</font> | 安装正常，卸载失败，整体核心功能(重要组件和系统插件)稳定正常，整体质量良好，发现缺陷2个。 |
| 7 | [支持Tunderbird](./tunderbird/测试报告.xlsx) | <font color=green>█</font> | 安装和卸载正常，整体核心功能(重要组件和系统插件)稳定正常，整体质量良好，可以收发邮件。发现缺陷两例，分别为无法保存邮件内容为样例和无法修改语言为英语外的语言，不影响核心功能使用。 |
| 8 | 支持Eclipse | <font color=green>█</font> | 安装和卸载正常，整体核心功能(重要组件和系统插件)稳定正常，整体质量良好。发现功能缺陷2个，eclipse里面，菜单project下面的open project是灰色的，不能使用，不能打开已有project和eclipse无法配置tomcat。发现性能缺陷1个，软件启动慢，在QEMU和unmatched开发板上的启动时间均超过了5分钟。此测试项目为临时添加，暂未提交测试用例报告。 |
| 9 | [支持VLC](./vlc/测试报告.xlsx) | <font color=blue>▲</font> | 安装和卸载正常，在QEMU和Visionfive无显卡环境下播放mp4视频黑屏，需要手工设置输出格式为X11，unmatched上工作正常，部分设备上播放视频及音频没有声音，未通过测试，从发行版预装软件中删除。发现缺陷5个。 |
| 10 | [支持GIMP](./gimp/测试报告.xlsx) | <font color=green>█</font> | 安装和卸载正常，整体核心功能(重要组件和系统插件)稳定正常，整体质量良好。尚未发现功能缺陷。 |

<font color=red>●</font>： 表示特性不稳定，风险高

<font color=blue>▲</font>： 表示特性基本可用，遗留少量问题

<font color=green>█</font>： 表示特性质量良好

重点软件测试缺陷表
|    软件名称         | P1   | P2         | P3                             | P4                 | P5                         |
| ----------- | ---- | ---------- | ------------------------------ | ------------------ | -------------------------- |
| Firefox     |      |            | 语言设置选项出现乱码             |                    |                            |
|             |      |            | 设置语言后页面无法正常显示        |                    |                            |
|             |      |            | 无法停止下载                    |                    |                            |
|             |      |            | 安装报错                        |                      |                           |
|             |      |            | 下载项显示空白                  |                            |
|             |      |            |                                | 数据不能同步                           |
|             |      |            |                                | 打不开b站          |                            |
|             |      |            |                                | 不能进入阅读模式   |                            |
| VLC         |      |            | 无显卡环境（QEMU, VisionFive），视频播放黑屏，需手工更改视频输出方式X11 |                    |                            |
|             |      |            | 播放卡顿                       |                    |                            |
|             |      |            | 文件标题显示错误               |                    |                            |
|             |      |            | 视频及音频播放无声音             |                 |                              |
|             |      |            |                                | 字幕列表部分显示乱码       |                            |
| GIMP        |      |            |                                |                    | 无法打开使用手册           |
| Thunderbird |      |            |                                |                    | 无法修改语言为英语外的语言 |
|             |      |            |                                | 无法保存邮件内容为样例   |                      |
| Chromuim    |      |            |                                | 谷歌账号数据同步失败   |                            |
|             |      |            |                                |                     | 命令行启动需添加—browser |
| Xfce        |      |自动锁屏无法解锁（QEMU，VisionFive）            |                |                    |                            |
|             |      |            | 应用程序查找器无法查看历史命令 |                    |                            |
|             |      |            | 改伸缩比例                     |                    |                            |
|             |      |            |                                | 回收站没有默认显示 |                            |
|             |      |            |                                | 设置桌面为纯色，无变化     |                            |
|             |      |            |                                | 改变桌面朝向左，无变化     |                            |
|             |      |            |                                | 改变桌面朝向右，无变化     |                            |
|             |      |            |                                | 改变桌面朝向上，无变化     |                            |
|             |      |            |                                | 改变桌面朝向下，无变化     |                            |
| Ecilpse     |      |            | 不能打开已有项目                |                          |                             |
|             |      |            | 无法配置tomcat                  |                          |                            |
|             |      |            |                                | 软件启动时间较长           |                            |
| Libreoffice |      |            | 无法卸载                        |                          |                            |
|             |      |            | 无法验证安装问题                |                           |                            |

在经过修复后生成了openEuler-22.03-V1-riscv64版本，较于20220926版本22.03修复了缺陷P2 1个，P3 1个，删除了P5 1个。

|    软件名称         | P1   | P2         | P3                      | P4                 | P5                         | 备注            |
| ----------- | ---- | ---------- | ------------------------------ | ------------------ | -------------------------- |-------------------------| 
| Firefox            |      |            | 安装报错                |                    |                   | 原先存在97与100两个版本，目前删除了100只保留了97，此缺陷解决 |
| Chromium           |      |            |                        |                    |命令行命令行启动需添加—browser| 站会上决定删除此缺陷       |
| Xfce               |      |自动锁屏无法解锁（QEMU，VisionFive） |              |                     |              | 重新发布了一版删除屏保的镜像，此缺陷解决 |

修复过后openEuler-22.03-V1-riscv64 版本共发现问题 29个，P1 0 个，P2 0 个，P3 13 个，P4 11 个，P5 5 个，以下为22.03-v1版本的重点软件测试缺陷表

|    软件名称  | P1   | P2         | P3                             | P4                 | P5                         |
| ----------- | ---- | ---------- | ------------------------------ | ------------------ | -------------------------- |
| Firefox     |      |            | 语言设置选项出现乱码           |                    |                              |
|             |      |            | 设置语言后页面无法正常显示     |                    |                              |                             
|             |      |            | 无法停止下载                  |                    |                              |                              
|             |      |            | 下载项显示空白                  |                            |                                                
|             |      |            |                                | 数据不能同步                           |                                      
|             |      |            |                                | 打不开b站          |                            |
|             |      |            |                                |                   | 不能进入阅读模式              |
| VLC         |      |            | 无显卡环境（QEMU, VisionFive），视频播放黑屏，需手工更改视频输出方式X11 |                    |                            |
|             |      |            | 播放卡顿                       |                    |                            |
|             |      |            | 文件标题显示错误               |                    |                            |
|             |      |            | 视频及音频播放无声音             |                 |                              |
|             |      |            |                                | 字幕列表部分显示乱码       |                            |
| GIMP        |      |            |                                |                    | 无法打开使用手册           |
| Thunderbird |      |            |                                |                    | 无法修改语言为英语外的语言 |
|             |      |            |                                | 无法保存邮件内容为样例   |                      |
| Chromuim    |      |            |                                |                      | 谷歌账号数据同步失败       |
| Xfce        |      |            |                                |                    | 应用程序查找器无法查看历史命令 |
|             |      |            | 改伸缩比例                     |                    |                            |
|             |      |            |                                | 回收站没有默认显示 |                            |
|             |      |            |                                | 设置桌面为纯色，无变化     |                            |
|             |      |            |                                | 改变桌面朝向左，无变化     |                            |
|             |      |            |                                | 改变桌面朝向右，无变化     |                            |
|             |      |            |                                | 改变桌面朝向上，无变化     |                            |
|             |      |            |                                | 改变桌面朝向下，无变化     |                            |
| Ecilpse     |      |            | 不能打开已有项目                |                          |                             |
|             |      |            | 无法配置tomcat                  |                          |                            |
|             |      |            |                                | 软件启动时间较长           |                            |
| Libreoffice |      |            | 无法卸载                        |                          |                            |
|             |      |            | 无法验证安装问题                |                           |                            |


## 5.2 常见软件和系统功能自动化测试

发现有问题测试套/软件11个，建议修复，优先级（P4）

| 序号 | 测试套/软件        | 测试用例总数 | 通过 | 未通过 | 备注                                                         |
| ---- | ------------------ | ------------ | ---- | ------ | ------------------------------------------------------------ |
| 1    | kubernetes         | 3            | 1    | 2      | 样例oe_test_service_kube-controller-manager在运行结束后成功但在还原环境时超时 样例oe_test_service_kube-scheduler在对应脚本26行，即上级目录中的common/common.sh中47行处tar解压失败，从而无对应目录，且rpm_manager.py的参数混乱 |
| 2    | os-basic           | 56           | 53   | 3      | 样例oe_test_power_measurement_internal对应脚本32行kill进程失败，同时nohup.out中无预期结果 样例oe_test_power_powertop_powerup中脚本32行kill识别读取出来的进程id不存在从而kill失败，同时onhup.out中同样无预期结果 样例oe_test_who中脚本23行grep后的语句无返回值，29行grep pts非对应结果 |
| 3    | p7zip              | 5            | 0    | 5      | 五个样例p7zip安装失败导致提示错误7za：command not found。    |
| 4    | pcp                | 28           | 26   | 2      | 样例oe_test_pmdumplog_02中34行pmdumplog -S @00 -T @23 $archive_data返回结果错误 样例oe_test_pmlogsummary_02中pmlogsummary -S @00 -T @23 $archive_data $metric_name运行异常 |
| 5    | rabbitmq-server    | 2            | 1    | 1      | 样例oe_test_service_rabbitmq-server中rabbitmq-server.service服务stop,reload均失败 对应../common/common_lib.sh中42行与90行 |
| 6    | atune              | 1            | 0    | 1      | 对应testcases/cli-test/atune/oe_test_service_atune-engine.sh，未找到atune配置文件，且无atune-engine.service，atune-engine安装有问题 |
| 7    | clamav             | 11           | 9    | 2      | cli-test/clamav/oe_test_clamav_clamav-milter.sh运行超时，可能发生在后处理（post_test()）或配置功能测试处 cli-test/clamav/oe_test_clamav_sigtool_2.sh：未找到/var/lib/clamav/bytecode.cvd，可能为clamav安装有问题或收到前出错测试例影响 |
| 8    | djvulibre          | 5            | 3    | 2      | cli-test/djvulibre/oe_test_djvulibre_01.sh: 50/55/58行出错 cli-test/djvulibre/oe_test_djvulibre_02.sh:38行和52至90行出错 |
| 9    | easymock           | 11           | 9    | 2      | cli-test/easymock/oe_test_easymock_junit4: mvn自带测试运行出错 cli-test/easymock/oe_test_easymock_junit5: 测试运行超时 |
| 10   | freeradius         | 7            | 3    | 4      | cli-test/freeradius/oe_test_freeradius_freeradius-utils_rad_counter: 无/etc/raddb/mods-enabled/counter和rad_counter命令疑似freeradius-utils安装或软件源问题 cli-test/freeradius/oe_test_freeradius_freeradius-utils_radclient:无radiusd.service和radclient，疑似安装或软件源问题 cli-test/freeradius/oe_test_freeradius_freeradius-utils_radcryptAndRadeapclient:同缺失文件或命令，疑似安装或软件源问题 cli-test/freeradius/oe_test_freeradius_freeradius-utils_radlastAndRadsniff:同缺失文件或命令，疑似安装或软件源问题 |
| 11   | java-1.8.0-openjdk | 8            | 7    | 1      | cli-test/java-1.8.0-openjdk/oe_test_openjdk_rmic_rmid.sh: 36行处 “rmid -stop -port 1111”出错 |
| 12   | abrt               | 1            | 1    | 0      |                                                              |
| 13   | accountsservice    | 1            | 1    | 0      |                                                              |
| 14   | acl                | 8            | 8    | 0      |                                                              |
| 15   | acpid              | 5            | 5    | 0      |                                                              |
| 16   | alsa-utils         | 1            | 1    | 0      |                                                              |
| 17   | amanda             | 4            | 4    | 0      |                                                              |
| 18   | anaconda           | 8            | 8    | 0      |                                                              |
| 19   | arpwatch           | 1            | 1    | 0      |                                                              |
| 20   | at                 | 1            | 1    | 0      |                                                              |
| 21   | attr               | 1            | 1    | 0      |                                                              |
| 22   | audit              | 1            | 1    | 0      |                                                              |
| 23   | authd              | 1            | 1    | 0      |                                                              |
| 24   | authz              | 1            | 1    | 0      |                                                              |
| 25   | avahi              | 3            | 3    | 0      |                                                              |
| 26   | bcrypt             | 1            | 1    | 0      |                                                              |
| 27   | bind               | 1            | 1    | 0      |                                                              |
| 28   | bolt               | 1            | 1    | 0      |                                                              |
| 29   | brltty             | 1            | 1    | 0      |                                                              |
| 30   | byacc              | 4            | 4    | 0      |                                                              |
| 31   | ceph               | 9            | 9    | 0      |                                                              |
| 32   | clang              | 3            | 3    | 0      |                                                              |
| 33   | clevis             | 1            | 1    | 0      |                                                              |
| 34   | cloud-init         | 6            | 6    | 0      |                                                              |
| 35   | cmake              | 6            | 6    | 0      |                                                              |
| 36   | cockpit            | 1            | 1    | 0      |                                                              |
| 37   | colm               | 1            | 1    | 0      |                                                              |
| 38   | cpio               | 1            | 1    | 0      |                                                              |
| 39   | cppcheck           | 1            | 1    | 0      |                                                              |
| 40   | cracklib           | 1            | 1    | 0      |                                                              |
| 41   | cronie             | 2            | 2    | 0      |                                                              |
| 42   | cups-filters       | 1            | 1    | 0      |                                                              |
| 43   | cups               | 2            | 2    | 0      |                                                              |
| 44   | cvs                | 2            | 2    | 0      |                                                              |
| 45   | cyrus-sasl         | 1            | 1    | 0      |                                                              |
| 46   | dbus               | 2            | 2    | 0      |                                                              |
| 47   | digest-list-tools  | 1            | 1    | 0      |                                                              |
| 48   | dkms               | 1            | 1    | 0      |                                                              |
| 49   | dnf                | 8            | 8    | 0      |                                                              |
| 50   | dnsmasq            | 1            | 1    | 0      |                                                              |
| 51   | dnssec-trigger     | 1            | 1    | 0      |                                                              |
| 52   | dos2unix           | 1            | 1    | 0      |                                                              |
| 53   | dovecot            | 1            | 1    | 0      |                                                              |
| 54   | dracut             | 7            | 7    | 0      |                                                              |
| 55   | e2fsprogs          | 2            | 2    | 0      |                                                              |
| 56   | erlang             | 2            | 2    | 0      |                                                              |
| 57   | fcgi               | 1            | 1    | 0      |                                                              |
| 58   | firebird           | 1            | 1    | 0      |                                                              |
| 59   | firewalld          | 3            | 3    | 0      |                                                              |
| 60   | flatpak            | 1            | 1    | 0      |                                                              |
| 61   | fprintd            | 1            | 1    | 0      |                                                              |
| 62   | galera             | 1            | 1    | 0      |                                                              |
| 63   | ganglia            | 1            | 1    | 0      |                                                              |
| 64   | geoclue2           | 1            | 1    | 0      |                                                              |
| 65   | geos               | 1            | 1    | 0      |                                                              |
| 66   | git                | 1            | 1    | 0      |                                                              |
| 67   | glibc              | 2            | 2    | 0      |                                                              |
| 68   | gpm                | 1            | 1    | 0      |                                                              |
| 69   | grub2              | 1            | 1    | 0      |                                                              |
| 70   | gssproxy           | 1            | 1    | 0      |                                                              |
| 71   | haproxy            | 1            | 1    | 0      |                                                              |
| 72   | haveged            | 1            | 1    | 0      |                                                              |
| 73   | help2man           | 1            | 1    | 0      |                                                              |
| 74   | hsqldb             | 1            | 1    | 0      |                                                              |
| 75   | htop               | 1            | 1    | 0      |                                                              |
| 76   | httpd              | 1            | 1    | 0      |                                                              |
| 77   | ImageMagick        | 8            | 8    | 0      |                                                              |
| 78   | initial-setup      | 1            | 1    | 0      |                                                              |
| 79   | initscripts        | 2            | 2    | 0      |                                                              |
| 80   | iperf3             | 1            | 1    | 0      |                                                              |
| 81   | iputils            | 1            | 1    | 0      |                                                              |
| 82   | ipwatchd           | 1            | 1    | 0      |                                                              |
| 83   | javapackages-tools | 5            | 5    | 0      |                                                              |
| 84   | jemalloc           | 2            | 2    | 0      |                                                              |
| 85   | jq                 | 1            | 1    | 0      |                                                              |
| 86   | junit5             | 12           | 12   | 0      |                                                              |
| 87   | kernel             | 2            | 2    | 0      |                                                              |
| 88   | keyutils           | 1            | 1    | 0      |                                                              |
| 89   | krb5               | 2            | 2    | 0      |                                                              |
| 90   | libcanberra        | 3            | 3    | 0      |                                                              |
| 91   | libcap             | 9            | 9    | 0      |                                                              |
| 92   | libcgroup          | 1            | 1    | 0      |                                                              |
| 93   | libmemcached       | 12           | 12   | 0      |                                                              |
| 94   | libosinfo          | 2            | 2    | 0      |                                                              |
| 95   | libreswan          | 2            | 2    | 0      |                                                              |
| 96   | libstoragemgmt     | 1            | 1    | 0      |                                                              |
| 97   | libwbxml           | 2            | 2    | 0      |                                                              |
| 98   | libzip             | 3            | 3    | 0      |                                                              |
| 99   | lldpad             | 1            | 1    | 0      |                                                              |
| 100  | lm_sensors         | 1            | 1    | 0      |                                                              |
| 101  | lvm2               | 7            | 7    | 0      |                                                              |
| 102  | lxc                | 1            | 1    | 0      |                                                              |
| 103  | man-db             | 2            | 2    | 0      |                                                              |
| 104  | mdadm              | 1            | 1    | 0      |                                                              |
| 105  | memcached          | 3            | 3    | 0      |                                                              |
| 106  | mksh               | 1            | 1    | 0      |                                                              |
| 107  | mlocate            | 1            | 1    | 0      |                                                              |
| 108  | ModemManager       | 1            | 1    | 0      |                                                              |
| 109  | mt-st              | 1            | 1    | 0      |                                                              |
| 110  | multipath-tools    | 1            | 1    | 0      |                                                              |
| 111  | munge              | 1            | 1    | 0      |                                                              |
| 112  | mutt               | 1            | 1    | 0      |                                                              |
| 113  | netcf              | 1            | 1    | 0      |                                                              |
| 114  | net-tools          | 1            | 1    | 0      |                                                              |
| 115  | NetworkManager     | 4            | 4    | 0      |                                                              |
| 116  | nfs-utils          | 8            | 8    | 0      |                                                              |
| 117  | nghttp2            | 1            | 1    | 0      |                                                              |
| 118  | nginx              | 1            | 1    | 0      |                                                              |
| 119  | nodejs             | 3            | 3    | 0      |                                                              |
| 120  | nss-pam-ldapd      | 1            | 1    | 0      |                                                              |
| 121  | nss_wrapper        | 1            | 1    | 0      |                                                              |
| 122  | ntp                | 4            | 4    | 0      |                                                              |
| 123  | oddjob             | 1            | 1    | 0      |                                                              |
| 124  | opencc             | 1            | 1    | 0      |                                                              |
| 125  | opencryptoki       | 1            | 1    | 0      |                                                              |
| 126  | openhpi            | 1            | 1    | 0      |                                                              |
| 127  | open-iscsi         | 2            | 2    | 0      |                                                              |
| 128  | open-isns          | 1            | 1    | 0      |                                                              |
| 129  | openldap           | 1            | 1    | 0      |                                                              |
| 130  | openscap           | 4            | 4    | 0      |                                                              |
| 131  | openslp            | 1            | 1    | 0      |                                                              |
| 132  | opensm             | 1            | 1    | 0      |                                                              |
| 133  | opensp             | 2            | 2    | 0      |                                                              |
| 134  | openssh            | 4            | 4    | 0      |                                                              |
| 135  | openssl            | 21           | 21   | 0      |                                                              |
| 136  | openwsman          | 1            | 1    | 0      |                                                              |
| 137  | optipng            | 2            | 2    | 0      |                                                              |
| 138  | osc                | 6            | 6    | 0      |                                                              |
| 139  | ostree             | 1            | 1    | 0      |                                                              |
| 140  | pacemaker          | 1            | 1    | 0      |                                                              |
| 141  | PackageKit         | 2            | 2    | 0      |                                                              |
| 142  | pam                | 1            | 1    | 0      |                                                              |
| 143  | pcsc-lite          | 2            | 2    | 0      |                                                              |
| 144  | perl-Net-Server    | 1            | 1    | 0      |                                                              |
| 145  | pesign             | 1            | 1    | 0      |                                                              |
| 146  | php                | 8            | 8    | 0      |                                                              |
| 147  | policycoreutils    | 3            | 3    | 0      |                                                              |
| 148  | polkit             | 1            | 1    | 0      |                                                              |
| 149  | portreserve        | 1            | 1    | 0      |                                                              |
| 150  | powertop           | 1            | 1    | 0      |                                                              |
| 151  | proftpd            | 2            | 2    | 0      |                                                              |
| 152  | python-blivet      | 1            | 1    | 0      |                                                              |
| 153  | python-keyring     | 1            | 1    | 0      |                                                              |
| 154  | python-wheel       | 1            | 1    | 0      |                                                              |
| 155  | qt5-qttools        | 9            | 9    | 0      |                                                              |
| 156  | quota              | 1            | 1    | 0      |                                                              |
| 157  | rdate              | 1            | 1    | 0      |                                                              |
| 158  | rdma-core          | 1            | 1    | 0      |                                                              |
| 159  | realmd             | 1            | 1    | 0      |                                                              |
| 160  | redis5             | 3            | 3    | 0      |                                                              |
| 161  | redis6             | 3            | 3    | 0      |                                                              |
| 162  | redis              | 3            | 3    | 0      |                                                              |
| 163  | resource-agents    | 1            | 1    | 0      |                                                              |
| 164  | rpcbind            | 2            | 2    | 0      |                                                              |
| 165  | rpmdevtools        | 2            | 2    | 0      |                                                              |
| 166  | rpmlint            | 2            | 2    | 0      |                                                              |
| 167  | rrdtool            | 2            | 2    | 0      |                                                              |
| 168  | rsync              | 2            | 2    | 0      |                                                              |
| 169  | rsyslog            | 1            | 1    | 0      |                                                              |
| 170  | rtkit              | 1            | 1    | 0      |                                                              |
| 171  | rubygem-bundler    | 13           | 13   | 0      |                                                              |
| 172  | ruby               | 8            | 8    | 0      |                                                              |
| 173  | sane-backends      | 1            | 1    | 0      |                                                              |
| 174  | sanlock            | 1            | 1    | 0      |                                                              |
| 175  | sblim-sfcb         | 1            | 1    | 0      |                                                              |
| 176  | scsi-target-utils  | 1            | 1    | 0      |                                                              |
| 177  | sendmail           | 2            | 2    | 0      |                                                              |
| 178  | smartmontools      | 1            | 1    | 0      |                                                              |
| 179  | spice-vdagent      | 2            | 2    | 0      |                                                              |
| 180  | sqlite-jdbc        | 1            | 1    | 0      |                                                              |
| 181  | sqlite             | 17           | 17   | 0      |                                                              |
| 182  | sssd               | 2            | 2    | 0      |                                                              |
| 183  | stunnel            | 1            | 1    | 0      |                                                              |
| 184  | swig               | 10           | 10   | 0      |                                                              |
| 185  | switcheroo-control | 1            | 1    | 0      |                                                              |
| 186  | sysprof            | 2            | 2    | 0      |                                                              |
| 187  | sysstat            | 3            | 3    | 0      |                                                              |
| 188  | systemtap          | 2            | 2    | 0      |                                                              |
| 189  | tang               | 3            | 3    | 0      |                                                              |
| 190  | tcllib             | 3            | 3    | 0      |                                                              |
| 191  | telnet             | 1            | 1    | 0      |                                                              |
| 192  | tftp               | 2            | 2    | 0      |                                                              |
| 193  | tidy               | 16           | 16   | 0      |                                                              |
| 194  | tigervnc           | 1            | 1    | 0      |                                                              |
| 195  | timedatex          | 1            | 1    | 0      |                                                              |
| 196  | tomcat             | 2            | 2    | 0      |                                                              |
| 197  | udisks2            | 1            | 1    | 0      |                                                              |
| 198  | umoci              | 1            | 1    | 0      |                                                              |
| 199  | unbound            | 2            | 2    | 0      |                                                              |
| 200  | upower             | 1            | 1    | 0      |                                                              |
| 201  | usbmuxd            | 1            | 1    | 0      |                                                              |
| 202  | util-linux         | 3            | 3    | 0      |                                                              |
| 203  | uuid               | 2            | 2    | 0      |                                                              |
| 204  | varnish            | 2            | 2    | 0      |                                                              |
| 205  | vsftpd             | 2            | 2    | 0      |                                                              |
| 206  | watchdog           | 3            | 3    | 0      |                                                              |
| 207  | wireshark          | 2            | 2    | 0      |                                                              |
| 208  | x265               | 1            | 1    | 0      |                                                              |
| 209  | xdelta             | 3            | 3    | 0      |                                                              |
| 210  | xfsprogs           | 1            | 1    | 0      |                                                              |
| 211  | xinetd             | 1            | 1    | 0      |                                                              |
| 212  | xmltoman           | 1            | 1    | 0      |                                                              |
| 213  | ypbind             | 1            | 1    | 0      |                                                              |
| 214  | ypserv             | 3            | 3    | 0      |                                                              |
| 215  | zerofree           | 1            | 1    | 0      |                                                              |
| 216  | zvbi               | 1            | 1    | 0      |                                                              |

# 6 用户反馈开发需求

| **序号** | **特性名称** | 等级 |
| -------- | ---------------------------- | ------------------------------------------------------------ |
| 1 | 镜像预装中文输入法                                           | P3 |
| 2 |eclipse支持tomcat插件的安装与配置| P4 |

# 7. 附件

1. [RISC-V openEuler 22.03 自动化测试报告](./auto_testing/0926-22.03testing)
2. [RISC-V openEuler 22.09 自动化测试报告](./auto_testing/0922-22.09testing)
3. [RISC-V openEuler 22.03-0926版本测试说明](https://github.com/FIFCC/plct-testing/blob/main/20220926v0.2/README.md)
4. [RISC-V openEuler 22.03-v1版本测试说明](https://github.com/FIFCC/plct-testing/blob/main/22.03-v1/README.md)
