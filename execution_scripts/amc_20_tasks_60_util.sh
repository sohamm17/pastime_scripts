#!/bin/bash
set -e
set -o xtrace

/home/common_shared/litmus/liblitmus/setsched Linux && /home/common_shared/litmus/liblitmus/setsched P-FP-Dyn

HOME=/home/common_shared/PAStime
LEN=$1

$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted1/\
 $LEN 65 345 627 5360 1 345 627 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted2/\
 $LEN 65 345 627 7752 2 690 1253 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted3/\
 $LEN 65 345 627 9867 3 1035 1879 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted4/\
 $LEN 65 345 627 10864 4 1380 2505 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted5/\
 $LEN 65 345 627 11327 5 1725 3131 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted6/\
 $LEN 65 345 627 12633 6 2070 3758 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted7/\
 $LEN 65 345 627 16387 7 2415 4384 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted8/\
 $LEN 65 345 627 16844 8 2760 5010 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 3312 9 3010 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted10/\
 $LEN 65 345 627 17888 10 3605 6762 2>/dev/null &
sleep 2
$HOME/darknet-master/darknet folder_classify $HOME/darknet-master/cfg/tiny.cfg\
 $HOME/darknet-master/tiny.weights $HOME/darknet-master/data/coco/converted11/\
 $LEN 65 345 627 19382 11 3950 7388 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 5143 12 4200 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 6826 13 4450 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 9901 14 4700 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 11039 15 4950 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 12804 16 5795 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 13198 17 6045 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 14636 18 6295 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 18540 19 6545 0 >>video_fps.txt 2>/dev/null &
sleep 2
$HOME/video/app/build/video_decoder $HOME/video/app/bunny_1080p_60fps.mp4\
 5000000000 1 30 $LEN 250 0 24002 20 7295 0 >>video_fps.txt 2>/dev/null &
sleep 2

$HOME/../litmus/liblitmus/release_ts
sleep $(((LEN*25)+15))

pkill video_decoder
pkill darknet
