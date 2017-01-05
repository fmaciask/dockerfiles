#!/usr/bin/bash
# Author: Forlidar Macias
# Description: Let-s say I did this script to automatized common docker commands.
# Parameters:
# if doesn-t exist any parameter, by default build assuming there-s dockerfile in the same PATH.

#set -e


#DIR="`pwd`"
DIR="."
TAG="latest"
IMGNAME=""
getImgName(){
	# The NAME for the Image will be the name of the dir where it is allocated.
	if [ -z $IMGNAME ]
	then
		IMGNAME="`echo $DIR | awk -F "/" '{print $NF}'`"
		echo "The name for the image will be $IMGNAME:$TAG"
	fi

}

buildImage(){
	docker build --tag $IMGNAME:$TAG $DIR
}

if [ -e Dockerfile ]
then
	echo "Dockerfile exists in local"
fi
echo $1
case "$1" in
	"--imgname")
	IMGNAME="$2"
	;;
	"--tag")
	TAG="$2"
	;;
	*)
	echo $"Usage: $0 --imgname IMAGENAME | --tag TAG  "
	exit 1
esac
case "$3" in
        "--imgname")
        IMGNAME="$4"
        ;;
        "--tag")
        TAG="$4"
        ;;
        *)
        echo $"Usage: $0 --imgname IMAGENAME | --tag TAG  "
        exit 1
esac

#wrapdocker &
#sleep 5

getImgName
buildImage
exit 0
