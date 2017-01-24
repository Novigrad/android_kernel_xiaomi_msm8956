#
# Custom build script 
#

yellow='\033[0;33m'
white='\033[0m'
red='\033[0;31m'
gre='\e[0;32m'
echo -e ""
echo -e "$yellow ====================================\n Welcome\n ====================================\n 1.Build stable version "
echo -n " Enter your choice:"
read choice
echo -e "$white"
Start=$(date +"%s")
KERNEL_DIR=$PWD
DTBTOOL=$KERNEL_DIR/dtbTool
cd $KERNEL_DIR
export ARCH=arm64
export CROSS_COMPILE="/home/guyver/Desktop/Toolchain/Linaro-v4.9.4/bin/aarch64-linux-android-"
export LD_LIBRARY_PATH=home/guyver/Desktop/Toolchain/Linaro-v4.9.4/lib/
STRIP="/home/guyver/Desktop/Toolchain/Linaro-v4.9.4/bin/aarch64-linux-android-strip"
make clean
make guyver_defconfig
export KBUILD_BUILD_HOST="ASUS"
export KBUILD_BUILD_USER="GUYVER"
make -j5
time=$(date +"%d-%m-%y-%T")
$DTBTOOL -2 -o $KERNEL_DIR/arch/arm64/boot/dt.img -s 2048 -p $KERNEL_DIR/scripts/dtc/ $KERNEL_DIR/arch/arm/boot/dts/
mv $KERNEL_DIR/arch/arm64/boot/dt.img $KERNEL_DIR/build/dtb
cp $KERNEL_DIR/arch/arm64/boot/Image $KERNEL_DIR/build/zImage
rm -rf $KEREL_DIR/build
mkdir -p $KERNEL_DIR/build
cp $KERNEL_DIR/drivers/staging/prima/wlan.ko $KERNEL_DIR/build/wlan.ko

