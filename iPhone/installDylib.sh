
#  ~/installDylib.sh "FLWeChatHongBao"  /Users/linxiaobin/Library/Developer/Xcode/DerivedData/WeChatHook-gajfmzavqxcmjjfqvoctsuyislic/Build/Products/Release-iphoneos/FLWeChatHongBao.app  false "backboardd" /tmp/com.apple.springboard.txt 

# ~/installDylib.sh "FLWeChatHongBao"  /Users/linxiaobin/Library/Developer/Xcode/DerivedData/WeChatHook-gajfmzavqxcmjjfqvoctsuyislic/Build/Products/Release-iphoneos/FLWeChatHongBao.app  false "WeChat"  "/var/mobile/Applications/FB58E99B-C4B2-43C0-B13E-FDD9F35A681E/tmp/com.tencent.xin.txt"

# ~/installDylib.sh "XSysInfoHook" /Users/linxiaobin/Library/Developer/Xcode/DerivedData/XSysInfoHook-cstxmkwszmlmvmaxsddbfeclkgkb/Build/Products/Release-iphoneos/XSysInfoHook.app false "XSysInfo"

name=$1
dirSource=$2
pathDylibSrc=$dirSource"/$name"
pathPlistSrc=$dirSource"/$name.plist"
reloadPlist=$3
threadName=$4
removePath=$5

dirDynamicLibraries="/Library/MobileSubstrate/DynamicLibraries"
pathDylibDest=$dirDynamicLibraries"/$name.dylib"
pathPlistDest=$dirDynamicLibraries"/$name.plist"

echo "scp $pathDylibDest"
rm $pathDylibDest
scp linxiaobin@192.168.5.86:$pathDylibSrc $pathDylibDest

if [[ $reloadPlist = true ]]; then
	echo "scp $pathPlistDest"
	rm $pathPlistDest
	scp linxiaobin@192.168.5.86:$pathPlistSrc $pathPlistDest
fi

killall $threadName

if [[ -n $removePath ]]; then
	echo "remove $removePath"
	rm $removePath
fi