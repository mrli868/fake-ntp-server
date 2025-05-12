# 🕒 Fake NTP Server (+2h Offset) / 本地时间偏移 NTP 容器（+2 小时）

A lightweight, Docker-based NTP server that returns time **+2 hours ahead** of the host. Ideal for devices that are locked to a fixed time zone (e.g. China Standard Time) but need to reflect **local time** in another region (e.g. Australia).

一个轻量级的基于 Docker 的 NTP 时间服务器，提供比宿主机时间**快 2 小时**的网络时间。非常适合用于某些**锁定时区的设备**（如中国购买的平板），让它们在不更改系统设置的前提下显示**当前本地时间**（如澳洲时间）。

## 🔧 Features / 功能特点

- ✅ Based on Debian, uses `ntpd` and `libfaketime`  
- ⏱️ Default offset: `+2h` (configurable in Dockerfile)  
- 🐳 Time spoofing is limited to the container, **host system remains unchanged**  
- 🔌 Listens on UDP port 123, works with DNS or NAT redirection  
- 🧪 Suitable for home networks, testing, or device-specific time manipulation  

## 📦 Use Case Example / 使用场景示例

> Scenario: You live in Australia (GMT+10), but your imported tablet from China is locked to GMT+8.

通过该容器搭建本地 NTP 服务器并通过路由器劫持/转发 NTP 请求，该平板将会收到一个**快2小时的“假时间”**，从而**显示正确的澳洲时间**，而无需修改系统时区。

## 🚀 Quick Start / 快速部署

```bash
git clone https://github.com/YOURNAME/fake-ntp-server.git
cd fake-ntp-server
docker compose up -d --build
```

## ⚙️ Customization / 自定义

修改 `Dockerfile` 中的 `FAKETIME` 值即可调整偏移时间：

```dockerfile
ENV FAKETIME="+2h"
```

## 📂 File Structure / 文件结构

```
.
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## 📡 DNS/NAT Redirection / 路由器配合建议

搭配 iKuai、OpenWRT 或其他路由器将目标设备的 NTP 请求（如 `time.windows.com`, `pool.ntp.org`）重定向到本容器 IP，即可实现定向欺骗。

## 📜 License / 开源许可

MIT License

## 🙋 Maintainer / 作者

Created by [Your Name](https://github.com/yourname)
