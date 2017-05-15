@echo off

REM ARGS_SAMPLE
REM c:\vagrant_wk\centos66
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


SET /p VM_BOX_NAME="BOX�̖��̂���͂��Ă��������B�F"
IF "%VM_BOX_NAME%"=="" (
	ECHO "�����͂ł��B�������I�����܂��B"
	pause
	exit
)
echo.




SET /p ANS="%VAGRANT_WORKSPACE%�Ɏw��BOX���폜���܂��B��낵���ł����H(y/n)�F"
IF "%ANS%"=="y" (
	CALL :VAGRANT_DEL_BOX %VAGRANT_WORKSPACE% %VM_BOX_NAME%
)

ECHO "�������I�����܂��B"

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


ECHO "------BOX�ꗗ�\��------"
vagrant box list
echo.
echo.

ECHO "------BOX�폜------"
vagrant box remove %BOX_NAME%
echo.
echo.

ECHO "------BOX�ꗗ�\��------"
vagrant box list
echo.
echo.


pause
