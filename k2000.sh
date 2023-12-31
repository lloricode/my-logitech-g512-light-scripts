#!/bin/bash

# https://github.com/MatMoul/g810-led/blob/master/sample_effects/bash/k2000

if [ "$1" == "--help" ]; then
	echo "k2000 [speed (default:0.01] [colorOff] [colorOn] [colorFade1] [colorFade2]"
	exit 0
fi

speed=0.01
colorOff=000000
colorOn=ff0000
colorFade1=aa0000
colorFade2=550000

if [ "$1" != "" ]; then
	speed=$1
fi
if [ "$2" != "" ]; then
	colorOff=$2
fi
if [ "$3" != "" ]; then
	colorOn=$3
	if [ "$4" != "" ]; then
		colorFade1=$4
	else
		colorFade1=$colorOn
	fi
	if [ "$5" != "" ]; then
		colorFade2=$5
	else
		colorFade2=$colorOn
	fi
fi

setKeys () {
	cmd=""
  if [ $1 ] ; then
    cmd=$cmd"k $1 $colorOn\n"
  fi
  if [ $2 ] ; then
    cmd=$cmd"k $2 $colorFade1\n"
  fi
  if [ $3 ] ; then
    cmd=$cmd"k $3 $colorFade2\n"
  fi
  if [ $4 ] ; then
    cmd=$cmd"k $4 $colorOff\n"
  fi
  cmd=$cmd"c"
  echo -e $cmd | g810-led -pp
  sleep $speed
}

g810-led -gn fkeys $colorOff

setKeys F1
setKeys F2
setKeys F3
setKeys F4
setKeys F5 F1
setKeys F6 F2 F1
setKeys F7 F3 F2 F1
setKeys F8 F4 F3 F2
setKeys F9 F5 F4 F3
setKeys F10 F6 F5 F4
setKeys F11 F7 F6 F5
setKeys F12 F8 F7 F6
setKeys F12 F9 F8 F7
setKeys F12 F10 F9 F8
setKeys F12 F11 F10 F9
setKeys F11 F10 F10 F10
setKeys F10
setKeys F9
setKeys F8 F12
setKeys F7 F11 F12
setKeys F6 F10 F11 F12
setKeys F5 F9 F10 F11
setKeys F4 F8 F9 F10
setKeys F3 F7 F8 F9
setKeys F2 F6 F7 F8
setKeys F1 F5 F6 F7
setKeys F1 F4 F5 F6
setKeys F1 F3 F4 F5
setKeys F1 F2 F3 F4
setKeys F1 F1 F2 F3
setKeys F1 F1 F1 F2
setKeys F1 F1 F1 F1
