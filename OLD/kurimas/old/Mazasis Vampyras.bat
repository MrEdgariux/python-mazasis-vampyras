goto start
@ECHO [%time%] (Mažasis Vampyras) [Info] Programos nustatymai nustatyti >> C:\Mazasisvampyras\log\%date%.txt

:start
@echo off
echo Tikrinamas aktyvacijos kodas...
@ECHO [%time%] (Mažasis Vampyras) [Info] Patvirtinamas registracijos kodas >> C:\Mazasisvampyras\log\%date%.txt
cls
echo.
echo Ka norite daryti?
echo Istrinti programa - A
echo Perziureti pakeitimu sarasa - B
echo Atidaryti serveri - C
echo Ijungti / isjungti programa - D
set /p progr=

if %progr% == A goto unistall
if %progr% == B goto changelog
if %progr% == C goto server
if %progr% == D goto startpro
cls
color 4
echo Procesas nerastas
@ECHO [%time%] (Mažasis Vampyras) [Info] Nerastas procesas >> C:\Mazasisvampyras\log\%date%.txt
goto start

:unistall
@ECHO [%time%] (Mažasis Vampyras) [Info] Ištrinama programa Mažasis Vampyras... >> C:\Mazasisvampyras\log\%date%.txt
cls
color 2
cd C:\MazasisVampyras
start unistall.exe || goto:error
exit

:server
@ECHO [%time%] (Mažasis Vampyras) [Info] Paleidžiamas serveris >> C:\Mazasisvampyras\log\%date%.txt
start server.exe || goto:error
exit

:startpro
@ECHO [%time%] (Mažasis Vampyras) [Info] Paleidžiamas paleidimu sarasas >> C:\Mazasisvampyras\log\%date%.txt
@ECHO [%time%] (Mažasis Vampyras) [Info] Įkeliamas failas bin/DNS/admin.txt >> C:\Mazasisvampyras\log\%date%.txt
@ECHO [%time%] (Mažasis Vampyras) [Info] Įkeliamas failas bin/DNS/servercon.txt >> C:\Mazasisvampyras\log\%date%.txt
@ECHO [%time%] (Mažasis Vampyras) [Info] Įkeliamas failas bin/DNS/sektorius.txt >> C:\Mazasisvampyras\log\%date%.txt
@ECHO 0.0.0.0 - A - 0.0.0.0>> C:\Mazasisvampyras\bin\dns\admin.dns
@ECHO 0.0.0.0 - A - 0.0.0.0>> C:\Mazasisvampyras\bin\dns\servercon.dns
@ECHO 0.0.0.0 - A - 0.0.0.0>> C:\Mazasisvampyras\bin\dns\sektorius.dns
if not exist C:\MazasisVampyras\bin\dns\admin.dns (
cls
@ECHO [%time%] (Mažasis Vampyras) [Error] Failas admin.dns neįsikėlė >> C:\Mazasisvampyras\log\%date%.txt
echo Failas admin.dns neisikele
goto:error
)
if not exist C:\MazasisVampyras\bin\dns\servercon.dns (
cls
@ECHO [%time%] (Mažasis Vampyras) [Error] Failas servercon.dns neįsikėlė >> C:\Mazasisvampyras\log\%date%.txt
echo Failas servercon.dns neisikele
goto:error
)
if not exist C:\MazasisVampyras\bin\dns\sektorius.dns (
cls
@ECHO [%time%] (Mažasis Vampyras) [Error] Failas sektorius.dns neįsikėlė >> C:\Mazasisvampyras\log\%date%.txt
echo Failas sektorius.dns neisikele
goto:error
)
cls
@ECHO [%time%] (Mažasis Vampyras) [Info] Failai įsikėlė, laukiamo proceso numerio >> C:\Mazasisvampyras\log\%date%.txt
echo Norint ijungti procesa reikia tureti koda
echo iveskite proceso numeri
set /p procnr=
if %procnr% == 12 goto adminstart
if %procnr% == 24 goto serverconstart
if %procnr% == 48 goto adminstart
echo Klaidingas proceso numeris
@ECHO [%time%] (Mažasis Vampyras) [Info] Įvestas klaidingas proceso numeris >> C:\Mazasisvampyras\log\%date%.txt
timeout 3
goto:startpro

:adminstart
cls
echo Iveskite koda
set /p adminstartc=
if %adminstartc% == 2556 goto adminchangedns
echo Kodas netinkamas, jus neturite leidimo
goto:start

:adminchangedns
@ECHO [%time%] (Mažasis Vampyras) [Info] Keičiami DNS adresai faile bin\DNS\admin.txt. >> C:\Mazasisvampyras\log\%date%.txt
del C:\Mazasisvampyras\bin\dns\admin.dns
@ECHO mredgariux.lt.,A,645.153.247.61> C:\Mazasisvampyras\bin\dns\admin.dns
if not exist C:\Mazasisvampyras\bin\dns\admin.dns (
cls
echo DNS atsakymas: Failed change DNS to mredgariux.lt admin, server not found
@ECHO [%time%] (Mažasis Vampyras) [Error] DNS adresai nepakeisti, serveris nerastas >> C:\Mazasisvampyras\log\%date%.txt
pause >nul
goto:start
)
echo DNS atsakymas: Successfully changed DNS to mredgariux.lt admin
@ECHO [%time%] (Mažasis Vampyras) [Info] DNS adresai pakeisti į mredgariux.lt admin komanda >> C:\Mazasisvampyras\log\%date%.txt
pause >nul
goto:start



:serverconstart


:sectorstart



goto:start

:error
cls
@ECHO [%time%] (Mažasis Vampyras) [Error] Failas nerastas >> C:\Mazasisvampyras\log\%date%.txt
echo.
echo Failas nerastas
echo Prasome bandyti dar karta, arba neteisinga lokacija failo
pause >nul
goto start

:changelog
@ECHO [%time%] (Mažasis Vampyras) [Info] Atidaromas pakeitimų sąrašas >> C:\Mazasisvampyras\log\%date%.txt
start changelog.txt || goto:error
exit