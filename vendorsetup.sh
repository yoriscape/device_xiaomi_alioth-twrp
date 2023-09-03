#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

#set -o xtrace
FDEVICE="mikona"
FDEVICE1="alioth"
FDEVICE2="munch"
FDEVICE3="thyme"
FDEVICE4="psyche"
THIS_DEVICE=${BASH_ARGV[2]}

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w \"$FDEVICE\")
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ "$THIS_DEVICE" = "alioth" -o "$THIS_DEVICE" = "munch" ]; then
	FDEVICE="$THIS_DEVICE"
	[ -z "$FOX_BUILD_DEVICE" ] && FOX_BUILD_DEVICE="$THIS_DEVICE"
fi

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" -a -z "$FDEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE1"  -o "$FOX_BUILD_DEVICE" = "$FDEVICE2" ]; then
	if [ -z "$THIS_DEVICE" ]; then
		echo "ERROR! This script requires bash. Run '/bin/bash' and build again."
		exit 1
	fi

        export FOX_VANILLA_BUILD=1
    	export FOX_ENABLE_APP_MANAGER=1
	export FOX_VIRTUAL_AB_DEVICE=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_NANO_EDITOR=1
    	export FOX_DELETE_AROMAFM=1
    	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"; # Sun 21 Mar 04:26:40 GMT 2021
	export OF_ENABLE_FS_COMPRESSION=1

    	# Device Specific Props
 	if [ "$FOX_BUILD_DEVICE" = "$FDEVICE2" -o  "$FDEVICE" = "$FDEVICE2" ]; then
    	   echo "Device is $FDEVICE2 ..."
 	else
    	   echo "Device is alioth ..."
	   export TARGET_DEVICE_ALT="aliothin"
 	fi

	# instruct magiskboot v24+ to always patch the vbmeta header when patching the recovery/boot image; do *not* remove!
        export FOX_PATCH_VBMETA_FLAG="1"

	# vendor_boot-as-recovery
	if [ "$FOX_VENDOR_BOOT_RECOVERY" = "1" ]; then
	   export FOX_RESET_SETTINGS="disabled"
	   export FOX_VARIANT="vBaR"
	   #export OF_USE_LZ4_COMPRESSION=1; # this can cause a bootloop in some ROMs, so don't use it
	fi
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
#
