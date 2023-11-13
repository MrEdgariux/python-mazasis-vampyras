@echo off
@ECHO [%time%] (Registracija) Paleista registracija.exe >> C:\MazasisVampyras\log\%date%.txt
cd C:\
mkdir MazasisVampyras
cd MazasisVampyras
@ECHO [%time%] (Registracija) [Info] Pradedama registracija >> C:\MazasisVampyras\log\%date%.txt
IF NOT EXIST C:\Users\%username%\Desktop\failai\ (
  CLS
  ECHO Programos failai netinkamai instaliuoti, butinas perinstaliavimas programos
  echo Klaidos kodas: nofolderfile-1
  @ECHO [%time%] (Registracija) [Error] Application files not found >> C:\MazasisVampyras\log\%date%.txt
  GOTO:error
)
@ECHO [%time%] (Registracija) Patikra sekmingai praeita >> C:\MazasisVampyras\log\%date%.txt
echo Paleidziama Mazasis Vampyras programa
cls
echo Noredami pradeti, reikia ivesti licensijos rakta
echo Jis sudarytas xxxx-xxxx is 8 skaitmenu
set /p key=

if %key% == 2513-2739 goto successfully
if %key% == 2121-2121 goto successfully
if %key% == 6785-2135 goto successfully
cls
color 4
echo Jusu raktas netinkamas, prasome isigyti ji is musu svetaines
echo ar norite atidaryti pirkimo svetaine?
pause
start www.mredgariux.lt/
exit

:successfully
@ECHO [%time%]  (Registracija) Panaudotas licensijos raktas: %key% >> C:\Mazasisvampyras\log\%date%.txt
cls
cd C:\
cd MazasisVampyras
color 2
echo Ikeliama programos like failai...
@ECHO [%time%] (Registracija) Pradėta instaliacija >> C:\Mazasisvampyras\log\%date%.txt
copy "C:\Users\%username%\Desktop\failai\pamoka.html"
copy "C:\Users\%username%\Desktop\failai\Mazasis Vampyras.exe"
copy "C:\Users\%username%\Desktop\failai\unistall.exe"
copy "C:\Users\%username%\Desktop\failai\serveris.exe"
copy "C:\Users\%username%\Desktop\failai\pagalba.exe"
copy "C:\Users\%username%\Desktop\failai\parduotuve.exe"
copy "C:\Users\%username%\Desktop\failai\console.exe"
mkdir bin
cd bin
mkdir dns
mkdir serveris
cd ..
cls
echo.
@ECHO [%time%] (Registracija) Tikrinami failai, ar įsikėlė >> C:\Mazasisvampyras\log\%date%.txt
IF NOT EXIST C:\Mazasisvampyras\bin (
cls
echo Programa nesekmingai baige instaliacija
@ECHO [%time%] (Registracija) [Error] Program insuccessfull ended installiation >> C:\Mazasisvampyras\log\%date%.txt
goto:error
)
cd C:/Users\%username%\Desktop\failai
start setup.exe
echo Sekmingai visi failai instaliuoti
pause
exit

:error
echo Klaida ikeliant failus
@ECHO [%time%] (Registracija) [Error] Failų įkelime ivyko klaidą >> C:\Mazasisvampyras\log\%date%.txt
pause
exit

:failed
cls
echo Sita licensija uzblokuota
echo Prasome nusipirkti legalia licensija
@ECHO [%time%] (Registracija) [Error] Licensijos raktas užblokuotas >> C:\Mazasisvampyras\log\%date%.txt
cd C:\Users\%username%\Desktop\failai\
start unistall.bat
exit
