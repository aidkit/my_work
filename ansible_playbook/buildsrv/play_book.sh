#!/bin/sh

echo $1
echo $2
echo $3


if [ -z "$1" ]; then
    echo "Required playbook file path argument"
fi

if [ -z "$2" ]; then
    echo "no tags argument"
    ansible-playbook $1 $3

else
    ansible-playbook $1 $3 --tags="$2"
fi



