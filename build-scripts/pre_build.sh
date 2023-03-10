#!/bin/sh

echo "Starting pre_build - $(date)"
STARTING_DIR=$PWD

# Copy python packages

CONFIG_PACKAGE_FOLDER="$CODEBUILD_SRC_DIR/config/package/"
S3_PACKAGE_CONFIG_FOLDER=${S3_PACKAGE_CONFIG_FOLDER}
echo "Copying package files..."
aws s3 cp $CONFIG_PACKAGE_FOLDER $S3_PACKAGE_CONFIG_FOLDER --recursive

# Copy codes
CODE_PACKAGE_FOLDER="$CODEBUILD_SRC_DIR/config/code/"
S3_PACKAGE_CODE_FOLDER=${S3_PACKAGE_CODE_FOLDER}
echo "Copying package files..."
aws s3 cp $CODE_PACKAGE_FOLDER $S3_PACKAGE_CODE_FOLDER --recursive


cd $STARTING_DIR
unset STARTING_DIR
echo "Completed pre_build - $(date)"