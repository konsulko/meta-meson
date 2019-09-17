#!/bin/bash

set -ex

if [ "$#" -lt 3 ] ; then
	echo "Usage: $0 <path to base build path> <machine> <target>"
	exit 1
fi

BUILD_PATH=$1
OE_MACHINE=$2
BITBAKE_CMD=$3

(
    cd $BUILD_PATH
    BASEDIR=$PWD

    . ./oe-init-build-env $PWD/build
    
    cp $BASEDIR/meta/conf/local.conf.sample conf/local.conf
    
    touch conf/sanity.conf
    echo "BBLAYERS +=\"$1/meta-meson\"" >> conf/bblayers.conf
    echo "DISTRO_FEATURES_append = \" wayland opengl \"" >> conf/local.conf

    echo "Running '$BITBAKE_CMD' for '$OE_MACHINE'"
	MACHINE="$OE_MACHINE" bitbake $BITBAKE_CMD
)