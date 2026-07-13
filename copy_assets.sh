#!/bin/bash
# 从 BEPb fork 复制大文件到 profile 仓库
BEPb_DIR="/tmp/BEPb_copy"
PROFILE_DIR="/data1/kws/reinrein111_profile"

echo "==> 克隆 BEPb 仓库到临时目录..."

# 尝试多种方式克隆
git clone https://github.com/reinrein111/BEPb.git "$BEPb_DIR" 2>/dev/null || \
git clone git@github.com:reinrein111/BEPb.git "$BEPb_DIR" 2>/dev/null

if [ $? -ne 0 ]; then
    echo "克隆失败！请手动克隆: git clone https://github.com/reinrein111/BEPb.git /tmp/BEPb_copy"
    echo "然后重新运行此脚本"
    exit 1
fi

echo "==> 复制资源文件..."

# 复制 assets
cp "$BEPb_DIR/assets/linkedin.svg" "$PROFILE_DIR/assets/" 2>/dev/null
cp "$BEPb_DIR/assets/2022.gif" "$PROFILE_DIR/assets/" 2>/dev/null

# 复制 src 文件
cp "$BEPb_DIR/src/header_.png" "$PROFILE_DIR/src/" 2>/dev/null
cp "$BEPb_DIR/src/badges_"*.png "$PROFILE_DIR/src/" 2>/dev/null
cp "$BEPb_DIR/src/badges_hackerrank.png" "$PROFILE_DIR/src/" 2>/dev/null

# 复制 profile-3d-contrib
cp "$BEPb_DIR/profile-3d-contrib/"*.svg "$PROFILE_DIR/profile-3d-contrib/" 2>/dev/null

# 复制 github-metrics.svg
cp "$BEPb_DIR/github-metrics.svg" "$PROFILE_DIR/" 2>/dev/null

# 清理
rm -rf "$BEPb_DIR"

echo "==> 完成！所有文件已准备就绪"
echo ""
echo "当前文件列表:"
find "$PROFILE_DIR" -type f | sort