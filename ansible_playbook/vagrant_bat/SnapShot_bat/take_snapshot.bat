@echo off

set time_tmp=%time: =0%
set now=%date:/=%%time_tmp:~0,2%%time_tmp:~3,2%%time_tmp:~6,2%
set memo=%2

SET SNAPSHOTNAME=%1_%memo%_%now%

cd %1

echo "�w��VM�̃X�i�b�v�V���b�g���X�g��\�����܂��B(���{�O)"
vagrant snapshot list %1
echo "�w��VM�̃X�i�b�v�V���b�g���쐬���܂��B"
vagrant snapshot take %1 %SNAPSHOTNAME%

echo "�w��VM�̃X�i�b�v�V���b�g���X�g��\�����܂��B(���{��)"
vagrant snapshot list %1

cd ..
