@echo off
chcp 65001 >nul
title 圣诞树项目服务器
color 0A
echo.
echo ========================================
echo   圣诞树项目 - 自动启动服务器
echo ========================================
echo.

cd /d "%~dp0"

REM 尝试使用 Node.js
where node >nul 2>&1
if %errorlevel% equ 0 (
    echo [成功] 检测到 Node.js，使用 Node.js 启动...
    echo.
    start "圣诞树项目服务器" cmd /k "cd /d %~dp0 && node server.js"
    timeout /t 3 >nul
    echo.
    echo [信息] 服务器已启动！
    echo [信息] 访问地址: http://localhost:8080/
    echo [信息] 浏览器将自动打开...
    echo.
    timeout /t 2 >nul
    start http://localhost:8080/
    exit /b 0
)

REM 尝试使用 Python
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo [成功] 检测到 Python，使用 Python 启动...
    echo.
    start "圣诞树项目服务器" cmd /k "cd /d %~dp0 && python -m http.server 8080"
    timeout /t 3 >nul
    echo.
    echo [信息] 服务器已启动！
    echo [信息] 访问地址: http://localhost:8080/32-单手UI优化.html
    echo [信息] 浏览器将自动打开...
    echo.
    timeout /t 2 >nul
    start http://localhost:8080/32-单手UI优化.html
    exit /b 0
)

REM 尝试使用 py 命令
where py >nul 2>&1
if %errorlevel% equ 0 (
    echo [成功] 检测到 Python (py)，使用 Python 启动...
    echo.
    start "圣诞树项目服务器" cmd /k "cd /d %~dp0 && py -m http.server 8080"
    timeout /t 3 >nul
    echo.
    echo [信息] 服务器已启动！
    echo [信息] 访问地址: http://localhost:8080/32-单手UI优化.html
    echo [信息] 浏览器将自动打开...
    echo.
    timeout /t 2 >nul
    start http://localhost:8080/32-单手UI优化.html
    exit /b 0
)

REM 如果都没有，直接打开 HTML 文件
echo [警告] 未检测到 Node.js 或 Python
echo [信息] 将直接打开 HTML 文件（某些功能可能受限）
echo.
start "" "32-单手UI优化.html"
timeout /t 2 >nul
echo.
echo [提示] 如需完整功能，请安装 Node.js 或 Python
echo.
pause

