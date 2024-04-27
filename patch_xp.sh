#!/bin/bash

# Copyright (c) 2024 Alex313031.

YEL='\033[1;33m' # Yellow
CYA='\033[1;96m' # Cyan
RED='\033[1;31m' # Red
GRE='\033[1;32m' # Green
c0='\033[0m' # Reset Text
bold='\033[1m' # Bold Text
underline='\033[4m' # Underline Text

# Error handling
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "${RED}Failed $*"; }

# --help
displayHelp () {
	printf "\n" &&
	printf "${bold}${GRE}Script to patch Thorium for Windows XP and Vista and${c0}\n" &&
	printf "${bold}${GRE} derivatives like XP x64, POSReady 2009, Home Server 2007,${c0}\n" &&
	printf "${bold}${GRE} Server 2003, Server 2003 R2, and Server 2008.${c0}\n" &&
	printf "\n"
}
case $1 in
	--help) displayHelp; exit 0;;
esac

# chromium/src dir env variable
if [ -z "${CR_DIR}" ]; then 
    CR_SRC_DIR="$HOME/chromium/src"
    export CR_SRC_DIR
else 
    CR_SRC_DIR="${CR_DIR}"
    export CR_SRC_DIR
fi

# Patch Thorium
printf "\n" &&
printf "${GRE}Copying .patch files...\n" &&
printf "${c0}\n" &&

cp -v patches/winxp-vista-support_thorium.patch ${CR_SRC_DIR}/ &&
cp -v patches/boringssl.patch ${CR_SRC_DIR}/third_party/boringssl/src/ &&
cp -v patches/pdfium.patch ${CR_SRC_DIR}/third_party/pdfium/ &&
cp -v patches/skia.patch ${CR_SRC_DIR}/third_party/skia/ &&
cp -v patches/webrtc.patch ${CR_SRC_DIR}/third_party/webrtc/ &&

cd ${CR_SRC_DIR}/ &&

printf "\n" &&
printf "${GRE}Patching Chromium...\n" &&
printf "${c0}\n" &&

git apply --reject winxp-vista-support_thorium.patch &&

cd ${CR_SRC_DIR}/third_party/boringssl/src/ &&

printf "\n" &&
printf "${GRE}Patching BoringSSL...\n" &&
printf "${c0}\n" &&

git apply --reject boringssl.patch &&

cd ${CR_SRC_DIR}/third_party/webrtc &&

printf "\n" &&
printf "${GRE}Patching WebRTC...\n" &&
printf "${c0}\n" &&

git apply --reject webrtc.patch &&

cd ${CR_SRC_DIR}/third_party/pdfium &&

printf "\n" &&
printf "${GRE}Patching PDFium...\n" &&
printf "${c0}\n" &&

git apply --reject pdfium.patch &&

cd ${CR_SRC_DIR}/third_party/skia &&

printf "\n" &&
printf "${GRE}Patching Skia...\n" &&
printf "${c0}\n" &&

git apply --reject skia.patch &&

printf "\n" &&
printf "${GRE}Done patching Thorium for Windows XP/Vista!\n" &&
printf "${c0}\n" &&
tput sgr0
