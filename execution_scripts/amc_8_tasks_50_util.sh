#!/bin/bash
set -e
set -o xtrace

/home/common_shared/litmus/liblitmus/setsched Linux && /home/common_shared/litmus/liblitmus/setsched P-FP-Dyn

HME=/home/common_shared/PAStime
LEN=$1

$HME/darknet-master/darknet folder_classify $HME/darknet-master/cfg/tiny.cfg\
 $HME/darknet-master/tiny.weights $HME/darknet-master/data/coco/converted1/\
 $LEN 65 345 627 4446 1 345 627 2>/dev/null &
sleep 2
$HME/darknet-master/darknet folder_classify $HME/darknet-master/cfg/tiny.cfg\
 $HME/darknet-master/tiny.weights $HME/darknet-master/data/coco/converted2/\
 $LEN 65 345 627 6943 2 690 1253 2>/dev/null &
sleep 2
$HME/darknet-master/darknet folder_classify $HME/darknet-master/cfg/tiny.cfg\
 $HME/darknet-master/tiny.weights $HME/darknet-master/data/coco/converted3/\
 $LEN 65 345 627 8345 3 1035 1879 2>/dev/null &
sleep 2
$HME/darknet-master/darknet folder_classify $HME/darknet-master/cfg/tiny.cfg\
 $HME/darknet-master/tiny.weights $HME/darknet-master/data/coco/converted4/\
 $LEN 65 345 627 9122 4 1380 2505 2>/dev/null &
sleep 2

$HME/video/app/build/video_decoder $HME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 2836 5 1630 0 >video_fps1.txt 2>/dev/null &
sleep 2
$HME/video/app/build/video_decoder $HME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 3013 6 1880 0 >video_fps2.txt 2>/dev/null &
sleep 2
$HME/video/app/build/video_decoder $HME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 3212 7 2130 0 >video_fps3.txt 2>/dev/null &
sleep 2
$HME/video/app/build/video_decoder $HME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 5600 8 2380 0 >video_fps4.txt 2>/dev/null &
sleep 2

$HME/../litmus/liblitmus/release_ts
sleep $(((LEN*10)+8))

pkill video_decoder
pkill darknet
