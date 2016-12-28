import common
import edify_generator
import os

def RemoveDeviceAssert(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if "ro.product" in edify.script[i]:
            edify.script[i] = ''
            return

def InstallBased(info):
    for filename in os.listdir("other/firmware-update"):
        if not (filename.find('.mbn')==-1 and filename.find('.bin')==-1):
            data=open(os.path.join(os.getcwd(),"other/firmware-update",filename)).read()
            common.ZipWriteStr(info.output_zip, "firmware-update/" + filename, data)
    extra_img_flash = """ui_print("Writing aboot image...");
package_extract_file("firmware-update/emmc_appsboot.mbn", "/dev/block/platform/msm_sdcc.1/by-name/aboot");
ui_print("Writing modem image...");
package_extract_file("firmware-update/NON-HLOS.bin", "/dev/block/platform/msm_sdcc.1/by-name/modem");
ui_print("Writing sbl1 image...");
package_extract_file("firmware-update/sbl1.mbn", "/dev/block/platform/msm_sdcc.1/by-name/sbl1");
ui_print("Writing dbi image...");
package_extract_file("firmware-update/sdi.mbn", "/dev/block/platform/msm_sdcc.1/by-name/dbi");
ui_print("Writing rpm image...");
package_extract_file("firmware-update/rpm.mbn", "/dev/block/platform/msm_sdcc.1/by-name/rpm");
ui_print("Writing tz image...");
package_extract_file("firmware-update/tz.mbn", "/dev/block/platform/msm_sdcc.1/by-name/tz");
ui_print("Writing static_nvbk image...");
package_extract_file("firmware-update/static_nvbk.bin", "/dev/block/platform/msm_sdcc.1/by-name/oppostanvbk");
ui_print("Writing logo image...");
package_extract_file("firmware-update/logo.bin", "/dev/block/platform/msm_sdcc.1/by-name/LOGO");"""
    info.script.AppendExtra(extra_img_flash);

def InstallRecovery(info):
    for filename in os.listdir("other"):
        if not (filename.find('.img')==-1):
            data=open(os.path.join(os.getcwd(),"other",filename)).read()
            common.ZipWriteStr(info.output_zip, filename, data)
    extra_img_flash = """ui_print("Writing twrp recovery image...");
package_extract_file("recovery.img", "/dev/block/platform/msm_sdcc.1/by-name/recovery");"""
    info.script.AppendExtra(extra_img_flash);

def FullOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
    InstallBased(info)
    InstallRecovery(info)

def IncrementalOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
