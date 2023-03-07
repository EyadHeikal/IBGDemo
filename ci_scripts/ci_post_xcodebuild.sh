#!/bin/sh

#- -- SCRIPT BEGIN - --
# SKIP_SIMULATOR_BUILDS=1
SCRIPT_SRC=$(find "$CI_DERIVED_DATA_PATH" -name 'Instabug_dsym_upload.sh' | head -1)

DWARF_DSYM_FOLDER_PATH="$CI_ARCHIVE_PATH/dSYMs"
echo "DWARF_DSYM_FOLDER_PATH:- ${DWARF_DSYM_FOLDER_PATH}"

#DWARF_DSYM_FILE_NAME="SPMDemo.app.dSYM"
#DWARF_DSYM_FILE_NAME=$(ls "${DWARF_DSYM_FOLDER_PATH}" | head -1)
DWARF_DSYM_FILE_NAME=$(find "$DWARF_DSYM_FOLDER_PATH"  -type f -name "CI_PRODUCT*.dSYM" | head -1)
echo "DWARF_DSYM_FILE_NAME:- ${DWARF_DSYM_FILE_NAME}"


#echo "CI_PRODUCT:- ${CI_PRODUCT}"

if [ ! "${SCRIPT_SRC}" ]; then
echo "Instabug: err: script not found. Make sure that you're including InstabugResources.bundle in your project directory"
exit 1
fi
APP_TOKEN="d824b0efb5573e97ac7c03fb03d2d0a3"
source "${SCRIPT_SRC}"
#- -- SCRIPT END - --
