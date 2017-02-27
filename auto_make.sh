#!/bin/zsh
#
#sh for miui patchrom
HISTORY_PACKAGE=history_package

function EchoGreenColorMessage() {
    echo -e "\e[1;32m${1}\e[0m"
}

function EchoRedColorMessage() {
    echo -e "\e[1;31m${1}\e[0m"
}

function BUILD_DATE() {
    date=`date +%y%m%d`
    year="${date:1:1}"
    month="${date:2:2}"
    days="${date:4:2}"
    #if month
    if [ $month -lt "10" ];then
        month=$(echo $month | sed 's/0//g')
    fi
    #if days
    if [ $days -lt "10" ];then
        days=$(echo $days | sed 's/0//g')
    fi
    BUILD_NUMBER=$year.$month.$days
}

function MakeFullota() {
    EchoGreenColorMessage "Environment"
    cd ..
    source build/envsetup.sh
    cd -
    EchoGreenColorMessage "Do you want to make fullota? （y/n）"
    read arg
    case $arg in
    	Y|y|YES|yes)
            EchoGreenColorMessage "Clean"
    	    make clean
            find . -name ".DS_Store" | xargs rm -rf
			rm -rf zi*
            EchoGreenColorMessage "Fullota, Version is $BUILD_NUMBER"
            make fullota BUILD_NUMBER=$BUILD_NUMBER;;
        N|n|NO|no)
            EchoRedColorMessage "Warning:Not Make Fullota!!!";;
    esac
}

function CopyFullota() {
    if [ ! -d $HISTORY_PACKAGE ];then 
        mkdir $HISTORY_PACKAGE
    fi
    if [ -f out/fullota.zip ]; then
        EchoGreenColorMessage "Copy Fullota"
        mv -f out/fullota.zip $HISTORY_PACKAGE/$BUILD_NUMBER-fullota.zip
        mv -f out/target_files.zip $HISTORY_PACKAGE/$BUILD_NUMBER-target.zip
        rm -rf $HISTORY_PACKAGE/$BUILD_NUMBER-out
        rm -rf out/*-tozip
        rm -rf out/*.apk
        rm -rf out/*.zip
        rm -rf out/*.jar
		rm -rf out/sed*
        rm -rf out/target_files
        mv -f out $HISTORY_PACKAGE/$BUILD_NUMBER-out
        make clean
    else
        EchoRedColorMessage "Warning:Not Found Fullota!!"
    fi
}

function AddReserve() {
    EchoGreenColorMessage "Do you want to add reserve to fullota? (y/n)"
    read arg
    case $arg in
        Y|y|YES|yes)
            EchoGreenColorMessage "add reserve to fullota"
            rm -rf $HISTORY_PACKAGE/add_reserve_temp
            unzip -q -d $HISTORY_PACKAGE/add_reserve_temp $HISTORY_PACKAGE/$BUILD_NUMBER-fullota.zip
            cp -rf ../reserve/ $HISTORY_PACKAGE/add_reserve_temp/system/reserve/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/system/reserve/miuicore $HISTORY_PACKAGE/add_reserve_temp/system/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/system/reserve/iflytek $HISTORY_PACKAGE/add_reserve_temp/system/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/system/reserve/browser $HISTORY_PACKAGE/add_reserve_temp/system/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/system/reserve/wandoujia $HISTORY_PACKAGE/add_reserve_temp/system/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/system/reserve/market $HISTORY_PACKAGE/add_reserve_temp/system/app/
            rm -rf $HISTORY_PACKAGE/add_reserve_temp/system/reserve
            rm -rf $HISTORY_PACKAGE/add_reserve_temp/system/app/SogouInput
            cd $HISTORY_PACKAGE/add_reserve_temp
            zip -q -r -y $BUILD_NUMBER-fullota.zip *
            mv -f $BUILD_NUMBER-fullota.zip ../$BUILD_NUMBER-fullota.zip
            cd -
            rm -rf $HISTORY_PACKAGE/add_reserve_temp
            EchoGreenColorMessage "add reserve to target_files"
            unzip -q -d $HISTORY_PACKAGE/add_reserve_temp $HISTORY_PACKAGE/$BUILD_NUMBER-target.zip
            cp -rf ../reserve/ $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/reserve/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/reserve/miuicore $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/reserve/iflytek $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/reserve/browser $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/reserve/wandoujia $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/app/
            mv -f $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/reserve/market $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/app/
            rm -rf $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/reserve
            rm -rf $HISTORY_PACKAGE/add_reserve_temp/SYSTEM/app/SogouInput
            cd $HISTORY_PACKAGE/add_reserve_temp
            zip -q -r -y $BUILD_NUMBER-target.zip *
            mv -f $BUILD_NUMBER-target.zip ../$BUILD_NUMBER-target.zip
            cd -
            rm -rf $HISTORY_PACKAGE/add_reserve_temp;;
        N|n|NO|no)
            EchoRedColorMessage "Warning:Not add reserve to fullota!!!";;
    esac
}

function MakeOTA() {
    EchoGreenColorMessage "Do you want to make ota package? (y/n)"
    read arg
    case $arg in
        Y|y|YES|yes)
            EchoGreenColorMessage "All old target zips, please enter the last target version you want (Only Version, EX: 5.8.21)"
            ls -h -l ${HISTORY_PACKAGE}/*target*
            read last_target_version
            EchoGreenColorMessage "OTA, Version is ${last_target_version}-${BUILD_NUMBER}"
            ../tools/releasetools/ota_from_target_files -k ../build/security/testkey -i ${HISTORY_PACKAGE}/${last_target_version}-target.zip ${HISTORY_PACKAGE}/${BUILD_NUMBER}-target.zip ${HISTORY_PACKAGE}/OTA-${last_target_version}-${BUILD_NUMBER}.zip;;
        N|n|NO|no)
            EchoRedColorMessage "Warning:Not Make OTA!!!";;
    esac
}

function UseTime() {
    let "OK_TIME=$END_TIME-$START_TIME"
    let "OK_TIME_1=$OK_TIME/60"
    let "OK_TIME_2=$OK_TIME%60"
    EchoGreenColorMessage "All done in $OK_TIME_1 minutes $OK_TIME_2 seconds"
}

START_TIME=`date +%s`
if [ "$1" = '' ]
then
    BUILD_DATE
else
    BUILD_NUMBER=$1
fi
MakeFullota
CopyFullota
AddReserve
MakeOTA
END_TIME=`date +%s`
UseTime
