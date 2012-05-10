---

fruitstrap
==========
Install and debug iPhone apps without using Xcode. Designed to work on unjailbroken devices.

## Requirements

* Mac OS X. Tested on Snow Leopard only.
* You need to have a valid iPhone development certificate installed.
* Xcode must be installed, along with the SDK for your iOS version.

## Usage

`fruitstrap [-q/--quiet] [-t/--timeout timeout(seconds)] [-v/--verbose] <command> [<args>]`

Commands available:

* `install    [--id=device_id] --bundle=bundle.app [--debug] [--args=arguments]`:
  Install the specified app with optional arguments to the specified device, or all attached
  devices if none are specified.

* `uninstall  [--id=device_id] --bundle-id=<bundle id>`:
  Removed the specified bundle identifier (eg com.foo.MyApp) from the specified device, or
  all attached devices if none are specified.

* `upload     [--id=device_id] --bundle-id=<bundle id> --file=filename [--target=filename]`
  Uploads a file to the documents directory of the app specified with the bundle
  identifier (eg com.foo.MyApp) to the specified device, or all attached devices if
  none are specified.

* `list-files [--id=device_id] --bundle-id=<bundle id>`
  Lists the the files in the app-specific sandbox  specified with the bundle
  identifier (eg com.foo.MyApp) on the specified device, or all attached devices if
  none are specified.

* `list-devices`:
   List all attached devices.

## Demo

* The included demo.app represents the minimum required to get code running on iOS.
* `make install` will install demo.app to the device.
* `make debug` will install demo.app and launch a GDB session.

## Notes

* With some modifications, it may be possible to use this without Xcode installed; however, you would need a copy of the relevant DeveloperDiskImage.dmg (included with Xcode). GDB would also run slower as symbols would be downloaded from the device on-the-fly.
