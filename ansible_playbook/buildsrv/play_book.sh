#!/bin/sh

echo $1
echo $2
echo $3


if [ -z "$1" ]; then
    echo "Required playbook file path argument"
fi

if [ -z "$3" ]; then
    echo "no tags argument"
    ansible-playbook $1 $2

else
    ansible-playbook $1 $2 --tags="$3"
fi



