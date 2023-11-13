@echo off
@ECHO [%time%] (Ištrinimas) Paleista programa unistall.exe >> C:\Mazasisvampyras\log\%date%.txt
echo Ar jus esate tikri?
pause
taskkill /IM "Mazasis Vampyras.exe" || @ECHO [%time%] (Ištrinimas) Užduotis mažasis vampyras.exe nerasta >> C:\Mazasisvampyras\log\%date%.txt
cd C:\MazasisVampyras || goto:error
del "Mazasis Vampyras.exe"
@ECHO [%time%] (Ištrinimas) Ištrinama Mazasis Vampyras.exe >> C:\Mazasisvampyras\log\%date%.txt
cd bin || goto:error2
del /q *
@ECHO [%time%] (Ištrinimas) Ištrintas visas turinys iš bin aplankalo >> C:\Mazasisvampyras\log\%date%.txt
cd serveris || goto:error2
del /q *
@ECHO [%time%] (Ištrinimas) Ištrintas visas turinys iš serveris aplankalo >> C:\Mazasisvampyras\log\%date%.txt
cd ..
rmdir serveris
cd ..
rmdir bin || goto:error1
cd log
del /q *
cd ..
rmdir log || goto:error1
del registracija.exe
del pamoka.html
del serveris.exe
del parduotuve.exe
del pagalba.exe
del changelog.txt
del unistall.exe
del /q *
cd ..
rmdir MazasisVampyras || goto:error1
cls
color 2
if exist C:/MazasisVampyras goto:error3
echo Sekmingai visi failai buvo pasalinti
pause
exit

:error
cls
color 4
echo Klaida, nepavyko nuvykti i MazasisVampyras aplankala
echo Prasome isitikinti, kad aplankalas egzistuoja
@ECHO [%time%] (Ištrinimas) [Error] Nepavyko nukeliauti į Mazasisvampyras aplankalą >> C:\Mazasisvampyras\log\%date%.txt
pause
exit

:error1
cls
color 4
echo Klaida, nepavyko pasalinti aplankalo, susisiekite su administracija, kad atnaujintu faila, arba padetu jums
echo Taipogi, jus tai galite padaryti ranka :)
@ECHO [%time%] (Ištrinimas) [Error] Nepavyko ištrinti aplankalo >> C:\Mazasisvampyras\log\%date%.txt
pause
exit

:error2
cls
color 4
echo Klaida, nepavyko nuvykti i failo lokacija
@ECHO [%time%] (Ištrinimas) [Error] Nepavyko nuvykti į failo lokacija, failas neegzistuoja >> C:\Mazasisvampyras\log\%date%.txt
pause
exit

:error3
cls
color 4
echo Klaida, nepavyko istrinti visos programos...
pause
exit