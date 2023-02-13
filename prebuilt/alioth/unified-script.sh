#!/system/bin/sh
# set some props, depending on device

setdevicespecs() {
    resetprop "ro.product.name" "$1"
    resetprop "ro.build.product" "$1"
    resetprop "ro.vendor.product.device" "$1"
    resetprop "ro.system.product.device" "$1"
    resetprop "ro.system_ext.product.device" "$1"
    resetprop "ro.odm.product.device" "$1"
    resetprop "ro.product.device" "$1"
    resetprop "ro.product.product.device" "$1"
}

load_INDIA()
{
    resetprop "ro.product.model" "Mi 11X"
    resetprop "ro.product.odm.model" "Mi 11X"
    resetprop "ro.product.system.model" "Mi 11X"
    resetprop "ro.product.vendor.model" "Mi 11X"
    resetprop "ro.product.system_ext.model" "Mi 11X"
    resetprop "ro.product.product.model" "Mi 11X"
    resetprop "ro.product.brand" "Xiaomi"
    resetprop "ro.product.odm.brand" "Xiaomi"
    resetprop "ro.product.system.brand" "Xiaomi"
    resetprop "ro.product.system_ext.brand" "Xiaomi"
    resetprop "ro.product.product.brand" "Xiaomi"
    resetprop "ro.product.vendor.brand" "Xiaomi"
    setdevicespecs "aliothin"
}

load_CN()
{
    resetprop "ro.product.model" "Redmi K40"
    resetprop "ro.product.odm.model" "Redmi K40"
    resetprop "ro.product.system.model" "Redmi K40"
    resetprop "ro.product.vendor.model" "Redmi K40"
    resetprop "ro.product.system_ext.model" "Redmi K40"
    resetprop "ro.product.product.model" "Redmi K40"
    resetprop "ro.product.brand" "Xiaomi"
    resetprop "ro.product.odm.brand" "Xiaomi"
    resetprop "ro.product.system.brand" "Xiaomi"
    resetprop "ro.product.system_ext.brand" "Xiaomi"
    resetprop "ro.product.product.brand" "Xiaomi"
    resetprop "ro.product.vendor.brand" "Xiaomi"
    setdevicespecs "alioth"
}

load_global()
{
    resetprop "ro.product.model" "POCO F3"
    resetprop "ro.product.odm.model" "POCO F3"
    resetprop "ro.product.system.model" "POCO F3"
    resetprop "ro.product.vendor.model" "POCO F3"
    resetprop "ro.product.system_ext.model" "POCO F3"
    resetprop "ro.product.product.model" "POCO F3"
    resetprop "ro.product.brand" "POCO"
    resetprop "ro.product.odm.brand" "POCO"
    resetprop "ro.product.system.brand" "POCO"
    resetprop "ro.product.system_ext.brand" "POCO"
    resetprop "ro.product.product.brand" "POCO"
    resetprop "ro.product.vendor.brand" "POCO"
    setdevicespecs "alioth"
}

variant=$(getprop ro.boot.hwc)
echo $variant

case $variant in
    "INDIA")
        load_INDIA;
        ;;
    "CN")
        load_CN;
        ;;
    *)
        load_global;
        ;;
esac

exit 0
#
