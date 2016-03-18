
#  ~/installDylib.sh "wechatHook"  "/Users/linxiaobin/Library/Developer/Xcode/DerivedData/WeChatHook-fbifrxpxvhsoltdzljvpvwkmxylc/Build/Products/Release-iphoneos/wechatHook.app" false "backboardd" /tmp/com.apple.springboard.txt 

# ~/installDylib.sh "wechatHook" "/Users/linxiaobin/Library/Developer/Xcode/DerivedData/WeChatHook-fbifrxpxvhsoltdzljvpvwkmxylc/Build/Products/Release-iphoneos/wechatHook.app" false "WeChat"  "/var/mobile/Applications/FB58E99B-C4B2-43C0-B13E-FDD9F35A681E/tmp/com.tencent.xin.txt"



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
scp linxiaobin@172.17.170.65:$pathDylibSrc $pathDylibDest

if [[ $reloadPlist = true ]]; then
	echo "scp $pathPlistDest"
	rm $pathPlistDest
	scp linxiaobin@172.17.170.65:$pathPlistSrc $pathPlistDest
fi

killall $threadName

if [[ -n $removePath ]]; then
	echo "remove $removePath"
	rm $removePath
fi