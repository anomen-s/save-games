#!/bin/sh

for FI in *.bmp
do
 FO="$(date -r "$FI" '+%Y%m%d_%H%M').jpg"
 echo "$FI -> $FO"
 convert "$FI" -quality 90 -scale 800x500 "$FO"
 touch -r "$FI" "$FO"
 mv "$FI" "converted-$FI"
done
