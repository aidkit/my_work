@echo off
set basedir=%~dp0

REM ARGS_SAMPLE
REM c:\vagrant_wk\centos66
REM file:////10.161.131.158/TakusoF-WK/9000_Work/vagrant_box/centos-6.6-x86_64.box
REM centos66_base
REM 
REM C:\Temp\Vagrant\Vagrantfile


SETLOCAL enabledelayedexpansion

SET /p VAGRANT_WORKSPACE="作業ディレクトリルートパスを入力してください。："
IF "%VAGRANT_WORKSPACE%"=="" (
	ECHO "未入力です。処理を終了します"
	pause
	exit
)
echo.

SET /p VM_NODE_NAME="仮想ノード名称を入力してください。："
IF "%VM_NODE_NAME%"=="" (
	ECHO "未入力です。処理を終了します。"
	pause
	exit
)
echo.

SET /p BASE_BOX_PATHE="追加するBOXのパスを入力してください。(exp: file://パス)："
IF "%BASE_BOX_PATHE%"=="" (
	ECHO "未入力です。処理を終了します。"
	pause
	exit
)
echo.

ECHO "------BOX一覧表示------"
vagrant box list
echo.
echo.
	
SET /p VM_BOX_NAME="ノードに適用するBOXの名称を入力してください。："
IF "%VM_BOX_NAME%"=="" (
	ECHO "未入力です。処理を終了します。"
	pause
	exit
)
echo.

SET /p CUSTOM_FILES_PATH="適用するVagrantファイルがあれば、格納パスを入力してください。(exp: \\10.XX.XX.XX\xxxx\)："
echo.



SET /p ANS="%VAGRANT_WORKSPACE%に仮想環境を構築します。よろしいですか？(y/n)："
IF "%ANS%"=="y" (
	CALL :VAGRANT_INIT_MAKE %VAGRANT_WORKSPACE%\%VM_NODE_NAME% %BASE_BOX_PATHE% %VM_BOX_NAME% %CUSTOM_FILES_PATH% %VM_NODE_NAME%
)

ECHO "処理を終了します。"

EXIT


:VAGRANT_INIT_MAKE
SET VAGRANT_WORKSPACE=%1
SET BOX_PATH=%2
SET BOX_NAME=%3
SET CUSTOM_PATH=%4
SET NODE_NAME=%5
echo.

SET REPLACE_STR=_INPUT_VM_NAME
SET REPLACE_NODE_STR=_NODE_NAME

echo arg1:%VAGRANT_WORKSPACE% arg2:%BOX_PATH% arg3:%BOX_NAME% arg4:%CUSTOM_PATH%

SETLOCAL enabledelayedexpansion

echo.
echo.

IF NOT EXIST "%VAGRANT_WORKSPACE%/" (
	ECHO "------指定フォルダがないので作成します。------"
	echo.

	
	
) ELSE (
	ECHO "指定フォルダ%VAGRANT_WORKSPACE%があるので再作成します。"
	echo.

	ECHO "------指定フォルダがあるので再作成します。------"
	cd /d %VAGRANT_WORKSPACE%
	echo.

	
	ECHO "------全VM停止------"
	vagrant halt
	echo.
	echo.
	ECHO "------全VM破棄------"
	vagrant destroy
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
	
	IF Exist "%VAGRANT_WORKSPACE%" (
		cd /d C:\

		ECHO "------%VAGRANT_WORKSPACE%　配　下　削　除------"
		RD /s /q "%VAGRANT_WORKSPACE%"
	)
	echo.
	ECHO "！！！仮想環境削除のみの場合はここでCTRL+C！！！"
	pause
)



ECHO "作業ディレクトリ作成"
mkdir %VAGRANT_WORKSPACE%
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

ECHO "------VM初期化------"
vagrant init %BOX_NAME%
echo.
echo.


IF NOT "!CUSTOM_PATH!"=="" (
	ECHO "------Vagrantファイルコピー------"
	xcopy %CUSTOM_PATH%\* %VAGRANT_WORKSPACE%\ /Y /E
	echo.
	ECHO "------VagrantファイルVM名称置換------"
	copy  %VAGRANT_WORKSPACE%\Vagrantfile %VAGRANT_WORKSPACE%\Vagrantfile_old
	CALL %basedir%\Replace_FileStr.bat %VAGRANT_WORKSPACE%\Vagrantfile_old %VAGRANT_WORKSPACE%\Vagrantfile %REPLACE_STR% %BOX_NAME%
	echo.
	ECHO "------Vagrantファイルノード名称置換------"
	copy  %VAGRANT_WORKSPACE%\Vagrantfile %VAGRANT_WORKSPACE%\Vagrantfile_old
	CALL %basedir%\Replace_FileStr.bat %VAGRANT_WORKSPACE%\Vagrantfile_old %VAGRANT_WORKSPACE%\Vagrantfile %REPLACE_NODE_STR% %NODE_NAME%
	echo.
	
	
	IF EXIST "%VAGRANT_WORKSPACE%\ansible_local\hosts" ( 
		ECHO "------ansivle hosts ノード名称置換------"
		copy  %VAGRANT_WORKSPACE%\ansible_local\hosts %VAGRANT_WORKSPACE%\ansible_local\hosts_old
		CALL %basedir%\Replace_FileStr.bat %VAGRANT_WORKSPACE%\ansible_local\hosts_old %VAGRANT_WORKSPACE%\ansible_local\hosts %REPLACE_NODE_STR% %NODE_NAME%
	)
	IF EXIST "%VAGRANT_WORKSPACE%\ansible_local\host_vars\_NODE_NAME.yml" ( 
		ECHO "------ansivle host_vars\_NODE_NAME.yml ファイル名変更------"
		move  %VAGRANT_WORKSPACE%\ansible_local\host_vars\_NODE_NAME.yml %VAGRANT_WORKSPACE%\ansible_local\host_vars\%NODE_NAME%.yml
	)
)


ECHO "------------------------------------------------------------------------"
ECHO "-----  Vagrantファイル修正が必要な場合、修正後続行してください。--------"
ECHO "------------------------------------------------------------------------"
echo.
echo.
pause

ECHO "------全VM起動------"
vagrant up --provision
echo.
echo.

ECHO "------全VM状態表示------"
vagrant status

pause
