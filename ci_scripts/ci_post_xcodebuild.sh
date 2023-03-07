#!/bin/sh

#exit(1)

# Type a script or drag a script file from your workspace to insert its path.
#- -- SCRIPT BEGIN - --
# SKIP_SIMULATOR_BUILDS=1
  SCRIPT_SRC=$(find "$CI_DERIVED_DATA_PATH" -name 'Instabug_dsym_upload.sh' | head -1)
  DSYM_PATH="$CI_ARCHIVE_PATH"
  if [ ! "${SCRIPT_SRC}" ]; then
    echo "Instabug: err: script not found. Make sure that you're including InstabugResources.bundle in your project directory"
    exit 1
  fi
    APP_TOKEN="d824b0efb5573e97ac7c03fb03d2d0a3"
  source "${SCRIPT_SRC}"
#- -- SCRIPT END - --

