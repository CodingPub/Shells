#!/bin/bash

# 还原Xcode编译后的png图片

mkdir OriginImages

for png in `find . -name '*.png'`
do
	name=`basename $png`
	/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/pngcrush -revert-iphone-optimizations $name OriginImages/$name
done