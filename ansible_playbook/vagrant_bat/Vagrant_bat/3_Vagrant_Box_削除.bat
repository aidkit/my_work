@echo off

REM ARGS_SAMPLE
REM c:\vagrant_wk\centos66
REM centos66_base
REM 
REM C:\Temp\Vagrant\Vagrantfile


SETLOCAL enabledelayedexpansion

SET /p VAGRANT_WORKSPACE="作業ディレクトリパスを入力してください。："
IF "%VAGRANT_WORKSPACE%"=="" (
	ECHO "未入力です。処理を終了します"
	pause
	exit
)
echo.


SET /p VM_BOX_NAME="BOXの名称を入力してください。："
IF "%VM_BOX_NAME%"=="" (
	ECHO "未入力です。処理を終了します。"
	pause
	exit
)
echo.




SET /p ANS="%VAGRANT_WORKSPACE%に指定BOXを削除します。よろしいですか？(y/n)："
IF "%ANS%"=="y" (
	CALL :VAGRANT_DEL_BOX %VAGRANT_WORKSPACE% %VM_BOX_NAME%
)

ECHO "処理を終了します。"

EXIT


:VAGRANT_DEL_BOX
SET VAGRANT_WORKSPACE=%1
SET BOX_NAME=%2
SET CUSTOM_PATH=%3
echo.

echo arg1:%VAGRANT_WORKSPACE% arg2:%BOX_NAME% arg3:%CUSTOM_PATH% 

SETLOCAL enabledelayedexpansion

echo.
echo.


cd /d %VAGRANT_WORKSPACE%

echo.
echo.
dir
echo.
echo.


ECHO "------BOX一覧表示------"
vagrant box list
echo.
echo.

ECHO "------BOX削除------"
vagrant box remove %BOX_NAME%
echo.
echo.

ECHO "------BOX一覧表示------"
vagrant box list
echo.
echo.


pause
