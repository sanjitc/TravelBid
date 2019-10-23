#!/bin/sh

basedir=$(pwd)


##Create database and import
su -c "${basedir}/runTravelCmd.sh" - db2inst1

