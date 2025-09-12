#!/bin/bash

# 基础配置
JOURNAL_DIR="$HOME/Timestamp-Journal"
TIMEMOON=$(date "+%Y/%m")
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 创建目录结构
mkdir -p "$JOURNAL_DIR/$(dirname "$TIMEMOON")"

# 功能：写入日志文件
log_entry() {
    echo "[$TIMESTAMP] $1" >> "$JOURNAL_DIR/$TIMEMOON.txt"
    echo "记录已保存到: $JOURNAL_DIR/$TIMEMOON.txt"
}

# 手动输入
echo -e "\n请输入内容（Ctrl+D结束输入）:"
read -e -r -d $'\x04' TEXT  # 支持多行输入

if [ -n "$TEXT" ]; then
    log_entry "$TEXT"
else
    echo "未输入有效内容"
fi
