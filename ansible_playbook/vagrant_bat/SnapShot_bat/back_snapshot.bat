@echo off

cd %1

echo "直前のスナップショットに移行します。"
vagrant snapshot back %1

cd ..
