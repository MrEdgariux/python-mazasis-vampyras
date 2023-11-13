@echo off
if EXIST %temp%\mazasisvampyras\failai (
  cd %temp%
  goto starttemp
)
IF NOT EXIST "%cd%/failai" (
  CLS
  ECHO.
  echo Failai kuriu reikia ikelimui nerasti!
  echo Prasome patikrinti ar teisingai ikelete failu vieta: %cd%
  echo Jeigu ivyko klaida, galite testi siuntima. Bet gali uzstrigti diegimas
  pause >nul
  GOTO:error
)

CD failai || GOTO:error
cls
title [%date%] Mazasis Vampyras setup.bat
ECHO.
echo ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
echo Sveikas atvykes i MazasisVampyras idiegima, sis installeris idiegs
echo failus i jusu sita sudina kompa, del detalesnes informacijos spausk
echo enter.
echo ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ECHO.
PAUSE >nul
GOTO settings

:error
  ECHO.
  ECHO Atsiprasau, nepavyko ikelti failu.
  echo.
  PAUSE >nul
  exit
:errori2
  echo Nepavyko nustatyti lokacijos is temp
  echo Ikelimas nutrauktas
  pause >nul
  exit

:settings
set inst=%programfiles%\MrEdgariux\MazasisVampyras
cls
echo.
color 2
echo ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
echo Ikelejas failus ikels i: %inst%
echo Jeigu netinka, spausk C ir enter (nera dar)
echo Jeigu tinka, spausk T ir enter (required admin rights)
echo ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
set /p vald=Nustatymas: 
if %vald% == C goto changeset
if %vald% == T goto starts
goto error

:starttemp
set progress=0
echo.
echo Idiegiama... %progress%%
echo.
if not exist %cd%/mazasisvampyras/failai (
  echo.
  echo Failai neegzistuoja
  echo.
  pause >nul
  exit
)
cd %programfiles% || goto error
mkdir MrEdgariux
cd MrEdgariux
set progress=1
echo Idiegiama... %progress%%
mkdir MazasisVampyras
cd MazasisVampyras
set progress=3
echo Idiegiama... %progress%%
copy %temp%\mazasisvampyras\failai\intro.bat
copy %temp%\mazasisvampyras\failai\menu.bat
mkdir bin
cd bin
copy %temp%\mazasisvampyras\failai\about.bat
copy %temp%\mazasisvampyras\failai\unistallt.bat
set progress=58
echo Idiegimas baigtas, tikrinami failai... %progress%%
if EXIST %programfiles%\MrEdgariux\MazasisVampyras\intro.bat (
  cls
  echo.
  echo Idiegimas sekmingas
  echo.
  pause >nul
  exit
)
echo.
echo Failai neaptikti, tai ivyksta kai admin teisiu nera
echo eik mamai db skustis duxe
echo.
pause >nul
exit

:starts
set lok=%cd%
if NOT EXIST %temp%\mazasisvampyras ( mkdir %temp%\mazasisvampyras || echo Nepavyko sukurti aplankalo )
if EXIST %temp%\mazasisvampyras\failai ( goto checka )
cd %temp%\mazasisvampyras || echo Nepavyko nukeliauti i mazasis vampyras aplankala, neegzistuoja toks
mkdir failai || echo Nepavyko sukurti failai aplankalo
cd failai || echo Nepavyko nuvykti i failai aplankala
copy "%lok%\intro.bat" || echo Nepavyko nukopijuoti failu lokacijoje: %lok%
copy "%lok%\menu.bat" || echo Nepavyko nukopijuoti failu lokacijoje: %lok%
copy "%lok%\bin\about.bat" || echo Nepavyko nukopijuoti failu lokacijoje: %lok%
copy "%lok%\bin\unistallt.bat" || echo Nepavyko nukopijuoti failu lokacijoje: %lok%
if NOT EXIST %temp%\mazasisvampyras\failai ( goto error )


:checka
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
    echo Pradedamas admin teisiu prasimas...
    echo Nesuteikus launcheris issijungs
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
if %inst% == "%programfiles%\MrEdgariux\MazasisVampyras" (
cd %programfiles% || goto error
mkdir MrEdgariux
cd MrEdgariux
mkdir MazasisVampyras
cd MazasisVampyras
mkdir bin
cd bin
copy 
)
if %inst% |== %programfiles%\MrEdgariux\MazasisVampyras (
  cd %inst%
  mkdir MrEdgariux
  cd MrEdgariux
  mkdir MazasisVampyras
  cd MazasisVampyras

)