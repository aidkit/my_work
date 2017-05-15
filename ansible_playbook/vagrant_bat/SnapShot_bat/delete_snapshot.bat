@echo off

cd %1

echo "指定VMのスナップショットリストを表示します。(実施前)"
vagrant snapshot list %1
echo "指定VMのスナップショットを削除します。"
vagrant snapshot delete %1 %2
echo "指定VMのスナップショットリストを表示します。(実施後)"
vagrant snapshot list %1

cd ..
