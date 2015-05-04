import common
import edify_generator
import os

def RemoveDeviceAssert(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "assert" in edify.script[i]:
      edify.script[i] = ''
      return

def RemoveDeviceGetprop(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "getprop" in edify.script[i]:
      edify.script[i] = ''
      return

def MountSystem(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "unmount(" in edify.script[i] and "/system" in edify.script[i]:
      edify.script[i] = 'mount("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/system", "/system");'
      return

def DeleteSystem(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "format(" in edify.script[i] and "/dev/block/platform/msm_sdcc.1/by-name/system" in edify.script[i]:
      edify.script[i] = 'delete_recursive("/system");'
      return

def WritePolicyConfig(info):
  try:
    file_contexts = info.input_zip.read("META/file_contexts")
    common.ZipWriteStr(info.output_zip, "file_contexts", file_contexts)
  except KeyError:
    print "warning: file_context missing from target;"
    
def InstallBased(info):
    for filename in os.listdir("other"):
        if not (filename.find('.mbn')==-1 and filename.find('.bin')==-1 and filename.find('reserve4')==-1):
            data=open(os.path.join(os.getcwd(),"other",filename)).read()
            common.ZipWriteStr(info.output_zip, filename, data)

    extra_img_flash = """ui_print("Writing aboot image...");
package_extract_file("emmc_appsboot.mbn", "/dev/block/platform/msm_sdcc.1/by-name/aboot");
ui_print("Writing modem image...");
package_extract_file("NON-HLOS.bin", "/dev/block/platform/msm_sdcc.1/by-name/modem");
ui_print("Writing sbl1 image...");
package_extract_file("sbl1.mbn", "/dev/block/platform/msm_sdcc.1/by-name/sbl1");
ui_print("Writing rpm image...");
package_extract_file("rpm.mbn", "/dev/block/platform/msm_sdcc.1/by-name/rpm");
ui_print("Writing tz image...");
package_extract_file("tz.mbn", "/dev/block/platform/msm_sdcc.1/by-name/tz");
ui_print("Writing static_nvbk image...");
package_extract_file("static_nvbk.bin", "/dev/block/platform/msm_sdcc.1/by-name/oppostanvbk");
ui_print("Writing logo image...");
package_extract_file("logo.bin", "/dev/block/platform/msm_sdcc.1/by-name/LOGO");
ui_print("Writing reserve4 image...");
package_extract_file("reserve4.img", "/dev/block/platform/msm_sdcc.1/by-name/reserve4");"""
    info.script.AppendExtra(extra_img_flash);
	
def FullOTA_InstallEnd(info):
    RemoveDeviceGetprop(info)
    MountSystem(info)
    DeleteSystem(info)
    WritePolicyConfig(info)
    InstallBased(info)

def IncrementalOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
    RemoveDeviceGetprop(info)
