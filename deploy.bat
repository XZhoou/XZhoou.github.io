@echo off
setlocal

:: Get current date and time for the commit message
set datetime=%date% %time%

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
