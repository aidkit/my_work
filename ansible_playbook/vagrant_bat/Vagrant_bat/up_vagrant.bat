@echo off

cd %1

echo "指定VMの%2起動します。"
vagrant up %1 %2

cd ..
