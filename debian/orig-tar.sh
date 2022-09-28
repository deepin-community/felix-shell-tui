#!/bin/sh -e

VERSION=$2
TAR=../felix-shell-tui_$VERSION.orig.tar.gz
DIR=felix-shell-tui-$VERSION
TAG=$(echo "org.apache.felix.shell.tui-$VERSION" | sed -re's/~(alpha|beta)/-\1-/')

svn export https://svn.apache.org/repos/asf/felix/releases/${TAG}/ $DIR
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR ../$TAG

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir && echo "moved $TAR to $origDir"
fi
