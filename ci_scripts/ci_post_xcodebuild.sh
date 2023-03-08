#!/bin/sh

#- -- SCRIPT BEGIN - --
# SKIP_SIMULATOR_BUILDS=1
SCRIPT_SRC=$(find "$CI_DERIVED_DATA_PATH" -name 'Instabug_dsym_upload.sh' | head -1)

#DWARF_DSYM_FOLDER_PATH="$CI_ARCHIVE_PATH/dSYMs"
#DWARF_DSYM_FILE_NAME="${CI_PRODUCT}.app.dSYM"
DSYM_PATH="$CI_ARCHIVE_PATH/dSYMs/${CI_PRODUCT}.app.dSYM"
#DWARF_DSYM_FILE_NAME="Instabug.framework.dSYM"

if [ ! "${SCRIPT_SRC}" ]; then
echo "Instabug: err: script not found. Make sure that you're including InstabugResources.bundle in your project directory"
exit 1
fi
APP_TOKEN="d824b0efb5573e97ac7c03fb03d2d0a3"
source "${SCRIPT_SRC}"
#- -- SCRIPT END - --
