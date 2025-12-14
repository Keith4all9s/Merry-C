# PowerShell 启动脚本
$port = 8080
$file = "32-单手UI优化.html"

Write-Host "正在启动本地服务器..." -ForegroundColor Green
Write-Host ""
Write-Host "服务器地址: http://localhost:$port/$file" -ForegroundColor Cyan
Write-Host ""
Write-Host "按 Ctrl+C 停止服务器" -ForegroundColor Yellow
Write-Host ""

Set-Location $PSScriptRoot

# 检查 Python 是否可用
try {
    python -m http.server $port
} catch {
    Write-Host "错误: 无法启动服务器。请确保已安装 Python。" -ForegroundColor Red
    Write-Host "或者尝试直接双击 HTML 文件在浏览器中打开。" -ForegroundColor Yellow
    pause
}

