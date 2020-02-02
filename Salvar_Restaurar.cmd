@echo off
mode con:cols=80 lines=50
title                /**********\Backup e Restaura‡Æo/***************\
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
echo                  ______________________________
echo                       [1] - BACKUP
echo                       [2] - RESTAURAR BACKUP
echo                       [3] - SAIR
echo.
rem variavel que pegar a opÃ§Ã£o digitada pelo usuario
set /p opc=ESCOLHA UMA OPCAO:

echo.


rem condi‡Æo de verifica‡Æo da op‡Æo escolhido pelo usuario
if %opc% == 1 goto BACKUP
if %opc% == 2 goto RESTAURAR
if %opc% == 3 goto SAIR
if %opc% GEQ 4 goto INICIO

rem linha de codigo que faz o backup 
:BACKUP
echo.
echo           EXEMPLO "C:, D:, E:"
set /p unidade=DIGITE A UNIDADE QUE ESTA OS DADOS:
rem entrando na para usuarios
%unidade%
cd \Users
dir
echo.
echo DIGITE ABAIXO O LOGIN DO USUARIO
echo.
rem variavel que pega o usuario que sera feito o backup
set /p user= USUARIO:
echo.
echo.
echo AO CRIAR A PASTA ONDE SERA FEITO O BACKUP NÇO UTILIZAR ESPA€O NO NOME DA PASTA
echo ______________________________________________________________________________
echo O DIRETORIO NÇO VAI PODER TER ESPA€O, POIS VAI DAR ERRO
echo ______________________________________________________________________________
echo DIGITE O DIRETORIO ONDE SERA SALVO OS DADOS DO USUARIO
echo.
rem variavel que armazena o diretorio onde sera salvo os dados do usuario
set /p local= DIRETORIO:
echo.
echo REALIZANDO O BACKUP DO COLABORADOR!
echo.
rem comando xcopy que salva os dados do usuario
xcopy %user% %local% /e /c
echo .
echo.
echo REALIZADO O BACKUP COM SUCESSO!!
pause
cls
goto INICIO

rem linha de codigo que faz a restauraÃ§Ã£o do backup do usuario
:RESTAURAR
echo.
echo           EXEMPLO "C:, D:, E:"
set /p unidade=DIGITE A UNIDADE QUE ESTA OS DADOS:
rem entrando na para usuarios
%unidade%
cd Users
dir
echo.
echo DIGITE ABAIXO O LOGIN DO USUARIO
echo.
rem variavel que pega o usuario que sera feito a restauraÃ§Ã£o do backup
set /p user= USUARIO:
echo.
echo.
echo AO CRIAR A PASTA ONDE SERA FEITO O BACKUP NÇO UTILIZAR ESPA€O NO NOME DA PASTA
echo ______________________________________________________________________________
echo O DIRETORIO NÇO VAI PODER TER ESPA€O, POIS VAI DAR ERRO
echo ______________________________________________________________________________
echo DIGITE O DIRETORIO ONDE SERA SALVO OS DADOS DO USUARIO
echo.
rem variavel que armazena o diretorio onde os dados do usuario esta salvo
set /p local= DIRETORIO:
echo.
echo REALIZANDO O BACKUP DO COLABORADOR!
echo.
rem comando xcopy que copia os dados salvos para o perfil do usuario
xcopy %local% %user%  /e /c /y
echo .
echo.
echo REALIZADO A RESTAURA€ÇO DO BACKUP COM SUCESSO!!
pause
cls
goto INICIO
rem Sai da aplica‡Æo
:SAIR
exit
