#! /bin/bash

# git 快捷指令

cmd=$1
if [[ -z $cmd ]]; then
	cmd="-h"
fi

# show usage
usage(){
	if [[ $cmd == "" ]]; then
		echo
		echo
	else
	    echo -e "Usage: $0 [--save-user-info]"
	   	echo -e "	-h --help  display help info ."
	   	echo -e "	--save-user-info: save user info and password use osxkeychain"
	fi
	exit 1
}

if [[ -z $1 ]]; then
	usage
fi
for param in $*; do
	case $param in
        (-h|--help)
            usage
            ;;
    esac
done

if [[ $cmd == "-h" || $cmd == "--help" ]]; then
	usage
elif [[ $cmd == "--save-user-info" ]]; then
	git config --global credential.helper osxkeychain
fi
