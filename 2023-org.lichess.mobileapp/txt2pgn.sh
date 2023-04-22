#!/bin/sh
for FI in *.txt
do
 D=`sed -ne 's/\[Date \"\(.*\)\"\]/\1/p' "$FI"`
 T=`sed -ne 's/\[UTCTime \"\([0-9][0-9]\):\([0-9][0-9]\).*/\1.\2/p' "$FI"`
 IS_B=`sed -ne 's/\[Black \"anomen.*/b/p' "$FI"`
 IS_W=`sed -ne 's/\[White \"anomen.*/w/p' "$FI"`
 W_D=`sed -ne 's/\[White \"[^0-9]*\([0-9]*\)"\]/\1/p' "$FI"`
 B_D=`sed -ne 's/\[Black \"[^0-9]*\([0-9]*\)"\]/\1/p' "$FI"`
 W_WON=`sed -ne 's/\[Result "1-0"\]/1/p' "$FI"`
 B_WON=`sed -ne 's/\[Result "0-1"\]/1/p' "$FI"`
 WON=0
 if [ -n "$IS_B" -a -n "${B_WON}" ]
 then
   WON=1
 fi
 if [ -n "$IS_W" -a -n "${W_WON}" ]
 then
   WON=1
 fi
 FO="${D}.${T}-L${W_D}${B_D}-${IS_B}${IS_W}-${WON}.pgn"
 if [ -e "$FO" ]
 then
  FO="${FO}-$RANDOM"
 fi
 echo "$FI -> $FO"

 cat $FI | sed -e '1d' > $FO
 for T in `seq 2 100`
 do
   sed -e "s/ ${T}\. /\n${T}. /" -i "$FO"
 done
done
