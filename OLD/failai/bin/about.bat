@echo off
set versija=1.0.1
set uzema=1 KB
set beta=false
title %versija% - Apie programele
color 5
echo ==============
echo.
echo Programele vadinasi: Mazasis Vampyras
echo Programele uzema: %uzema%
echo Programeles versija: %versija%
echo.
echo ==============
if %beta% == true (
    echo Programele yra beta versijos, todel gali buti neikeltu funkciju.
    echo Noredami ikelti jas eikite i meniu ir pasirinkite is meniu Ikelti beta funkciju failus
)
echo Paspauskite betka kad sugrizti i pagrindini meniu
pause >nul
cd ..
start menu.bat