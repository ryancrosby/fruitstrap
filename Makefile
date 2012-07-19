SDK_PATH=$(shell xcode-select -print-path)
IOS_CC = $(SDK_PATH)/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc

all: fruitstrap

fruitstrap: fruitstrap.c
	gcc -o fruitstrap -framework CoreFoundation -framework MobileDevice -F/System/Library/PrivateFrameworks fruitstrap.c

demo.app: demo Info.plist
	mkdir -p demo.app
	cp demo demo.app/
	cp Info.plist ResourceRules.plist demo.app/
	codesign -f -s "iPhone Developer" --entitlements Entitlements.plist demo.app

demo: demo.c
	$(IOS_CC) -arch armv7 -isysroot $(SDK_PATH)/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk -framework CoreFoundation -o demo demo.c

install-demo: all
	./fruitstrap install --bundle=demo.app

debug: all
	./fruitstrap -d demo.app

clean:
	rm -rf *.app demo fruitstrap
