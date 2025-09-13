@echo off
:: Bilibili Fans Medal Helper Scheduled Task Setup Script

echo Bilibili Fans Medal Helper - Scheduled Task Setup
echo =================================================

:: Get current directory
set "SCRIPT_PATH=%~dp0main.py"
set "FOLDER_PATH=%~dp0"

:: Remove quotes from paths
set SCRIPT_PATH=%SCRIPT_PATH:"=%
set FOLDER_PATH=%FOLDER_PATH:"=%

echo Current folder: %FOLDER_PATH%
echo Script path: %SCRIPT_PATH%

:: Create a temporary VBS script to run Python minimized
echo Creating helper script...
(
    echo Set WshShell = CreateObject("WScript.Shell"^)
    echo WshShell.CurrentDirectory = "%FOLDER_PATH:\=\\%"
    echo WshShell.Run "python.exe main.py", 0, True
    echo Set WshShell = Nothing
) > "%FOLDER_PATH%\run_minimized.vbs"

:: Create the scheduled task
echo Creating scheduled task to run at 01:00 AM daily...
schtasks /create /tn "Bilibili Fans Medal Helper" /tr "wscript.exe \"%FOLDER_PATH%\run_minimized.vbs\"" /sc daily /st 01:00 /f

if %errorlevel% equ 0 (
    echo.
    echo Scheduled task created successfully!
    echo The task will run daily at 01:00 AM
    echo Task name: "Bilibili Fans Medal Helper"
) else (
    echo.
    echo Failed to create scheduled task
    echo Error code: %errorlevel%
)

echo.
echo To manually run the task: schtasks /run /tn "Bilibili Fans Medal Helper"
echo To delete the task: schtasks /delete /tn "Bilibili Fans Medal Helper" /f
echo To query the task: schtasks /query /tn "Bilibili Fans Medal Helper"

echo.
echo Press any key to exit...
pause >nul