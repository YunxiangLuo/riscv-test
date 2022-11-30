# Anolis OS 8 for RISC-V 的安装和配置

## 1. 环境准备

本说明文档以 fedora 35 和 Ubuntu 22.03 为例，部署 RISC-V 镜像。需要注意的是，Anolis 8 的软件仓库当前尚未包含 qemu-system-riscv，该软件包将在后续加入 EPAO (Extra Package For Anolis OS, https://mirrors.openanolis.cn/epao/8/) 中。

### 1.1 安装 libvirt 与 QEMU

- Fedora 35

```bash
yum install libvirt
yum install qemu-system-riscv
```

- Ubuntu 22.03

```bash
sudo apt install qemu-kvm libvirt-daemon-system -y
sudo apt install qemu-system-misc -y
```

### 1.2 安装完成后，启动 libvirt 守护进程

```bash
sudo systemctl start libvirtd
sudo systemctl status libvirtd
```

终端显示如下：

```
● libvirtd.service - Virtualization daemon
     Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; disabled; vendor preset: disabled)
     Active: active (running) since Wed 2022-06-22 19:38:15 CST; 10s ago
TriggeredBy: ● libvirtd-ro.socket
             ● libvirtd.socket
             ○ libvirtd-tls.socket
             ○ libvirtd-tcp.socket
             ● libvirtd-admin.socket
       Docs: man:libvirtd(8)
             https://libvirt.org
   Main PID: 7664 (libvirtd)
      Tasks: 21 (limit: 32768)
     Memory: 14.2M
        CPU: 356ms
     CGroup: /system.slice/libvirtd.service
             ├─ 7664 /usr/sbin/libvirtd --timeout 120
             ├─ 7767 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/libexec/libvirt_leaseshelper
             └─ 7768 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/libexec/libvirt_leaseshelper

Jun 22 19:38:15 anolis-booter dnsmasq[7767]: started, version 2.86 cachesize 150
Jun 22 19:38:15 anolis-booter dnsmasq[7767]: compile time options: IPv6 GNU-getopt DBus no-UBus no-i18n IDN2 DHCP DHCPv6 no-Lua TFTP no-conntrack ipset auth cryptohash DNSSEC loop-detect inotify dumpfile
Jun 22 19:38:15 anolis-booter dnsmasq-dhcp[7767]: DHCP, IP range 192.168.122.2 -- 192.168.122.254, lease time 1h
Jun 22 19:38:15 anolis-booter dnsmasq-dhcp[7767]: DHCP, sockets bound exclusively to interface virbr0
Jun 22 19:38:15 anolis-booter dnsmasq[7767]: reading /etc/resolv.conf
Jun 22 19:38:15 anolis-booter dnsmasq[7767]: using nameserver 100.100.2.136#53
Jun 22 19:38:15 anolis-booter dnsmasq[7767]: using nameserver 100.100.2.138#53
Jun 22 19:38:15 anolis-booter dnsmasq[7767]: read /etc/hosts - 3 addresses
Jun 22 19:38:15 anolis-booter dnsmasq[7767]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 addresses
Jun 22 19:38:15 anolis-booter dnsmasq-dhcp[7767]: read /var/lib/libvirt/dnsmasq/default.hostsfile
```

### 1.3 准备相关文件

从软件源中获取相关文件，

```bash
wget http://build.openanolis.cn/kojifiles/rsync/alt/risc-v/images/anolisos-disk-minimal-an8-Rawhide-sda.raw.xz
wget http://build.openanolis.cn/kojifiles/rsync/alt/risc-v/images/u-boot.bin
wget http://build.openanolis.cn/kojifiles/rsync/alt/risc-v/images/fw_dynamic.bin
unxz anolisos-disk-minimal-an8-Rawhide-sda.raw.xz
```

创建实例的过程中，可能会存在权限问题，因此将以上文件移动到 `/var/lib/libvirt/images/` 目录下.


镜像准备就绪后，我们还需要创建描述文件，在本例中，我们将其命名为 `riscv.xml`。

```xml
<domain type='qemu' id='1'>
  <name>riscv64</name>
  <memory unit='KiB'>16777216</memory>
  <currentMemory unit='KiB'>16777216</currentMemory>
  <vcpu placement='static'>8</vcpu>
  <resource>
    <partition>/machine</partition>
  </resource>
  <os>
    <type arch='riscv64' machine='virt'>hvm</type>
    <loader type='rom'>/var/lib/libvirt/images/fw_dynamic.bin</loader>
    <kernel>/var/lib/libvirt/images/u-boot.bin</kernel>
    <boot dev='hd'/>
  </os>
  <clock offset='utc'/>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>restart</on_reboot>
  <on_crash>destroy</on_crash>
  <devices>
    <emulator>/usr/bin/qemu-system-riscv64</emulator>
    <disk type='file' device='disk'>
      <driver name='qemu' type='raw'/>
      <source file='/var/lib/libvirt/images/anolisos-disk-minimal-an8-Rawhide-sda.raw' index='1'/>
      <backingStore/>
      <target dev='vda' bus='virtio'/>
      <alias name='virtio-disk0'/>
      <address type='pci' domain='0x0000' bus='0x03' slot='0x00' function='0x0'/>
    </disk>
    <controller type='pci' index='0' model='pcie-root'>
      <alias name='pcie.0'/>
    </controller>
    <controller type='pci' index='1' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='1' port='0x8'/>
      <alias name='pci.1'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x0' multifunction='on'/>
    </controller>
    <controller type='pci' index='2' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='2' port='0x9'/>
      <alias name='pci.2'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x1'/>
    </controller>
    <controller type='pci' index='3' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='3' port='0xa'/>
      <alias name='pci.3'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x2'/>
    </controller>
    <controller type='pci' index='4' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='4' port='0xb'/>
      <alias name='pci.4'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x3'/>
    </controller>
    <controller type='pci' index='5' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='5' port='0xc'/>
      <alias name='pci.5'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x4'/>
    </controller>
    <controller type='virtio-serial' index='0'>
      <alias name='virtio-serial0'/>
      <address type='pci' domain='0x0000' bus='0x02' slot='0x00' function='0x0'/>
    </controller>
    <interface type='network'>
      <source network='default' portid='fc80166a-9af1-40b5-8572-53d6693721b3' bridge='virbr0'/>
      <target dev='vnet0'/>
      <model type='virtio'/>
      <alias name='net0'/>
      <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
    </interface>
    <serial type='pty'>
      <source path='/dev/pts/3'/>
      <target type='system-serial' port='0'>
        <model name='16550a'/>
      </target>
      <alias name='serial0'/>
    </serial>
    <console type='pty' tty='/dev/pts/3'>
      <source path='/dev/pts/3'/>
      <target type='serial' port='0'/>
      <alias name='serial0'/>
    </console>
    <channel type='unix'>
      <source mode='bind' path='/var/lib/libvirt/qemu/channel/target/domain-1-rv64qb0/org.qemu.guest_agent.0'/>
      <target type='virtio' name='org.qemu.guest_agent.0' state='connected'/>
      <alias name='channel0'/>
      <address type='virtio-serial' controller='0' bus='0' port='1'/>
    </channel>
    <memballoon model='virtio'>
      <alias name='balloon0'/>
      <address type='pci' domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
    </memballoon>
  </devices>
  <seclabel type='dynamic' model='dac' relabel='yes'>
    <label>+107:+107</label>
    <imagelabel>+107:+107</imagelabel>
  </seclabel>
  <seclabel type='dynamic' model='none' relabel='yes'>
    <label>system_u:system_r:svirt_tcg_t:s0:c257,c805</label>
    <imagelabel>system_u:object_r:svirt_image_t:s0:c257,c805</imagelabel>
  </seclabel>
</domain>
```

## 2. 创建镜像实例和启动

可以通过 virsh 创建实例，对于普通用户，可能需要使用 sudo 提升权限。

```bash
sudo virsh create riscv.xml
```

通过串口连接到实例。

```bash
sudo virsh console riscv64
```
用户：root
默认密码：anolisos

## 3. 配置网络

```bash
ifconfig enp1s0 up
dhclient enp1s0
```


