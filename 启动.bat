@echo off
chcp 65001 >nul
title 圣诞树项目 - 一键启动
color 0A
cls
echo.
echo ========================================
echo   圣诞树项目 - 自动启动服务器
echo ========================================
echo.

cd /d "%~dp0"

REM 检查 Node.js
where node >nul 2>&1
if %errorlevel% equ 0 (
    echo [√] 检测到 Node.js
    echo [*] 正在启动服务器...
    echo.
    start "圣诞树服务器" cmd /k "node server.js"
    timeout /t 3 >nul
    echo [√] 服务器已启动！
    echo.
    echo [*] 访问地址: http://localhost:8080/
    echo [*] 正在打开浏览器...
    timeout /t 1 >nul
    start http://localhost:8080/
    echo.
    echo [提示] 服务器窗口已打开，关闭该窗口可停止服务器
    echo.
    pause
    exit /b 0
)

REM 检查 Python
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo [√] 检测到 Python
    echo [*] 正在启动服务器...
    echo.
    start "圣诞树服务器" cmd /k "python -m http.server 8080"
    timeout /t 3 >nul
    echo [√] 服务器已启动！
    echo.
    echo [*] 访问地址: http://localhost:8080/
    echo [*] 正在打开浏览器...
    timeout /t 1 >nul
    start http://localhost:8080/
    echo.
    echo [提示] 服务器窗口已打开，关闭该窗口可停止服务器
    echo.
    pause
    exit /b 0
)

REM 检查 py 命令
where py >nul 2>&1
if %errorlevel% equ 0 (
    echo [√] 检测到 Python (py)
    echo [*] 正在启动服务器...
    echo.
    start "圣诞树服务器" cmd /k "py -m http.server 8080"
    timeout /t 3 >nul
    echo [√] 服务器已启动！
    echo.
    echo [*] 访问地址: http://localhost:8080/
    echo [*] 正在打开浏览器...
    timeout /t 1 >nul
    start http://localhost:8080/
    echo.
    echo [提示] 服务器窗口已打开，关闭该窗口可停止服务器
    echo.
    pause
    exit /b 0
)

REM 都没有，直接打开 HTML
echo [警告] 未检测到 Node.js 或 Python
echo [*] 将直接打开 HTML 文件（某些功能可能受限）
echo.
start "" "32-单手UI优化.html"
timeout /t 2 >nul
echo.
echo [提示] 如需完整功能，请安装 Node.js 或 Python
echo [提示] Node.js: https://nodejs.org/
echo [提示] Python: https://www.python.org/
echo.
pause

