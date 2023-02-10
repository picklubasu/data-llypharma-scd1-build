#!/bin/sh

echo "Starting pre_build - $(date)"
STARTING_DIR=$PWD

# Copy python packages

CONFIG_PACKAGE_FOLDER="$CODEBUILD_SRC_DIR/config/package/"
S3_PACKAGE_CONFIG_FOLDER="s3-my-softwares/package/"
echo "Copying package files..."
aws s3 cp $CONFIG_PACKAGE_FOLDER $S3_PACKAGE_CONFIG_FOLDER --recursive

cd $STARTING_DIR
unset STARTING_DIR
echo "Completed pre_build - $(date)"