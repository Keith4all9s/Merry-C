@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 正在启动本地服务器...
echo.
echo 服务器地址: http://localhost:8080/32-单手UI优化.html
echo.
echo 按 Ctrl+C 停止服务器
echo.
python -m http.server 8080
pause

