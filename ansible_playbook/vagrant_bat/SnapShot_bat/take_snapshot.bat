@echo off

set time_tmp=%time: =0%
set now=%date:/=%%time_tmp:~0,2%%time_tmp:~3,2%%time_tmp:~6,2%
set memo=%2

SET SNAPSHOTNAME=%1_%memo%_%now%

cd %1

echo "指定VMのスナップショットリストを表示します。(実施前)"
vagrant snapshot list %1
echo "指定VMのスナップショットを作成します。"
vagrant snapshot take %1 %SNAPSHOTNAME%

echo "指定VMのスナップショットリストを表示します。(実施後)"
vagrant snapshot list %1

cd ..
