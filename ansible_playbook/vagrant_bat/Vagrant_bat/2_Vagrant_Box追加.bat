@echo off

REM ARGS_SAMPLE
REM c:\vagrant_wk\centos66
REM file:////10.161.131.158/TakusoF-WK/9000_Work/vagrant_box/centos-6.6-x86_64.box
REM centos66_base
REM 
REM C:\Temp\Vagrant\Vagrantfile


SETLOCAL enabledelayedexpansion

SET /p VAGRANT_WORKSPACE="��ƃf�B���N�g���p�X����͂��Ă��������B�F"
IF "%VAGRANT_WORKSPACE%"=="" (
	ECHO "�����͂ł��B�������I�����܂�"
	pause
	exit
)
echo.

SET /p BASE_BOX_PATHE="�g�p����BOX�̃p�X����͂��Ă��������B�F"
IF "%BASE_BOX_PATHE%"=="" (
	ECHO "�����͂ł��B�������I�����܂��B"
	pause
	exit
)
echo.

SET /p VM_BOX_NAME="BOX�̖��̂���͂��Ă��������B�F"
IF "%VM_BOX_NAME%"=="" (
	ECHO "�����͂ł��B�������I�����܂��B"
	pause
	exit
)
echo.

SET /p CUSTOM_FILES_PATH="Vagrant�J�X�^���t�@�C���֘A�i�[�̃p�X����͂��Ă��������B�F"
echo.



SET /p ANS="%VAGRANT_WORKSPACE%�Ɏw��BOX��ǉ����܂��B��낵���ł����H(y/n)�F"
IF "%ANS%"=="y" (
	CALL :VAGRANT_ADD_BOX %VAGRANT_WORKSPACE% %BASE_BOX_PATHE% %VM_BOX_NAME% %CUSTOM_FILES_PATH%
)

ECHO "�������I�����܂��B"

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
	ECHO "------�w��t�H���_���Ȃ��̂ō쐬���܂��B------"
	echo.
	ECHO "��ƃf�B���N�g���쐬"
	mkdir %VAGRANT_WORKSPACE%

)


cd /d %VAGRANT_WORKSPACE%

echo.
echo.
dir
echo.
echo.


ECHO "------BOX�ꗗ�\��------"
vagrant box list
echo.
echo.

ECHO "------BOX�ǉ�------"
vagrant box add %BOX_NAME% %BOX_PATH%
echo.
echo.

ECHO "------BOX�ꗗ�\��------"
vagrant box list
echo.
echo.


pause
