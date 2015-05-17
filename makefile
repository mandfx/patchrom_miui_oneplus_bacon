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

local-miui-modified-apps := MiuiFramework MiuiHome TeleService Settings SecurityCenter MiuiSystemUI DeskClock

local-phone-apps := 

local-phone-priv-apps := 

local-density := XXHDPI

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
		@echo "[XS CUST] boot.img"
		cp other/boot.img $(ZIP_DIR)/boot.img
		@echo "[XS CUST] system"
		cp -a -rf other/system/* $(ZIP_DIR)/system/
		@echo "[XS CUST] data"
		cp -a -rf other/data/* $(ZIP_DIR)/data/
		@echo "[XS CUST] replace libsurfaceflinger.so with dpi"
		sed -i 's/ro.sf.lcd_density/persist.xsdensity/g' $(ZIP_DIR)/system/lib/libsurfaceflinger.so
		@echo "[XS CUST] edit build.prop"
		sed -i 's/ro.product.manufacturer=OnePlus/ro.product.manufacturer=ONEPLUS/g' $(ZIP_DIR)/system/build.prop
		sed -i '/ro.sf.lcd_density=480/apersist.xsdensity=480' $(ZIP_DIR)/system/build.prop
		@echo "[XS CUST] goodbye! miui prebuilt binaries!"
		cp -rf stockrom/system/bin/app_process $(ZIP_DIR)/system/bin/app_process
		rm -rf $(ZIP_DIR)/system/bin/debuggerd_vendor
		cp -rf stockrom/system/bin/debuggerd $(ZIP_DIR)/system/bin/debuggerd
		rm -rf $(ZIP_DIR)/system/bin/dexopt_vendor
		cp -rf stockrom/system/bin/dexopt $(ZIP_DIR)/system/bin/dexopt
