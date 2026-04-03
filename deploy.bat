@echo off
setlocal

:: Get current date and time for the commit message in YYYY-MM-DD HH:MM:SS format
for /f "delims=" %%I in ('powershell -NoProfile -Command "Get-Date -Format \"yyyy-MM-dd HH:mm:ss\""') do set datetime=%%I

echo Updating site at %datetime%...

:: Stage all changes
git add .

:: Commit with timestamp
git commit -m "Site update: %datetime%"

:: Push to remote
git push

echo.
echo Deployment finished!
pause
