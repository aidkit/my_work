@echo off

cd %1

echo "指定VMの停止します。"
vagrant halt %1

cd ..
