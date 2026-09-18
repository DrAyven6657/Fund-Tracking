@echo off
cd /d "%~dp0"
echo ============================================
echo  Nasdaq-100 Fund Monitor  -  daily update
echo ============================================
echo [1/2] Updating fund data ...
python -m pip install pymupdf -q 2>nul
python scrape.py
if errorlevel 1 (
    echo.
    echo [ERROR] Update failed. Check your network and try again.
    pause
    exit /b 1
)
echo [2/2] Opening the page in your browser ...
start "" "%~dp0index.html"
echo.
echo Done! The page now shows the latest data.
echo Tip: double-click this file every day to refresh.
timeout /t 4 >nul
