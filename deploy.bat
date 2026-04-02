@echo off
setlocal

:: Get current date and time for the commit message in YYYY-MM-DD HH:MM:SS format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set dt=%%I
set datetime=%dt:~0,4%-%dt:~4,2%-%dt:~6,2% %dt:~8,2%:%dt:~10,2%:%dt:~12,2%

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
