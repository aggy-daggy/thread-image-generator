#!/bin/bash
LAST=$(ls -rt downloads/vg/ | tail -1)

# convert overlay
COLOR=$(openssl rand -hex 3)
#convert overlay.png -filter point -scale 200% overlay_2x.png
#convert overlay.png -filter point -scale 300% -fuzz 100% -fill "#$COLOR" -opaque black overlay_2x.png
convert hq.png -filter point -scale 150% -fuzz 100% -fill "#$COLOR" -opaque black overlay_2x.png
convert overlay_2x.png -gravity center -pointsize 55 -undercolor "#$COLOR" -fill transparent -font "ttf/TerminusTTF-4.49.2.ttf" -annotate +0+200 'just like make game' -append overlay_2x.png


montage $(ls -d resized/* | sort -R | tail -30) -geometry +1+1 result.jpg
# add text
#convert result.jpg -gravity center -pointsize 50 -undercolor white -fill black -annotate 0 '/AGDG/' -append result.jpg
# add logo overlay image
mkdir -p results
convert -composite -gravity center result.jpg overlay_2x.png results/agdg_$LAST_`date +%s`.jpg
