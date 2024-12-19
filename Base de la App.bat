@echo off
:menu
cls

echo Bienvenido a APP-Hub

echo 1- Tutorial
echo 2- Inicio
echo 3- Crear Acceso
echo 4- Hub
echo 5- Ejecutar

set /p choice="Selecciona una opcion: "
if "%choice%"=="1" goto tutorial
if "%choice%"=="2" goto inicio
if "%choice%"=="3" goto create_acc
if "%choice%"=="4" goto hub
if "%choice%"=="5" goto ejecutar

echo Opcion no valida. Intenta de nuevo.
pause
goto menu

:tutorial
cls

echo Bienvenido a APP-Hub
echo --------------------
echo =====================
echo Para usar esta app, necesitas saber lo siguiente:
echo Para moverte usaras los numeros o comandos pre-configurados en la app...
echo Usa el Enter para ir a la pestaña de inicio...
pause
goto menu

:inicio
cls

echo Estas en la pestaña: Inicio
echo -----------------------------
echo Cada ventana tiene su numero, envia su numero para viajar hacia ella...
echo 1- Tutorial
echo 2- Crear Acceso
echo 3- Hub
echo 4- Ejecutar

set /p inicio_opt="Selecciona una opcion: "
if "%inicio_opt%"=="1" goto tutorial
if "%inicio_opt%"=="2" goto create_acc
if "%inicio_opt%"=="3" goto hub
if "%inicio_opt%"=="4" goto ejecutar

echo Opcion no valida. Intenta de nuevo.
pause
goto inicio

:create_acc
cls

echo Estas en la pestaña: Crear Acceso
echo -----------------------------
echo Pon el nombre de la Aplicacion y luego su ubicacion exacta (con la extension).

set /p text_1="La Aplicacion se llama: "
set /p text_2="Su ubicacion exacta es: "

rem Crear acceso a la nueva app
if exist "%text_2%" (
    mkdir "C:\Program Files\APP-Hub\apps cargadas" 2>nul
    echo. > "C:\Program Files\APP-Hub\apps cargadas\%text_1%.bat"
    echo start "" "%text_2%" >> "C:\Program Files\APP-Hub\apps cargadas\%text_1%.bat"
    echo exit >> "C:\Program Files\APP-Hub\apps cargadas\%text_1%.bat"
    start "" "C:\Program Files\APP-Hub\aceptado.vbs"
) else (
    start "" "C:\Program Files\APP-Hub\rechazado.vbs"
)
pause
goto menu


:hub
cls

echo Estas en la pestaña: Hub
echo -----------------------------

setlocal enabledelayedexpansion
set count=3
for %%f in ("C:\Program Files\APP-Hub\apps cargadas\*.bat") do (
    set "file[!count!]=%%~nf"
    echo !count!- %%~nf
    set /a count+=1
)
endlocal
pause
goto menu

:ejecutar
cls

echo Estas en la pestaña: "Ejecutar"
echo -----------------------------
echo Escribe el nombre de la aplicacion que deseas ejecutar...

echo Las siguientes aplicaciones estan disponibles:
echo -----------------------------
rem Mostrar las aplicaciones en la carpeta "apps cargadas"
setlocal enabledelayedexpansion
for %%f in ("C:\Program Files\APP-Hub\apps cargadas\*.bat") do (
    echo %%~nxf
)
endlocal

rem Leer la aplicacion que el usuario desea ejecutar
set /p eje-1="Ejecutar la aplicacion: "

rem Verificar si la aplicacion existe y ejecutar
if exist "C:\Program Files\APP-Hub\apps cargadas\%eje-1%" (
    echo Ejecutando: %eje-1%
    start "" "C:\Program Files\APP-Hub\apps cargadas\%eje-1%"
    start "" "C:\Program Files\APP-Hub\exitoso.vbs"
) else (
    echo No se encontro la aplicacion: %eje-1%
    start "" "C:\Program Files\APP-Hub\erro2.vbs"
)

pause
goto menu
