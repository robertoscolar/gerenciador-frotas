@echo off
setlocal

set IMAGE_NAME=mcr.microsoft.com/mssql/server:2022-latest
set CONTAINER_NAME=gerenciador-frotas_sqlserver
set SQLSERVER_PORT=1433
set SA_PASSWORD=Test#123
set DATABASE_NAME=GerenciadorFrotas
set SCRIPT_DIR=.\sql\install\

:MENU
echo ----------------------------------------
echo Escolha uma opcao:
echo 1 - INSTALL
echo 2 - CLEAN
echo ----------------------------------------
set /p CHOICE=Escolha uma opcao: 

if "%CHOICE%"=="1" goto :INSTALL
if "%CHOICE%"=="2" goto :CLEAN

cls
goto :MENU


:INSTALL
echo Iniciando Docker Compose...
cd ..
docker-compose up -d
set exit_code=%errorlevel%

if %exit_code% neq 0 (
    echo O comando "docker-compose up" falhou com o codigo de saida %exit_code%.
    timeout /t 10
    exit /b %exit_code%
)

echo Iniciando SGBD...
timeout /t 15 /nobreak >nul

echo Criando/Recriando banco de dados %DATABASE_NAME%...
sqlcmd -S localhost,%SQLSERVER_PORT% -U SA -P %SA_PASSWORD% -Q "DROP DATABASE IF EXISTS [%DATABASE_NAME%]" >nul
sqlcmd -S localhost,%SQLSERVER_PORT% -U SA -P %SA_PASSWORD% -Q "CREATE DATABASE [%DATABASE_NAME%]"

echo Executando scripts de instalacao...
for %%f in (%SCRIPT_DIR%*.sql) do (
    echo Executando %%f...
    sqlcmd -S localhost,%SQLSERVER_PORT% -U SA -P %SA_PASSWORD% -d %DATABASE_NAME% -i %%f >nul
)

echo Processo finalizado!
timeout /t 5
goto :EOF


:CLEAN 
echo Parando e removendo o container do Docker...
docker-compose down

echo Processo finalizado!
timeout /t 5
goto :EOF