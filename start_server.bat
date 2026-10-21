@echo off
title Face Recognition Server Launcher
color 0A
echo ========================================================
echo   MENJALANKAN SERVER FACE RECOGNITION + TUNNEL
echo ========================================================
cd /d "%~dp0"

echo.
echo [1/2] Menyalakan Backend AI Python (Port 5000)...
start "Backend Flask AI" cmd /k "python app.py"

echo Menunggu server Python siap...
timeout /t 4 /nobreak >nul

echo.
echo [2/2] Menyalakan Cloudflare Tunnel...
start "Cloudflare Tunnel" cmd /k "cloudflared.exe tunnel --url http://localhost:5000"

echo.
echo ========================================================
echo   Server Python dan Cloudflare Tunnel berhasil dibuka!
echo.
echo   PENTING:
echo   1. Jangan tutup jendela "Backend Flask AI" dan "Cloudflare Tunnel".
echo   2. Lihat URL https://xxxx.trycloudflare.com di jendela Cloudflare.
echo   3. Jika URL berbeda, buka web Vercel Anda dan klik
echo      "Ganti Server" lalu masukkan URL baru tersebut.
echo ========================================================
echo.
pause
