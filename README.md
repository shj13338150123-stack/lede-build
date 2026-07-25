# LEDE X86 Build

基于 coolsnowwolf/lede 源码，使用 GitHub Actions 自动编译 X86_64 平台 OpenWrt 固件。

## 使用方法

### 1. Fork 或者创建 GitHub 仓库
将本项目上传到你的 GitHub 仓库。

### 2. 触发编译
进入仓库的 Actions 页面 -> Build OpenWrt X86 -> Run workflow -> 点击 Run workflow

### 3. 下载固件
编译完成后（约 2-3 小时），在 Actions 完成的 workflow run 页面底部可以下载固件 artifact。

## 自定义配置

- 修改 `.github/workflows/build-x86.yml` 中的 `.config` 部分来增减软件包
- 修改 `diy-part1.sh` / `diy-part2.sh` 来添加自定义脚本
- 修改 `feeds.conf.default` 来添加自定义软件源

## 固件说明

- 默认 IP: 192.168.1.1
- 默认密码: password
- 目标平台: x86_64
- 包含 LuCI 中文界面、Argon 主题、常用工具和驱动

## 本地编译

如需本地编译，推荐使用 Ubuntu 20.04+ 或 WSL2：

```bash
# 安装依赖
sudo apt update && sudo apt install -y build-essential clang flex bison g++ gawk \
  gcc-multilib g++-multilib gettext git libncurses-dev libssl-dev \
  python3-distutils python3-setuptools rsync swig unzip zlib1g-dev file wget

# 克隆源码
git clone https://github.com/coolsnowwolf/lede
cd lede

# 更新 feeds
./scripts/feeds update -a
./scripts/feeds install -a

# 配置（或复制已有的 .config）
make menuconfig

# 编译
make download -j$(nproc)
make -j$(nproc) V=s
```

## 鸣谢

- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [OpenWrt](https://openwrt.org)
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
