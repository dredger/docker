#!/usr/bin/env bash

set -e  # ensures that the script will immediately exit if any individual command fails

echo "Mozeo for docker Init" ;


RootDir="/var/www/html"

echo "1. Sym links creation"

echo  ln -s "$RootDir/mozeo.com/css"      "$RootDir/mozeo.com/mozeo/css"
  ln -s "$RootDir/mozeo.com/css"      "$RootDir/mozeo.com/mozeo/css" || true

echo  ln -s "$RootDir/mozeo.com/images"   "$RootDir/mozeo.com/mozeo/images"
  ln -s "$RootDir/mozeo.com/images"   "$RootDir/mozeo.com/mozeo/images" || true

echo  ln -s "$RootDir/mozeo.com/assets"   "$RootDir/mozeo.com/mozeo/assets"
  ln -s "$RootDir/mozeo.com/assets"   "$RootDir/mozeo.com/mozeo/assets" || true

echo  ln -s "$RootDir/mozeo.com/mozeo"      "$RootDir/mozeo.com/hijk"
  ln -s "$RootDir/mozeo.com/mozeo"      "$RootDir/mozeo.com/hijk" || true


echo "2. FS Permissions "

echo "$RootDir/storage";
  chmod -R 777 "$RootDir/storage"


echo "$RootDir/bootstrap"
  chmod -R 777 "$RootDir/bootstrap"


echo "$RootDir/mozeo.com/mozeo/customer/sqnfiles"
  chmod -R 777 "$RootDir/mozeo.com/mozeo/customer/sqnfiles" || true


echo "$RootDir/mozeo.com/mozeo/customer/mobileWeb/"
  chmod -R 777    "$RootDir/mozeo.com/mozeo/customer/mobileWeb/" || true


echo "3. Git config "
git config --global user.name "Cloud9"
git config --global user.email docker@mozeo.com
git config --global core.ignorecase true
git config --global core.logAllRefUpdates true
git config --global core.fileMode false
git config --global core.autocrlf false
