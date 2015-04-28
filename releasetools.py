import common
import edify_generator

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
    
def InstallImage(img_name, img_file, partition, info):
  common.ZipWriteStr(info.output_zip, img_name, img_file)
  info.script.AppendExtra(('package_extract_file("' + img_name + '", "' + partition + '");'))

def InstallAboot(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/emmc_appsboot.mbn")
  info.script.Print("Writing aboot image...")
  InstallImage("emmc_appsboot.mbn", img_file, "/dev/block/platform/msm_sdcc.1/by-name/aboot", info)
  
def InstallModem(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/NON-HLOS.bin")
  info.script.Print("Writing modem image...")
  InstallImage("NON-HLOS.bin", img_file, "/dev/block/platform/msm_sdcc.1/by-name/modem", info)

def InstallSbl1(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/sbl1.mbn")
  info.script.Print("Writing sbl1 image...")
  InstallImage("sbl1.mbn", img_file, "/dev/block/platform/msm_sdcc.1/by-name/sbl1", info)

def InstallRpm(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/rpm.mbn")
  info.script.Print("Writing rpm image...")
  InstallImage("rpm.mbn", img_file, "/dev/block/platform/msm_sdcc.1/by-name/rpm", info)

def InstallTz(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/tz.mbn")
  info.script.Print("Writing tz image...")
  InstallImage("tz.mbn", img_file, "/dev/block/platform/msm_sdcc.1/by-name/tz", info)

def InstallStatic_nvbk(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/static_nvbk.bin")
  info.script.Print("Writing static_nvbk image...")
  InstallImage("static_nvbk.bin", img_file, "/dev/block/platform/msm_sdcc.1/by-name/oppostanvbk", info)

def InstallReserve4(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/reserve4.img")
  info.script.Print("Writing reserve4 image...")
  InstallImage("reserve4.img", img_file, "/dev/block/platform/msm_sdcc.1/by-name/reserve4", info)

def InstallLogo(info):
  img_file = info.input_zip.read("BOOTABLE_IMAGES/logo.bin")
  info.script.Print("Writing logo image...")
  InstallImage("logo.bin", img_file, "/dev/block/platform/msm_sdcc.1/by-name/LOGO", info)
	
def FullOTA_InstallEnd(info):
    RemoveDeviceGetprop(info)
    MountSystem(info)
    DeleteSystem(info)
    WritePolicyConfig(info)
    InstallAboot(info)
    InstallModem(info)
    InstallSbl1(info)
    InstallRpm(info)
    InstallTz(info)
    InstallStatic_nvbk(info)
    InstallReserve4(info)
    InstallLogo(info)

def IncrementalOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
    RemoveDeviceGetprop(info)
