#!/bin/bash
set -e
set -o xtrace

/home/common_shared/litmus/liblitmus/setsched Linux && /home/common_shared/litmus/liblitmus/setsched P-FP-Dyn

HOME=/home/common_shared/PAStime

LEN=$1

$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted1/\
 $LEN 65 345 627 3128 1 345 627 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted2/\
 $LEN 65 345 627 4258 2 690 1253 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted3/\
 $LEN 65 345 627 5261 3 1035 1879 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted4/\
 $LEN 65 345 627 6184 4 1380 2505 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 2164 5 1630 0 >>video_fps1.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 3519 6 1880 0 >>video_fps1.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 3890 7 2130 0 >>video_fps1.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 6838 8 2630 0 >>video_fps1.txt 2>/dev/null &
sleep 2


$HOME/../litmus/liblitmus/release_ts
sleep $(((LEN*8)+10))

pkill video_decoder
pkill darknet
