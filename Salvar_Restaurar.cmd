@echo off
mode con:cols=80 lines=50
title                /**********\Backup e Restauracao/***************\
color A
:INICIO
cls
echo.
echo                        [DATA: %DATE%  HORA: %TIME%]
echo.
echo              ------------------------------------------------------
echo              [HOSTNAME: %COMPUTERNAME%  USUARIO LOGADO: %USERNAME%]
echo              ------------------------------------------------------
rem AUTOR EDILSON RODRIGUES DOS DANTOS
echo.
echo                  **********************************************
echo                  *  PROGRAMA PARA REALIZAR BACKUP DO USUARIO  *
echo                  **********************************************
echo.
echo.
echo                  ______________________________________________
echo.
echo                              [1] - BACKUP
echo                              [2] - RESTAURAR BACKUP
echo                              [3] - BACKUP DRIVERS WINDOWS 10
echo                              [4] - SAIR
echo.                 ______________________________________________
echo.
echo.
rem variavel que pegar a opção digitada pelo usuario
set /p opc=                    ESCOLHA UMA OPCAO:
cls
if %opc% == 1 goto BACKUP
if %opc% == 2 goto RESTAURAR
if %opc% == 3 goto DRIVER
if %opc% == 4 goto SAIR
if %opc% GEQ 5 goto INICIO

rem linha de codigo que faz o backup 
:BACKUP
echo.
echo.
echo       ********  DIGITE O LOGIN DO USUARIO QUE SERA FEITO O BACKUP  ********
echo.
echo.
echo ________________________________________________________________________________
%HomeDrive%
cd \Users
dir

echo.
echo ________________________________________________________________________________
echo.
set /p user=------------  LOGIN DO USUARIO:

cls
echo.
echo.
echo.
echo         ****** ABAIXO ESTA AS UNIDADE DE DISCO EXISTENTE NO MICRO *******
echo.
echo.
echo ________________________________________________________________________________
echo.
C:\Windows\System32\diskpart.exe /s C:\BackupRestauracao\diskp.txt
echo        ****** SELECIONE A UNIDADE ONDE SERA SALVO O BACKUP DO USUARO  ******
echo.
echo                       [1] - D:
echo                       [2] - E:
echo                       [3] - F:
echo                       [4] - G:
echo                       [5] - SAIR
echo.
echo.
echo ________________________________________________________________________________
%HomeDrive%
echo.
set /p opcDestino=------------    DESTINO:
cls
echo.
echo.
echo.
echo              BACKUP INICIALIZADO
if %opcDestino% == 1 goto Destino1
if %opcDestino% == 2 goto Destino2
if %opcDestino% == 3 goto Destino3
if %opcDestino% == 4 goto Destino4
if %opcDestino% == 5 goto SAIR

:Destino1
echo.
d:
md users
cd users
mkdir %user%
xcopy %HomeDrive%\Users\%user% %user% /e /c
echo FIM BACKUP
echo .
echo.
echo @@@@@@@@@@@@@ REALIZADO O BACKUP COM SUCESSO!! @@@@@@@@@@@@@@@@@@@
pause
cls
echo.
echo.
echo        ################ INICIANDO O BACKUP DOS DRIVERS #####################
cd BKP-%user%
md BKP-DRIVERS
cd BKP-DRIVERS
Dism.exe /online /export-driver /destination:d:\BACKUP-USERS\BKP-DRIVERS
echo.
echo.
echo @@@@@@@@@ BACKUP DOS DRIVERS REALIZADO COM SUCESSO @@@@@@@@@@@
pause
%HomeDrive%
goto INICIO
:Destino2
e:
md users
cd users
mkdir %user%
xcopy %HomeDrive%\Users\%user% %user% /e /c
echo FIM BACKUP
echo .
echo.
echo @@@@@@@@@@@@@@@@@@@@@ REALIZADO O BACKUP COM SUCESSO!! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
pause
cls
echo.
echo.
echo        ################ INICIANDO O BACKUP DOS DRIVERS #####################
cd BKP-%user%
md BKP-DRIVERS
cd BKP-DRIVERS
Dism.exe /online /export-driver /destination:e:\BACKUP-USERS\BKP-DRIVERS
echo.
echo.
echo @@@@@@@@@@@@@@@@@@ BACKUP DOS DRIVERS REALIZADO COM SUCESSO @@@@@@@@@@@@@@@@@@@@@@@@@
%HomeDrive%
goto INICIO

:Destino3
f:
md users
cd users
mkdir %user%
xcopy %HomeDrive%\Users\%user% %user% /e /c
echo FIM BACKUP
echo .
echo.
echo @@@@@@@@@@@@@@@@@@@@@ REALIZADO O BACKUP COM SUCESSO!! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
pause
cls
echo.
echo.
echo        ################ INICIANDO O BACKUP DOS DRIVERS #####################
cd BKP-%user%
md BKP-DRIVERS
cd BKP-DRIVERS
Dism.exe /online /export-driver /destination:f:\BACKUP-USERS\BKP-DRIVERS
echo.
echo.
echo @@@@@@@@@@@@@@@@@@ BACKUP DOS DRIVERS REALIZADO COM SUCESSO @@@@@@@@@@@@@@@@@@@@@@@@@
%HomeDrive%
goto INICIO

:Destino4
g:
md users
cd users
mkdir %user%
xcopy %HomeDrive%\Users\%user% %user% /e /c
echo FIM BACKUP
echo .
echo.
echo @@@@@@@@@@@@@@@@@@@@@ REALIZADO O BACKUP COM SUCESSO!! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
pause
cls
echo.
echo.
echo        ################ INICIANDO O BACKUP DOS DRIVERS #####################
cd BKP-%user%
md BKP-DRIVERS
cd BKP-DRIVERS
Dism.exe /online /export-driver /destination:f:\BACKUP-USERS\BKP-DRIVERS
echo.
echo.
echo @@@@@@@@@@@@@@@@@@ BACKUP DOS DRIVERS REALIZADO COM SUCESSO @@@@@@@@@@@@@@@@@@@@@@@@@
%HomeDrive%
goto INICIO


rem linha de codigo que faz a restauração do backup do usuario



:RESTAURAR
echo.
echo.
c:
cd \Users
dir
echo.
set /p user=------------  LOGIN DO USUARIO:
cls
rem entrando na para usuarios
diskpart /s C:\BackupRestauracao\diskp.txt
echo.
echo         ****** SELECIONE A UNIDADE ONDE ESTA O BACKUP DO USUARIO  ******
echo.
echo                       [1] - D:
echo                       [2] - E:
echo                       [3] - G:
echo                       [4] - SAIR

set /p opcOrigem=BKP_Origem:

cls
if %opcOrigem% == 1 goto Origem
if %opcOrigem% == 3 goto SAIR
if %opcOrigem% GEQ 4 goto INICIO

:Origem
d:
cd \Users
pause
echo.
echo.
echo.
xcopy %user% %HomeDrive%\Users\%user% /e /c /y
echo .
echo.
pause
cls
goto INICIO
rem Sai da aplicação
:SAIR
exit


rem Realizar backup de drivers do Windows 10
:DRIVER
diskpart /s C:\BackupRestauracao\diskp.txt
echo.
echo         ****** SELECIONE A UNIDADE ONDE SERA SALVO O BACKUP DOS DRIVERS  ******         
echo.
echo                       [1] - D:
echo                       [2] - E:
echo                       [3] - G:
echo                       [4] - SAIR
echo.
echo.
set /p unidade=Digite a unidade onde sera salvo os Drivers:
echo. 
echo.
if %unidade% == 1 goto UNIDADE_D
if %unidade% == 2 goto UNIDADE_E
if %unidade% == 3 goto UNIDADE_G
if %unidade% == 4 goto SAIR
if %unidade% GEQ 4 goto INICIO
echo.
echo.
:UNIDADE_D
d:
echo        ################ INICIANDO O BACKUP DOS DRIVERS #####################
cd BKP-%user%
md BKP-DRIVERS
cd BKP-DRIVERS
Dism.exe /online /export-driver /destination:d:\BACKUP-USERS\BKP-DRIVERS
echo.
echo.
echo @@@@@@@@@@@@@@@@@@ BACKUP DOS DRIVERS REALIZADO COM SUCESSO @@@@@@@@@@@@@@@@@@@@@@@@@
echo.
echo.
:UNIDADE_E
e:
echo        ################ INICIANDO O BACKUP DOS DRIVERS #####################
cd BKP-%user%
md BKP-DRIVERS
cd BKP-DRIVERS
Dism.exe /online /export-driver /destination:d:\BACKUP-USERS\BKP-DRIVERS
echo.
echo.
echo @@@@@@@@@@@@@@@@@@ BACKUP DOS DRIVERS REALIZADO COM SUCESSO @@@@@@@@@@@@@@@@@@@@@@@@@
echo.
echo.
:UNIDADE_G
g:
echo        ################ INICIANDO O BACKUP DOS DRIVERS #####################
cd BKP-%user%
md BKP-DRIVERS
cd BKP-DRIVERS
Dism.exe /online /export-driver /destination:d:\BACKUP-USERS\BKP-DRIVERS
echo.
echo.
echo @@@@@@@@@@@@@@@@@@ BACKUP DOS DRIVERS REALIZADO COM SUCESSO @@@@@@@@@@@@@@@@@@@@@@@@@
echo.
echo.
