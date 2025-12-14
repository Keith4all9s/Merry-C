// 简单的 Node.js HTTP 服务器
const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 8080;
const MIME_TYPES = {
    '.html': 'text/html; charset=utf-8',
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.wav': 'audio/wav',
    '.mp3': 'audio/mpeg',
    '.mp4': 'video/mp4',
    '.woff': 'application/font-woff',
    '.ttf': 'application/font-ttf',
    '.eot': 'application/vnd.ms-fontobject',
    '.otf': 'application/font-otf',
    '.wasm': 'application/wasm'
};

const server = http.createServer((req, res) => {
    console.log(`${req.method} ${req.url}`);

    // 解析 URL
    let filePath = '.' + decodeURIComponent(req.url);
    if (filePath === './' || filePath === '.') {
        filePath = './32-单手UI优化.html';
    }
    
    // 处理根路径直接访问
    if (req.url === '/' || req.url === '') {
        filePath = './32-单手UI优化.html';
    }

    const extname = String(path.extname(filePath)).toLowerCase();
    const contentType = MIME_TYPES[extname] || 'application/octet-stream';

    fs.readFile(filePath, (error, content) => {
        if (error) {
            if (error.code === 'ENOENT') {
                console.log(`文件未找到: ${filePath}`);
                // 列出当前目录的文件
                fs.readdir('.', (err, files) => {
                    if (err) {
                        res.writeHead(404, { 'Content-Type': 'text/html; charset=utf-8' });
                        res.end(`<h1>404 - 文件未找到</h1><p>路径: ${filePath}</p>`, 'utf-8');
                    } else {
                        const fileList = files.map(f => `<li><a href="/${encodeURIComponent(f)}">${f}</a></li>`).join('');
                        res.writeHead(404, { 'Content-Type': 'text/html; charset=utf-8' });
                        res.end(`<h1>404 - 文件未找到</h1><p>路径: ${filePath}</p><h2>当前目录文件列表:</h2><ul>${fileList}</ul>`, 'utf-8');
                    }
                });
            } else {
                res.writeHead(500);
                res.end(`服务器错误: ${error.code}`, 'utf-8');
            }
        } else {
            res.writeHead(200, { 'Content-Type': contentType });
            res.end(content, 'utf-8');
        }
    });
});

server.listen(PORT, () => {
    console.log(`\n========================================`);
    console.log(`服务器已启动！`);
    console.log(`访问地址: http://localhost:${PORT}/32-单手UI优化.html`);
    console.log(`按 Ctrl+C 停止服务器`);
    console.log(`========================================\n`);
});

