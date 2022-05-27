# ----------------------------------------------------------------------------
#
# Package       : atlas-client
# Version       : branch-2.0
# Source repo   : https://github.com/apache/atlas
# Tested on     : UBI 8.5
# Language      : Java
# Travis-Check  : True
# Script License: Apache-2.0 License
# Maintainer    : Priya Seth <sethp@usibm.com>
#
# Disclaimer: This script has been tested in root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------
#!/bin/bash

#set -e

#Variables
PACKAGE_NAME=atlas/client
PACKAGE_VERSION="${1:-branch-2.0}"
PACKAGE_URL=https://github.com/apache/atlas
WORKDIR=`pwd`

#Install required dependencies
yum install -y git maven

#Clone the top-level repository
cd $WORKDIR
git clone $PACKAGE_URL
cd atlas
git checkout $PACKAGE_VERSION

#Install build tools
cd build-tools
mvn clean install

#Build and test atlas client
cd $WORKDIR/$PACKAGE_NAME
mvn clean install
