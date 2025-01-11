#!/bin/sh


W=800
Q=80

mkdir -p target

for FORMAT in bmp tga pcx png jpg
do
 if ls *.$FORMAT > /dev/null 2> /dev/null
 then
  for FI in *.$FORMAT
  do
   FO="target/${FI%.$FORMAT}.jpg"
   echo "$FI -> $FO"
   magick "$FI" -quality "$Q" -scale "$W"x-1 "$FO"
   touch -r "$FI" "$FO"
   #mv "$FI" "converted-$FI"
  done
 fi
done
