@echo off
:: Bilibili Fans Medal Helper Runner Script

echo Bilibili Fans Medal Helper
echo ==========================

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python not detected, please install Python 3.9 or higher
    pause
    exit /b 1
)

:: Run the main program
echo Starting Bilibili Fans Medal Helper...
python main.py

:: Check run result
if %errorlevel% equ 0 (
    echo.
    echo Program execution completed.
) else (
    echo.
    echo Program execution error, please check the log information.
)

echo.
echo Press any key to exit...
pause >nul