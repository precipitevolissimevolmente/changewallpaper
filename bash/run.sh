#!/bin/bash

rm -rf work modules 
mkdir work modules 

ROOT_DIR=$PWD

JNA_JAR=jars/jna-5.2.0.jar
JNA=com.sun.jna

JNA_PLATFORM_JAR=jars/jna-platform-5.2.0.jar
JNA_PLATFORM=com.sun.jna.platform

# ---------------------------
# generate jna module

jdeps --generate-module-info work $JNA_JAR

# ---------------------------
# build  jackson-core module

JARPATH=$JNA_JAR
MOD=$JNA

# copy original jar into place
cp $ROOT_DIR/$JARPATH $ROOT_DIR/modules/$MOD.jar

# extract original jar
rm -rf classes
mkdir classes
cd classes
jar xf $ROOT_DIR/$JARPATH

# compile module-info.java (generated by gen.sh)
cd $ROOT_DIR/work/$MOD
javac -p $MOD -d $ROOT_DIR/classes module-info.java

# update output jar
jar uf $ROOT_DIR/modules/$MOD.jar -C $ROOT_DIR/classes module-info.class

cd $ROOT_DIR

# ---------------------------
# generate jna.platform module

jdeps --module-path $PWD/modules --add-modules com.sun.jna --generate-module-info work $JNA_PLATFORM_JAR

# ---------------------------
# build  jna.platform module

JARPATH=$JNA_PLATFORM_JAR
MOD=$JNA_PLATFORM

# copy original jar into place
cp $ROOT_DIR/$JARPATH $ROOT_DIR/modules/$MOD.jar

# extract original jar
rm -rf classes
mkdir classes
cd classes
jar xf $ROOT_DIR/$JARPATH

# compile module-info.java (generated by gen.sh)
cd $ROOT_DIR/work/$MOD

javac --module-path $ROOT_DIR/modules --add-modules com.sun.jna -d $ROOT_DIR/classes module-info.java

# update output jar
jar uf $ROOT_DIR/modules/$MOD.jar -C $ROOT_DIR/classes module-info.class

cd $ROOT_DIR

rm -rf work classes

echo "modular jars are in $PWD/module"

echo "Ready."