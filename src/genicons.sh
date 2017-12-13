#!/bin/bash
# size would be either 26 or 16
#use convert -list font to list all available fonts in your system
#export FONT=AR-PL-UKai-TW-MBE-Book
#export FONT=AR-PL-UMing-TW-Light
#export FONT=AR-PL-UMing-TW-MBE-Light
#export FONT=WenQuanYi-Zen-Hei-Mono-Regular
#export FONT=WenQuanYi-Zen-Hei-Regular
#export FONT=WenQuanYi-Zen-Hei-Sharp-Regular
export FONT=AR-PL-UKai-TW-Book

convert_images() 
{
SIZE=$3
PT=$4
FILE="icons$SIZE/lc$1.png"
# Note that toolbar icons were scaled, setting weight to bold is necessary
# So that thin lines won't disapear.
convert -size "$SIZE"X"$SIZE" -background white -fill black -gravity center \
        -weight bold -font "$FONT" -transparent white \
        -pointsize $PT label:$2 $FILE
}

do_convert()
{
    mkdir -p icons$1
    cat labels.txt | sed "s/$/ $1 $2/" | \
        xargs -i bash -c 'convert_images $@' _ {}
    rm -f $1.zip
    zip -r $1.zip icons$1 &> /dev/null 
}

export -f convert_images
do_convert 24 22
do_convert 16 16
