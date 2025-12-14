@echo off
chcp 65001 >nul
title 圣诞树项目服务器
echo.
echo ========================================
echo 正在启动服务器...
echo ========================================
echo.

cd /d "%~dp0"

REM 检查 Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未找到 Node.js
    echo.
    echo 请选择以下方式之一：
    echo 1. 安装 Node.js: https://nodejs.org/
    echo 2. 使用 Python 服务器（如果已安装 Python）
    echo 3. 直接双击 HTML 文件打开（功能可能受限）
    echo.
    pause
    exit /b 1
)

echo [信息] 使用 Node.js 启动服务器...
echo.
node server.js

pause

