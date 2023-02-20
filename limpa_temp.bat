@echo off
set projectPath=%~dp0
color 0a

:menu
cls
echo A     m     i     L     L     a     b     s
echo  / \   / \   / \   / \   / \   / \   / \   
echo ( A ) ( m ) ( i ) ( L ) ( L ) ( a ) ( b ) 
echo  \_/   \_/   \_/   \_/   \_/   \_/   \_/
echo Selecione a opcao desejada:
echo.
echo 1 - Limpar arquivos temporarios do projeto Delphi
echo 2 - Sair
echo.
set /p opcao=Digite a opcao desejada (1-2):

if "%opcao%"=="1" (
    echo Limpando arquivos temporarios...
    for /d /r "%projectPath%" %%i in (*) do (
        if exist "%%i\__history\" rmdir /s /q "%%i\__history\"
        if exist "%%i\__recovery\" rmdir /s /q "%%i\__recovery\"
        del /s /q "%%i\*.~"
        del /s /q "%%i\*.dcu"
    )
    echo Limpeza concluida!
    pause
    goto menu
) else if "%opcao%"=="2" (
    echo Saindo...
    exit
) else (
    echo Opcao invalida. Por favor, selecione novamente.
    pause
    goto menu
)
