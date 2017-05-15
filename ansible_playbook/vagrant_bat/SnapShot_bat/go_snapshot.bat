@echo off

cd %1

echo "指定VMのスナップショットに移行します。"
vagrant snapshot go %1 %2

cd ..
