@echo off

cd %1

echo "�w��VM�̃X�i�b�v�V���b�g���X�g��\�����܂��B(���{�O)"
vagrant snapshot list %1
echo "�w��VM�̃X�i�b�v�V���b�g���폜���܂��B"
vagrant snapshot delete %1 %2
echo "�w��VM�̃X�i�b�v�V���b�g���X�g��\�����܂��B(���{��)"
vagrant snapshot list %1

cd ..
