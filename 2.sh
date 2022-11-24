#!/bin/bash
# Requires OpenSSL / ImageMagick / FFMPEG

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