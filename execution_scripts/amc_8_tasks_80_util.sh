#!/bin/bash
set -e
set -o xtrace

/home/common_shared/litmus/liblitmus/setsched Linux && /home/common_shared/litmus/liblitmus/setsched P-FP-Dyn

HOME=/home/common_shared/PAStime
LEN=$1

$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted1/\
 $LEN 65 345 627 2798 1 345 627 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted2/\
 $LEN 65 345 627 2835 2 690 1253 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 1241 3 940 0 >video_fps.txt 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted4/\
 $LEN 65 345 627 5807 4 1535 2379 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 1827 5 1785 0 >video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 4077 6 2285 0 >video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 4434 7 2785 0 >video_fps.txt 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted8/\
 $LEN 65 345 627 8651 8 4820 8386 2>/dev/null &
sleep 2

$HOME/../litmus/liblitmus/release_ts
sleep $(((LEN*9)+10))

pkill video_decoder
pkill darknet
