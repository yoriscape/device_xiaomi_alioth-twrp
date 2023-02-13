#!/sbin/sh
#
#	Enable/disable props for emulated storage; run this just before formatting /data
#	if you need to enable or disable emulated storage
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

MSG() {
	echo "I: $@" >> /tmp/recovery.log;
	echo "$@";
}

enable_it() {
	resetprop "external_storage.casefold.enabled" "1";
	resetprop "external_storage.projid.enabled" "1";
	resetprop "external_storage.sdcardfs.enabled" "0";
}

disable_it() {
	resetprop --delete "external_storage.casefold.enabled";
	resetprop --delete "external_storage.projid.enabled";
	resetprop --delete "external_storage.sdcardfs.enabled";
}

main() {
	MSG "Shell script for OrangeFox Recovery Project [$0]";
	MSG "Run this just before formatting /data if you need to enable/disable emulated storage";
	if [ "$1" = "on" ]; then
		MSG "Enabling emulate storage";
		enable_it;
	elif [ "$1" = "off" ]; then
		MSG "Disabling emulate storage";
		disable_it;
	else
		MSG "Syntax error";
		MSG "Syntax = $0 <'on'/'off'>";
	fi
}

main "$@";
exit 0;
