#! /bin/bash

# 批量重命名srcPath目录下的文件，在原文件名后面增加appendName，去除原文件名中的deleteName

# 源文件目录
declare srcPath=$1
# 文件名后追加文本
declare appendName=$2
# 文件名去除文本
declare deleteName=$3


srcPath=${srcPath%/}

echo -e "\nsrcPath = $srcPath"
echo -e "\nappendName = $appendName"


declare fileName
declare extend
declare toPath
for fromFile in $srcPath/*
do

	fromFile=${fromFile//" "/'\ '}
	fromFile=${fromFile//"("/'\('}
	fromFile=${fromFile//")"/'\)'}

	echo "fromFile = $fromFile"

	fileName=${fromFile%$deleteName.*}
	extend=${fromFile#*.}

	toPath="$fileName$appendName.$extend"
	echo "toPath = $toPath"


	mv $fromFile $toPath
done

exit 0