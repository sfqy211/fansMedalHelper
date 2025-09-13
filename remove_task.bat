@echo off
:: Bilibili Fans Medal Helper Scheduled Task Removal Script

echo Bilibili Fans Medal Helper - Scheduled Task Removal
echo ===================================================

echo Removing scheduled task "Bilibili Fans Medal Helper"...

schtasks /delete /tn "Bilibili Fans Medal Helper" /f

if %errorlevel% equ 0 (
    echo.
    echo Scheduled task removed successfully!
) else (
    echo.
    echo Failed to remove scheduled task or task does not exist
    echo Error code: %errorlevel%
)

echo.
echo Press any key to exit...
pause >nul