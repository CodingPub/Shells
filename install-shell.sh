#! /bin/bash

# 安装脚本到/usr/bin目录

installShell() {
	shellPath=$1
	echo ">>>> begin install shell: $shellPath"

	if [[ -f $shellPath ]]; then

		fileName=`basename $shellPath`
		name=${fileName%.*}
		extend=${fileName#*.}

		if [[ "sh" = $extend ]]; then
			toPath="/usr/bin/$name"

			chmod +x  $shellPath
			sudo cp -f $shellPath $toPath
			echo "install" $shellPath "toPath: $toPath"
		else
			echo "$shellPath is not a shell ... "
		fi
	else
		echo "$shellPath is not a file ..."
	fi
}

scanDirectoryToInstall() {
	searchDir=$1
	echo " ====== search directory: $searchDir"

	if [[ ! -d $searchDir ]]; then
		echo "目录不存在: %searchDir"
		return
	fi

	for fromFile in $searchDir/*
	do
		installShell $fromFile
	done
}

echo 'begin install shell to /usr/bin ...'
declare workPath=$1
if [[ -z "$workPath" ]]; then
	workPath='.'
fi

if [[ -d "$workPath" ]]; then
	scanDirectoryToInstall $workPath 
else
	installShell $workPath 
fi

exit 0