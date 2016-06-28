#! /bin/bash

# 批量移动srcPath目录下的文件，在desPath目录下创建同名目录，并修改源文件的名称为desFileName

# 源文件目录
declare srcPath=$1
# 目标目录
declare desPath=$2
# 目标文件名
declare desFileName=$3
# 生成目标子目录时，删除部分文件名称
declare deletePartFileName=$4


srcPath=${srcPath%/}
desPath=${desPath%/}

echo -e "\nsrcPath = $srcPath"
echo -e "desPath = $desPath\n"

echo -e "src files:\n"

declare fileName
declare extend
declare toPath

for fromFile in $srcPath/*
do

	fromFile=${fromFile//" "/'\ '}
	fromFile=${fromFile//"("/'\('}
	fromFile=${fromFile//")"/'\)'}

	if [ -f $fromFile ]
		then
		echo "fromFile = $fromFile"

		fileName=${fromFile#$srcPath}
		fileName=${fileName#/}

		extend=${fileName#*.}

		fileName=${fileName%.$extend}
		fileName=${fileName%$deletePartFileName}

		toPath="$desPath/$fileName"
		if [-f $toPath]
			then
			echo "$toPath is exist"
		else
			mkdir $toPath
			echo "$toPath is created"
		fi

		toPath="$desPath/$fileName/$desFileName"
		echo "toPath = $toPath"

		mv -f $fromFile $toPath

	else
		echo "fromFile = $fromFile not exist"
	fi
done

exit 0