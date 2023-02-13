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

load_CN()
{
    resetprop "ro.product.model" "Redmi K40S"
    resetprop "ro.product.odm.model" "Redmi K40S"
    resetprop "ro.product.system.model" "Redmi K40S"
    resetprop "ro.product.vendor.model" "Redmi K40S"
    resetprop "ro.product.system_ext.model" "Redmi K40S"
    resetprop "ro.product.product.model" "Redmi K40S"
    resetprop "ro.product.brand" "Xiaomi"
    resetprop "ro.product.odm.brand" "Xiaomi"
    resetprop "ro.product.system.brand" "Xiaomi"
    resetprop "ro.product.system_ext.brand" "Xiaomi"
    resetprop "ro.product.product.brand" "Xiaomi"
    resetprop "ro.product.vendor.brand" "Xiaomi"
    setdevicespecs "munch"
}

load_global()
{
    resetprop "ro.product.model" "POCO F4"
    resetprop "ro.product.odm.model" "POCO F4"
    resetprop "ro.product.system.model" "POCO F4"
    resetprop "ro.product.vendor.model" "POCO F4"
    resetprop "ro.product.system_ext.model" "POCO F4"
    resetprop "ro.product.product.model" "POCO F4"
    resetprop "ro.product.brand" "POCO"
    resetprop "ro.product.odm.brand" "POCO"
    resetprop "ro.product.system.brand" "POCO"
    resetprop "ro.product.system_ext.brand" "POCO"
    resetprop "ro.product.product.brand" "POCO"
    resetprop "ro.product.vendor.brand" "POCO"
    setdevicespecs "munch"
}

variant=$(getprop ro.boot.hwc)
echo $variant

case $variant in
    "CN")
        load_CN;
        ;;
    *)
        load_global;
        ;;
esac

exit 0
#
