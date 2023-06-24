#!/bin/zsh

ls $PWD/*.MP4 > files

for i in {1..$(wc files | cut -d " " -f 7)}; do mv $(cat ./files | head -$i | tail -1) ./tmp.MP4; ffmpeg -i  ./tmp.MP4 -vf scale=680:-1 $(cat ./files | head -$i | tail -1); done

for i in {1..$(wc files | cut -d " " -f 7)}; do echo "file $(cat ./files | head -$i | tail -1)" >> ./vidlist.txt; done

ffmpeg -f concat -safe 0 -i vidlist.txt -c copy output.mp4

echo "\n done \n"

exit 0
