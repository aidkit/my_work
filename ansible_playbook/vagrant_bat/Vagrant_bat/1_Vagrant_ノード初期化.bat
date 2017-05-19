@echo off
set basedir=%~dp0

REM ARGS_SAMPLE
REM c:\vagrant_wk\centos66
REM file:////10.161.131.158/TakusoF-WK/9000_Work/vagrant_box/centos-6.6-x86_64.box
REM centos66_base
REM 
REM C:\Temp\Vagrant\Vagrantfile


SETLOCAL enabledelayedexpansion

SET /p VAGRANT_WORKSPACE="��ƃf�B���N�g�����[�g�p�X����͂��Ă��������B�F"
IF "%VAGRANT_WORKSPACE%"=="" (
	ECHO "�����͂ł��B�������I�����܂�"
	pause
	exit
)
echo.

SET /p VM_NODE_NAME="�m�[�h�̖��̂���͂��Ă��������B�F"
IF "%VM_NODE_NAME%"=="" (
	ECHO "�����͂ł��B�������I�����܂��B"
	pause
	exit
)
echo.

REM SET /p BASE_BOX_PATHE="�g�p����BOX�̃p�X����͂��Ă��������B(exp: file://�p�X)�F"
REM IF "%BASE_BOX_PATHE%"=="" (
REM 	ECHO "�����͂ł��B�������I�����܂��B"
REM 	pause
REM 	exit
REM )
REM echo.

ECHO "------BOX�ꗗ�\��------"
vagrant box list
echo.
echo.
	
SET /p VM_BOX_NAME="BOX�̖��̂���͂��Ă��������B�F"
IF "%VM_BOX_NAME%"=="" (
	ECHO "�����͂ł��B�������I�����܂��B"
	pause
	exit
)
echo.

SET /p CUSTOM_FILES_PATH="Vagrant�J�X�^���t�@�C���֘A�i�[�̃p�X����͂��Ă��������B(exp: \\10.XX.XX.XX\xxxx\)�F"
echo.



SET /p ANS="%VAGRANT_WORKSPACE%�ɉ��z�����\�z���܂��B��낵���ł����H(y/n)�F"
IF "%ANS%"=="y" (
	CALL :VAGRANT_INIT_MAKE %VAGRANT_WORKSPACE%\%VM_NODE_NAME% %VM_BOX_NAME% %CUSTOM_FILES_PATH% %VM_NODE_NAME%
)

ECHO "�������I�����܂��B"

EXIT


:VAGRANT_INIT_MAKE
SET VAGRANT_WORKSPACE=%1
REM SET BOX_PATH=%2
SET BOX_NAME=%2
SET CUSTOM_PATH=%3
SET NODE_NAME=%4
echo.

SET REPLACE_STR=_INPUT_VM_NAME
SET REPLACE_NODE_STR=_NODE_NAME

echo arg1:%VAGRANT_WORKSPACE% arg2:%BOX_NAME% arg3:%CUSTOM_PATH% arg4:%NODE_NAME%

SETLOCAL enabledelayedexpansion

echo.
echo.

IF NOT EXIST "%VAGRANT_WORKSPACE%/" (
	ECHO "------�w��t�H���_���Ȃ��̂ō쐬���܂��B------"
	echo.

	
	
) ELSE (
	ECHO "�w��t�H���_%VAGRANT_WORKSPACE%������̂ōč쐬���܂��B"
	echo.

	ECHO "------�w��t�H���_������̂ōč쐬���܂��B------"
	cd /d %VAGRANT_WORKSPACE%
	echo.

	
	ECHO "------�SVM��~------"
	vagrant halt
	echo.
	echo.
	ECHO "------�SVM�j��------"
	vagrant destroy
	echo.
	echo.
REM 	ECHO "------BOX�폜------"
REM 	vagrant box remove %BOX_NAME%
REM 	echo.
REM 	echo.
	ECHO "------BOX�ꗗ�\��------"
	vagrant box list
	echo.
	echo.
	
	IF Exist "%VAGRANT_WORKSPACE%" (
		cd /d C:\

		ECHO "------%VAGRANT_WORKSPACE%�@�z�@���@��@��------"
		RD /s /q "%VAGRANT_WORKSPACE%"
	)
	echo.
	ECHO "�I�I�I���z���폜�݂̂̏ꍇ�͂�����CTRL+C�I�I�I"
	pause
)



ECHO "��ƃf�B���N�g���쐬"
mkdir %VAGRANT_WORKSPACE%
cd /d %VAGRANT_WORKSPACE%

echo.
echo.
dir
echo.
echo.


REM ECHO "------BOX�ꗗ�\��------"
REM vagrant box list
REM echo.
REM echo.

REM ECHO "------BOX�ǉ�------"
REM vagrant box add %BOX_NAME% %BOX_PATH%
REM echo.
REM echo.

ECHO "------BOX�ꗗ�\��------"
vagrant box list
echo.
echo.

ECHO "------VM������------"
vagrant init %BOX_NAME%
echo.
echo.


IF NOT "!CUSTOM_PATH!"=="" (
	ECHO "------Vagrant�t�@�C���R�s�[------"
	xcopy %CUSTOM_PATH%\* %VAGRANT_WORKSPACE%\ /Y /E
	echo.
	ECHO "------Vagrant�t�@�C��VM���̒u��------"
	copy  %VAGRANT_WORKSPACE%\Vagrantfile %VAGRANT_WORKSPACE%\Vagrantfile_old
	CALL %basedir%\Replace_FileStr.bat %VAGRANT_WORKSPACE%\Vagrantfile_old %VAGRANT_WORKSPACE%\Vagrantfile %REPLACE_STR% %BOX_NAME%
	echo.
	ECHO "------Vagrant�t�@�C���m�[�h���̒u��------"
	copy  %VAGRANT_WORKSPACE%\Vagrantfile %VAGRANT_WORKSPACE%\Vagrantfile_old
	CALL %basedir%\Replace_FileStr.bat %VAGRANT_WORKSPACE%\Vagrantfile_old %VAGRANT_WORKSPACE%\Vagrantfile %REPLACE_NODE_STR% %NODE_NAME%
	echo.
	
	
	IF EXIST "%VAGRANT_WORKSPACE%\ansible_local\hosts" ( 
		ECHO "------ansivle hosts �m�[�h���̒u��------"
		copy  %VAGRANT_WORKSPACE%\ansible_local\hosts %VAGRANT_WORKSPACE%\ansible_local\hosts_old
		CALL %basedir%\Replace_FileStr.bat %VAGRANT_WORKSPACE%\ansible_local\hosts_old %VAGRANT_WORKSPACE%\ansible_local\hosts %REPLACE_NODE_STR% %NODE_NAME%
	)
	IF EXIST "%VAGRANT_WORKSPACE%\ansible_local\host_vars\_NODE_NAME.yml" ( 
		ECHO "------ansivle host_vars\_NODE_NAME.yml �t�@�C�����ύX------"
		move  %VAGRANT_WORKSPACE%\ansible_local\host_vars\_NODE_NAME.yml %VAGRANT_WORKSPACE%\ansible_local\host_vars\%NODE_NAME%.yml
	)
)


ECHO "------------------------------------------------------------------------"
ECHO "-----  Vagrant�t�@�C���C�����K�v�ȏꍇ�A�C���㑱�s���Ă��������B--------"
ECHO "------------------------------------------------------------------------"
echo.
echo.
pause

ECHO "------�SVM�N��------"
vagrant up --provision
echo.
echo.

ECHO "------�SVM��ԕ\��------"
vagrant status

pause
