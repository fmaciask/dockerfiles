#!/usr/bin/bash
# Author: Forlidar Macias
# Description: Let-s say I did this script to automatized common docker commands.
# Parameters:
# if doesn-t exist any parameter, by default build assuming there-s dockerfile in the same PATH.
DIR="`pwd`"
TAG="latest"
IMGNAME=""
getImgName(){
	# The NAME for the Image will be the name of the dir where it is allocated.
	IMGNAME="`echo $DIR | awk -F "/" '{print $NF}'`"
	echo "The name for the image will be $IMGNAME:$TAG"
		
}
#BuildImage(){
#}
getImgName
if [ -e Dockerfile ]
then
	echo "Dockerfile exists in local"
fi
exit 0
