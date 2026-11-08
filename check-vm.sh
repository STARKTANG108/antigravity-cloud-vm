#!/usr/bin/env bash
set -e

echo "========================================================"
echo "🚀 Google Antigravity 2.29 Remote VM 硬件与环境体检报告"
echo "========================================================"
echo ""

echo "🔹 [1] 系统与内核信息 (OS & Kernel):"
uname -a
cat /etc/os-release 2>/dev/null | grep -E "^(PRETTY_NAME|VERSION)=" || true
echo ""

echo "🔹 [2] CPU 处理器信息 (Xeon 型号与核心数):"
if command -v lscpu >/dev/null 2>&1; then
    lscpu | grep -E "Model name|Socket|Thread|NUMA|CPU\(s\)|Vendor ID|Architecture|MHz"
else
    grep -E "model name|cpu cores|siblings" /proc/cpuinfo | head -n 6
fi
echo ""

echo "🔹 [3] 内存与交换空间 (RAM & Swap):"
free -h 2>/dev/null || vm_stat
echo ""

echo "🔹 [4] 磁盘容量与挂载点 (Disk Storage):"
df -h /
echo ""

echo "🔹 [5] 预装开发工具链版本 (Toolchain):"
echo "  - Node.js : $(node -v 2>/dev/null || echo '未安装')"
echo "  - Python3 : $(python3 --version 2>/dev/null || echo '未安装')"
echo "  - Git     : $(git --version 2>/dev/null || echo '未安装')"
echo "  - Docker  : $(docker --version 2>/dev/null || echo '未安装')"
echo "  - Go      : $(go version 2>/dev/null || echo '未安装')"
echo "  - Rust    : $(rustc --version 2>/dev/null || echo '未安装')"
echo ""

echo "========================================================"
echo "✅ 体检完成！当前工作目录: $(pwd)"
echo "========================================================"
