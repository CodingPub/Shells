#! /bin/bash

# 安装脚本到/usr/bin目录

uninstallShell() {
	shellPath=$1
	echo ">>>> begin uninstall shell: $shellPath"

	if [[ -f $shellPath ]]; then

		fileName=`basename $shellPath`
		name=${fileName%.*}
		extend=${fileName#*.}

		if [[ "sh" = $extend ]]; then
			toPath="/usr/bin/$name"

			sudo rm $toPath
			echo "uninstall" $toPath
		else
			echo "$shellPath is not a shell ... "
		fi
	else
		echo "$shellPath is not a file ..."
	fi
}

scanDirectoryToUninstall() {
	searchDir=$1
	echo " ====== search directory: $searchDir"

	if [[ ! -d $searchDir ]]; then
		echo "目录不存在: %searchDir"
		return
	fi

	for fromFile in $searchDir/*
	do
		uninstallShell $fromFile
	done
}

echo 'begin install shell to /usr/bin ...'
declare workPath=$1
if [[ -z "$workPath" ]]; then
	workPath='.'
fi

if [[ -d "$workPath" ]]; then
	scanDirectoryToUninstall $workPath 
else
	uninstallShell $workPath 
fi

exit 0