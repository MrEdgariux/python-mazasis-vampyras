@echo off
set beta= < bin\settings.set
color 6
echo --------------
echo.
echo Visos galimybes:
echo 1 - Perziureti kurinio informacija
echo 2 - Istrinti programele
echo 3 - Istrinti laikinuosiuos failus
echo.
echo ==========================
echo Visos BETA galimybes: NERA
echo ==========================
echo.
echo ==========================
echo Visos ALPHA galimybes: NERA
echo ==========================
echo.
echo Meniu pabaiga cia
echo.
echo --------------
set /p menu=Meniu skaicius: 

if %menu% == 1 start bin\about.bat
if %menu% == 2 start unistaller.bat
if %menu% == 3 start bin\unistallt.bat
cls
echo Toks neegzistuoka, eik nx
exit