#!/bin/bash
mkdir -p resized
#for f in img/*; do
#echo $f
#done
rm resized/*.jpg
#convert "img/*.jpg[200x]" -set filename:base "%[basename]" "resized/%[filename:base].jpg"
mogrify -resize 256x256! -quality 100 -path resized img/*.jpg