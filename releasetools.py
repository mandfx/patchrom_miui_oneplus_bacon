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
    extra_img_flash = """ui_print("Wiping DDR");
ui_print("Please waiting, this will take some time");
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/rpm:190816:e9b687388fce68c0c6b7dc7e15845c15599f5b26")) != ""),ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/sbl1:280544:7ffe2dd004f1875ca04b2c4d2bb8f0d9952e55c2")) != ""),(ui_print("RPM+SBL Already up to date, not wiping DDR")),(wipe_block_device("/dev/block/platform/msm_sdcc.1/by-name/DDR", 32768))),(wipe_block_device("/dev/block/platform/msm_sdcc.1/by-name/DDR", 32768)));
ifelse(sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/DDR:32768:5188431849b4613152fd7bdba6a3ff0a4fd6424b")) != "",ui_print("Verified DDR wipe"),ui_print("DDR wipe failed or not performed"));
ui_print("Writing radio image...");
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/aboot:456124:608e59fd769d4eb02ee847bde3d210ff882ec870")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/aboot already up to date")),(package_extract_file("firmware-update/emmc_appsboot.mbn", "/dev/block/platform/msm_sdcc.1/by-name/aboot")));
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/rpm:190816:e9b687388fce68c0c6b7dc7e15845c15599f5b26")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/rpm already up to date")),(package_extract_file("firmware-update/rpm.mbn", "/dev/block/platform/msm_sdcc.1/by-name/rpm")));
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/LOGO:336384:aa8b5dae435685ef84128df9c381289e48da1d8f")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/LOGO already up to date")),(package_extract_file("firmware-update/logo.bin", "/dev/block/platform/msm_sdcc.1/by-name/LOGO")));
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/dbi:11712:44326b92314d447494728742db912cb7d96d5478")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/dbi already up to date")),(package_extract_file("firmware-update/sdi.mbn", "/dev/block/platform/msm_sdcc.1/by-name/dbi")));
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/tz:333656:05c2cf89fe3b860e61ac6b60b688ce522e4660c9")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/tz already up to date")),(package_extract_file("firmware-update/tz.mbn", "/dev/block/platform/msm_sdcc.1/by-name/tz")));
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/modem:58836480:4b3d04c97940bf44baab2b91a78ea151798f9b21")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/modem already up to date")),(package_extract_file("firmware-update/NON-HLOS.bin", "/dev/block/platform/msm_sdcc.1/by-name/modem")));
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/oppostanvbk:10485760:6ccb5652450dea3cef17c6b6a25bd7ec1c77bd0a")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/oppostanvbk already up to date")),(package_extract_file("firmware-update/static_nvbk.bin", "/dev/block/platform/msm_sdcc.1/by-name/oppostanvbk")));
ifelse((sha1_check(read_file("EMMC:/dev/block/platform/msm_sdcc.1/by-name/sbl1:280544:7ffe2dd004f1875ca04b2c4d2bb8f0d9952e55c2")) != ""),(ui_print("/dev/block/platform/msm_sdcc.1/by-name/sbl1 already up to date")),(package_extract_file("firmware-update/sbl1.mbn", "/dev/block/platform/msm_sdcc.1/by-name/sbl1")));"""
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
