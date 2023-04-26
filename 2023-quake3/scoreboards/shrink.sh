#!/bin/sh


W=800
Q=70

for FORMAT in bmp tga pcx
do
 if ls *.$FORMAT > /dev/null 2> /dev/null
 then
  for FI in *.$FORMAT
  do
   FO="${FI%.$FORMAT}.jpg"
   echo "$FI -> $FO"
   convert "$FI" -transpose -flip  -transverse   -quality "$Q" -scale "$W"x-1 "$FO"
   touch -r "$FI" "$FO"
   mv "$FI" "converted-$FI"
  done
 fi
done
