#
# Makefile for Oneplus 1+
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_bacon.zip

# the location for local-ota to save target-file
local-previous-target-dir :=

# All apps from original ZIP, but has smali files chanded
local-modified-apps :=

local-modified-jars :=

# All apks from MIUI
local-miui-removed-apps :=

local-miui-modified-apps := miuisystem MiuiHome TeleService Settings SecurityCenter \
			MiuiSystemUI DeskClock Updater DownloadProvider

local-phone-apps :=

local-phone-priv-apps :=

local-density := XXHDPI

# The certificate for release version
local-certificate-dir := security

include phoneapps.mk

PORT_PRODUCT := bacon_xs

# To include the local targets before and after zip the final ZIP file,
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-pre-zip-misc
local-after-zip:= local-put-to-phone

# The local targets after the zip file is generated, could include 'zip2sd' to
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

local-pre-zip-misc:
		#rm stockrom fonts
		rm -rf $(ZIP_DIR)/system/fonts/*
		#copy files
		cp other/boot.img $(ZIP_DIR)/boot.img
		cp -a -rf other/system/* $(ZIP_DIR)/system/
		cp -a -rf other/data/* $(ZIP_DIR)/data/
		#edit build.prop
		echo "#XS ADD" >> $(ZIP_DIR)/system/build.prop
		#settings google version display
		sed -i 's/bacon-userdebug 4.4.4 KTU84Q 975abf16f0 test-keys/KTU84Q/g' $(ZIP_DIR)/system/build.prop
		#density
		sed -i 's/qemu.sf.lcd_density/persist.sys.density/g' $(ZIP_DIR)/system/lib/libsurfaceflinger.so
		echo "persist.sys.density=480" >> $(ZIP_DIR)/system/build.prop
		#sounds
		echo "persist.xs.power.sound=1" >> $(ZIP_DIR)/system/build.prop
		echo "persist.xs.screenshot.sound=1" >> $(ZIP_DIR)/system/build.prop
		echo "persist.camera.shutter.disable=0" >> $(ZIP_DIR)/system/build.prop
		#call audio
		echo "persist.audio.fluence.voicerec=false" >> $(ZIP_DIR)/system/build.prop
		echo "persist.audio.fluence.speaker=false" >> $(ZIP_DIR)/system/build.prop
		#change log
		echo "mijl.changelog.ftpPath=http://notes.imxs.me/miui_changelog/bacon/" >> $(ZIP_DIR)/system/build.prop
		#use auto brightadj
		echo "persist.power.useautobrightadj=true" >> $(ZIP_DIR)/system/build.prop
		#PowerKeeper and Whetstone
		echo "persist.sys.mcd_config_file=/system/etc/mcd_default.conf" >> $(ZIP_DIR)/system/build.prop
		echo "persist.sys.klo=on" >> $(ZIP_DIR)/system/build.prop
		#DATA APPLIST
		cat applist >> $(ZIP_DIR)/data/miui/cust/cn/customized_applist
		cat applist >> $(ZIP_DIR)/data/miui/cust/cn/ota_customized_applist
		#fix selinux
		sed -i '4asetenforce 0' $(ZIP_DIR)/system/bin/sysinit
		#bye bye miui bin , use stockrom
		rm -rf $(ZIP_DIR)/system/bin/app_process_vendor
		cp -rf stockrom/system/bin/app_process $(ZIP_DIR)/system/bin/app_process
		rm -rf $(ZIP_DIR)/system/bin/debuggerd_vendor
		cp -rf stockrom/system/bin/debuggerd $(ZIP_DIR)/system/bin/debuggerd
		rm -rf $(ZIP_DIR)/system/bin/dexopt_vendor
		cp -rf stockrom/system/bin/dexopt $(ZIP_DIR)/system/bin/dexopt
		#fix mdnsd
		-mv -f $(ZIP_DIR)/system/bin/mdnsd $(ZIP_DIR)/system/bin/mdnsd_vendor
