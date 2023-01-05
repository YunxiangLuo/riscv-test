# 使用k3s在openeuler环境下搭建kubernetes集群

## 概述

搭建集群可以使用 kind minikube k3s 这样的集成环境，也可以使用 kubeadm 等工具搭建集群。它们都没有提供官方 riscv64 二进制文件，使用其他人构建的 riscv64 k3s 二进制文件用于搭建集群。

## 安装需要的软件包

使用 k3s 需要安装 docker，使用包管理器安装 docker：

```
# dnf install docker
```

下载解压 k3s 包

```
$ wget https://github.com/carlosedp/riscv-bringup/releases/download/v1.0/k3s-v1.20.4-k3s1-riscv64.tar.gz
$ tar -xf k3s-v1.20.4-k3s1-riscv64.tar.gz
```

安装 k3s

```
# cp k3s-riscv64 /usr/local/bin/k3s
# cp k3s-uninstall.sh /usr/local/bin/
# cp k3s-killall.sh /usr/local/bin/
# cp k3s.logrotate /etc/logrotate.d/k3s
# cp k3s.service /etc/systemd/system/k3s.service
# touch /etc/systemd/system/k3s.env
# systemctl daemon-reload
```

## 启动服务，验证集群状态

启动 docker 服务

```
# systemctl start docker
```

启动 k3s 服务

```
# systemctl start k3s
```

查看集群状态

```
# k3s kubectl get node
# k3s kubectl get pods -A
```

## 在集群中运行服务

在集群中启动示例镜像

```
# k3s kubectl run helloworld --image carlosedp/echo-riscv
```

查看 pods 的端口映射

```
# k3s kubectl get svc helloworld
NAME         TYPE       CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
helloworld   NodePort   10.43.25.98   <none>        80:31650/TCP   13m
```

访问 pods 提供的服务

```
$ curl http://localhost:31650
Hello, World! I'm running on linux/riscv64 inside a container!
```
