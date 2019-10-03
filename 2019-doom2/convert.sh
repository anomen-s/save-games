#!/bin/sh

for FI in Screenshot*.png
do
 FO="${FI%.png}.jpg"
 convert "$FI" -quality 90 -scale 800x-1 "$FO"
 mv "$FI" "converted-$FI"
done
