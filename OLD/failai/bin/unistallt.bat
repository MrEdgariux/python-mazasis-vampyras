@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Programa automatiskai praso prisivegiju
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
cls  
echo.
echo ===============
echo Istrinama...
echo ===============
del %temp%\mazasisvampyras\ping.tmp
del %temp%\mazasisvampyras\failai\intro.bat
del %temp%\mazasisvampyras\failai\menu.bat
del %temp%\mazasisvampyras\failai\about.bat
del %temp%\mazasisvampyras\failai\unistallt.bat
if EXIST %temp%\mazasisvampyras\ping.tmp (
    cls
    echo.
    echo Istrinti nepavyko. Galite jus tai padaryti rankiniu budu
    echo Ar norite tai padaryti?
    echo.
    pause >nul
    start %temp%\mazasisvampyras
    exit
)
rmdir %temp%\mazasisvampyras\failai
rmdir %temp%\mazasisvampyras
cls
echo.
echo Istrinta
echo.
pause >nul
exit