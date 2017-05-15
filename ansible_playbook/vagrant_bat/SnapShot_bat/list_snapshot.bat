@echo off

cd %1

echo "指定VMのスナップショットリストを表示します。"
vagrant snapshot list %1

cd ..
