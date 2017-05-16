@echo off

REM ARGS_SAMPLE
REM c:\vagrant_wk\centos66
REM file:////10.161.131.158/TakusoF-WK/9000_Work/vagrant_box/centos-6.6-x86_64.box
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

SET /p BASE_BOX_PATHE="使用するBOXのパスを入力してください。："
IF "%BASE_BOX_PATHE%"=="" (
	ECHO "未入力です。処理を終了します。"
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

SET /p CUSTOM_FILES_PATH="Vagrantカスタムファイル関連格納のパスを入力してください。："
echo.



SET /p ANS="%VAGRANT_WORKSPACE%に指定BOXを追加します。よろしいですか？(y/n)："
IF "%ANS%"=="y" (
	CALL :VAGRANT_ADD_BOX %VAGRANT_WORKSPACE% %BASE_BOX_PATHE% %VM_BOX_NAME% %CUSTOM_FILES_PATH%
)

ECHO "処理を終了します。"

EXIT


:VAGRANT_ADD_BOX
SET VAGRANT_WORKSPACE=%1
SET BOX_PATH=%2
SET BOX_NAME=%3
SET CUSTOM_PATH=%4
echo.

echo arg1:%VAGRANT_WORKSPACE% arg2:%BOX_PATH% arg3:%BOX_NAME% arg4:%CUSTOM_PATH%

SETLOCAL enabledelayedexpansion

echo.
echo.

IF NOT EXIST "%VAGRANT_WORKSPACE%/" (
	ECHO "------指定フォルダがないので作成します。------"
	echo.
	ECHO "作業ディレクトリ作成"
	mkdir %VAGRANT_WORKSPACE%

)


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

ECHO "------BOX追加------"
vagrant box add %BOX_NAME% %BOX_PATH%
echo.
echo.

ECHO "------BOX一覧表示------"
vagrant box list
echo.
echo.


pause
