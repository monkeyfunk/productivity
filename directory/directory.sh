#!/bin/bash

export MAX_DIRS=20
export MYDIRS=
IFS=$'\n'

mychangedir()
{
    if [ $# -eq 1 ]
	then 
	\cd "$1"

	length=${#MYDIRS[@]}
	oldHigh=$((length-1))
	newDir=`pwd`
	unset NEWDIRS
	NEWDIRS[0]="$newDir"
	newIdx=1
	for idx in `seq 0 $oldHigh`
	do
	    oldDir=${MYDIRS[$idx]}
	    if [ "$oldDir" != "$newDir" -a $newIdx -lt $MAX_DIRS ]
	    then
		NEWDIRS[newIdx]="$oldDir"
		newIdx=$((newIdx+1))
	    fi
	done

	MYDIRS=( ${NEWDIRS[@]} )
    fi
}

dirs()
{
    len=${#MYDIRS[@]} 
    high=$((len-1))
    for idx in `seq 0 $high`
    do
	echo $idx "${MYDIRS[$idx]}"
    done
}

go()
{
    mychangedir "${MYDIRS[$1]}"
}

bk()
{
    mychangedir "${MYDIRS[1]}"
}

