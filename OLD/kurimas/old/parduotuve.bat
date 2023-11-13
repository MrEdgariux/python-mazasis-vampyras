@echo off
%pinigai% = 0
@ECHO [%time%] Atidaryta parduotuve.exe >> C:\Mazasisvampyras\log\%date%.txt
goto:goa
:goa
cls
echo Sveiki atvyke i parduotuve, noredami gauti pinigu eikite i darba ir uzsidirbkite bapkiu
echo.
echo Dirbti - A
echo Pirkti - B
echo Kodo pirkimas - C
echo Bankomatas - D
echo.
set /p store=

if %store% == A goto darbas
if %store% == a goto darbas
if %store% == B goto store
if %store% == b goto store
if %store% == C goto code
if %store% == c goto code
if %store% == D goto bank
if %store% == d goto bank

:darbas
@ECHO [%time%] (Parduotuve) Pasirinkta darbas >> C:\Mazasisvampyras\log\%date%.txt || echo You are hacked.
echo.
echo Norint uzsidirbti reikia ispresti uzduoti
echo.
echo Kai busite pasiruoses paspauskite betkoki miktuka
pause >nul
@ECHO [%time%] (Parduotuve) Pradedama skaiciavimas sistemos... >> C:\Mazasisvampyras\log\%date%.txt
%uzduotis% = Kiek bus 5 + 5?
cls
echo %uzduotis%
echo.
echo 12 - A
echo 14 - B
echo 10 - C
echo 8 - D
set /p uzduotis1

if %uzduotis1% == A goto failed
if %uzduotis1% == B goto failed
if %uzduotis1% == C goto next1 || goto:error
if %uzduotis1% == D goto failed
cls
color 4
goto:failed

:failed
echo.
echo Jusu ivestas atsakymas netinkamas, prasome bandyti dar karta
pause >nul
goto:darbas

:hacked
@ECHO [%time%] [Error] Game has been hacked. >> C:\Mazasisvampyras\log\%date%.txt
cls
color 1
echo Prasome nesukciauti!
timeout 10 /NOBREAK
echo Patvirtinama tapatybe
@ECHO [%time%] (Parduotuve) Patvirtinama žaidėjo tapatybė >> C:\Mazasisvampyras\log\%date%.txt
timeout 10 /NOBREAK
goto:goa

:store
@ECHO [%time%] (Parduotuve) Pasirinkta parduotuve >> C:\Mazasisvampyras\log\%date%.txt


:code
@ECHO [%time%] (Parduotuve) Pasirinkta kodas >> C:\Mazasisvampyras\log\%date%.txt


:bank
@ECHO [%time%] (Parduotuve) Pasirinkta bankomatas >> C:\Mazasisvampyras\log\%date%.txt
cls
echo.
echo Jus turite: %pinigai% $
echo.
echo Noredami iseiti paspauskite betkoki miktuka
pause >nul
goto goa

:error
cls
@ECHO [%time%] (Parduotuve) Klaidos zinute >> C:\Mazasisvampyras\log\%date%.txt
echo.
echo Zaidimas neveikia
exit