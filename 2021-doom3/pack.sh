#!/bin/sh

for F in savegames/*.save
do
 S="${F%.save}"
 echo $S
 7z a "$S.7z" $S.* || exit 11
 rm -f "$S.save" "$S.tga" "$S.txt"
done

echo All OK
