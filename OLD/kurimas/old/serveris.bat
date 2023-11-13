@echo off
@ECHO [%time%] (Serveris) Paleista serveris.exe, vyksta failu tikrinimas... >> C:\Mazasisvampyras\log\%date%.txt
IF NOT EXIST C:\Mazasisvampyras\bin (
  CLS
  cd C:\Mazasisvampyras\log
  ECHO Programos failai netinkamai instaliuoti, butinas perinstaliavimas programos
  @ECHO [%time%] (Serveris) [Error] Not found bin folder >> C:\Mazasisvampyras\log\%date%.txt
  echo Klaidos kodas: nobinfile-1 
  @ECHO [%time%] (Serveris) [Error] Server start up crashed, error code: nobinfile-1 >> C:\Mazasisvampyras\log\%date%.txt
  GOTO:error
)
@ECHO [%time%] (Serveris) Mazasisvampyras\bin aplankalas surastas, vyksta kitas procesas >> C:\Mazasisvampyras\log\%date%.txt
IF NOT EXIST C:\Mazasisvampyras\bin\serveris (
  CLS
  ECHO Serverio aplankalas neveikia, arba jis pazeistas
  @ECHO [%time%] (Serveris) [Error] Server folder not found >> C:\Mazasisvampyras\log\%date%.txt
  echo Klaidos kodas: nofolderserver-1
  @ECHO [%time%] (Serveris) [Error] Error code: nofolderserver-1 >> C:\Mazasisvampyras\log\%date%.txt
  goto:error
)
@ECHO [%time%] (Serveris) Sistemoje visi reikalingi aplankalai yra, vyksta serverio paleidimas >> C:\Mazasisvampyras\log\%date%.txt
CD C:\Mazasisvampyras || GOTO:crash
@ECHO [%time%] (Serveris) Nuvykta į Mažasis vampyras aplankalą >> C:\Mazasisvampyras\log\%date%.txt
echo.
echo Paleidziamas serveris... (0%)
cd bin\serveris || GOTO:error
@ECHO [%time%] (Serveris) Nuvykta į bin\serveris >> C:\Mazasisvampyras\log\%date%.txt
@echo echo off >> server.bat
@echo IF NOT EXIST C:\Mazasisvampyras\bin\serveris\ip.txt ( >> server.bat
@echo cls >> server.bat
@echo ECHO Neisejo gautu serverio IP adreso >> server.bat
@echo echo Serverio paleidimas nepavyko, nepavyko prisijungti prie serverio >> server.bat
@echo pause >> server.bat
@echo ) >> server.bat
echo Paleidziamas serveris... (45%)
@echo echo Paleidziamas serveris >> server.bat
@echo cd C:\Mazasisvampyras\bin\serveris >> server.bat
@echo mkdir Fly >> server.bat
@echo echo Server not allowed to run them. >> server.bat
@echo rmdir Fly >> server.bat
@echo echo Prasome iseiti is cia. >> server.bat
@echo del server.bat >> server.bat
@ECHO [%time%] (Serveris) Sukurtas serverio paleidimo failas >> C:\Mazasisvampyras\log\%date%.txt
echo Paleidziamas serveris... (100%)
if NOT EXIST C:\Mazasisvampyras\bin\serveris\server.bat (
  CD C:\Mazasisvampyras\bin\log
  CLS
  ECHO Paleidimas uzstrigo, serverio failas nebuvo ikeltas
  @ECHO [%time%] (Serveris) [Error] Server file corrupted, or removed >> C:\Mazasisvampyras\log\%date%.txt
  echo Klaidos kodas: noserverfile-1
  @ECHO [%time%] (Serveris) [Error] Not found server, error code: noserverfile-1 >> C:\Mazasisvampyras\log\%date%.txt
  GOTO:error
)
goto:console

:console
@ECHO [%time%] (Serveris) Paleidžiamas serveris >> C:\Mazasisvampyras\log\%date%.txt
start server.bat
exit
:error
  ECHO.
  ECHO Atsiprasome, bet del tam tikru priezasciu nepavyko ikelti failo
  ECHO Prasome bandyti dar karta, jeigu klaida kartojasi, rasykite mums
  ECHO Visas log'as issaugotas C:\Mazasisvampyras\log
  ECHO.
  PAUSE >nul
  GOTO:EOF
:crash
title CRASH
@ECHO [%time%] (Serveris) [Error / Crash] Atsiprašome, bet jūsu mažasis vampyras versija yra nelegali >> C:\Mazasisvampyras\log\%date%.txt
echo.
echo Jus naudojate nulauzta versija, prasome uzregistruoti, kitaip serveris neveiks
echo.
pause
exit