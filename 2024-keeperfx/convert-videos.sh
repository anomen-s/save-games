#/bin/sh

mkdir -p target

for A in *.smk
do
 F="${A%.smk}"
 
 ffmpeg  -hide_banner -flags low_delay -fflags +genpts \
    -i "$A" \
    -sws_flags bilinear -vf scale=640:400 \
    -codec:v libx264 -preset slow -crf 16  -tune animation \
    -codec:a libmp3lame -qscale:a 1 \
\
       -metadata description="Dungeon Keeper video" \
       -metadata title="${F}" \
       -metadata encoded_by="anomen" \
\
    "target/${F}.mkv"
done
