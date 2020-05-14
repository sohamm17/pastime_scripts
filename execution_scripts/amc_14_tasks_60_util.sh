#!/bin/bash
set -e
set -o xtrace

/home/common_shared/litmus/liblitmus/setsched Linux && /home/common_shared/litmus/liblitmus/setsched P-FP-Dyn

HOME=/home/common_shared/PAStime
LEN=$1

$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted1/\
 $LEN 65 345 627 6084 1 345 627 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted2/\
 $LEN 65 345 627 7596 2 690 1253 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted3/\
 $LEN 65 345 627 10125 3 1035 1879 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted4/\
 $LEN 65 345 627 10329 4 1380 2505 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 2083 5 1630 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 2386 6 1880 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted7/\
 $LEN 65 345 627 10386 7 2725 4131 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted8/\
 $LEN 65 345 627 15190 8 3070 4758 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted9/\
 $LEN 65 345 627 15517 9 3415 5384 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 6504 10 3665 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 7612 11 3915 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 9188 12 4165 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 16561 13 4665 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 17956 14 5165 0 >>video_fps.txt 2>/dev/null &
sleep 2

$HOME/../litmus/liblitmus/release_ts
sleep $(((LEN*18)+15))

pkill video_decoder
pkill darknet
