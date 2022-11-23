#!/bin/bash
# Requires OpenSSL / ImageMagick / FFMPEG

# convert overlay
COLOR=$(openssl rand -hex 3)
#convert overlay.png -filter point -scale 200% overlay_2x.png
convert overlay.png -filter point -scale 300% -fuzz 100% -fill "#$COLOR" -opaque black overlay_2x.png

# create directories
mkdir -p thumb
mkdir -p converted
mkdir -p img

# get the last downloaded thread
LAST=$(ls -rt downloads/vg/ | tail -1)

# https://stackoverflow.com/questions/2664740/extract-file-basename-without-path-and-extension-in-bash

# convert all png to jpg
for f in downloads/vg/$LAST/*.png;
do
s=${f##*/}
convert $f converted/${s%.*}.jpg
done

# convert all webm to thumbnail
for f in downloads/vg/$LAST/*.webm;
do
s=${f##*/}
ffmpeg -i $f -vframes 1 thumb/${s%.*}.jpg
done

# copy all jpg
cp downloads/vg/$LAST/*.jpg img
# combine all images
mv thumb/*.jpg img
mv converted/*.jpg img

montage $(ls -d img/* | sort -R | tail -30) result.jpg
# add text
#convert result.jpg -gravity center -pointsize 50 -undercolor white -fill black -annotate 0 '/AGDG/' -append result.jpg
# add logo overlay image
convert -composite -gravity center result.jpg overlay_2x.png agdg_$LAST.jpg
# cleanup remove images
rm img/*.jpg
