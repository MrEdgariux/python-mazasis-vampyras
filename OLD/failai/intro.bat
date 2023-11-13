@echo off
echo Paleidimas pradedamas...
if NOT EXIST C:\Users\%username%\AppData\Local\Temp\mazasisvampyras (
mkdir C:\Users\%username%\AppData\Local\Temp\mazasisvampyras
goto loadc
)
:loadc
@echo [%date%] [Pinginama svetaine: localhost] >> C:\Users\%username%\AppData\Local\Temp\mazasisvampyras\ping.tmp
ping localhost >> C:\Users\%username%\AppData\Local\Temp\mazasisvampyras\ping.tmp
color 6
echo --------------
echo.
echo Sveikas atvykes %username%
echo Jus esate pradzios lange
echo.
echo --------------
echo Noredamas testi paspausk betkoki mygtuka...
pause >nul
cls
start menu.bat
exit