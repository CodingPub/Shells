## Mac

* install-shell

	> 安装脚本到 /user/bin 目录

* uninstall-shell

	> 从/usr/bin目录卸载脚本

* move-files
	
	> 批量移动 srcPath 目录下的文件到 desPath 目录对应子目录，并修改文件名称为 desFileName
	
	```
	# 源文件目录
	declare srcPath=$1
	# 目标目录
	declare desPath=$2
	# 目标文件名
	declare desFileName=$3
	# 生成目标子目录时，删除部分文件名称
	declare deletePartFileName=$4
	```
	
* rename-files

	> 批量重命名 srcPath 目录下的文件，在原文件名后面增加 appendName，去除原文件名中的 deleteName
	
	```
	# 源文件目录
	declare srcPath=$1
	# 文件名后追加文本
	declare appendName=$2
	# 文件名去除文本
	declare deleteName=$3
	```
	
* revert-built-PNG
	
	> 还原 Xcode 编译后的png图片