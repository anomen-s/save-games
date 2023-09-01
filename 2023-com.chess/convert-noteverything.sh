#!/bin/sh

# Extract from de.softxperience.android.noteverything

for FI in *.txt
do
 D=`sed -ne 's/\[Date \"\(.*\)\"\]/\1/p' "$FI"`
 IS_B=`sed -ne 's/\[Black \"anomen.*/b/p' "$FI"`
 IS_W=`sed -ne 's/\[White \"anomen.*/w/p' "$FI"`
 W_D=`sed -ne 's/\[White \"[^0-9]*\([0-9]*\)"\]/\1/p' "$FI"`
 B_D=`sed -ne 's/\[Black \"[^0-9]*\([0-9]*\)"\]/\1/p' "$FI"`
 WON=`sed -ne 's/.*anomen.* won.*/1/p' "$FI"`
 DRAW=`sed -ne 's/.*Termination .Draw.*/1/p' "$FI"`
 if [ -z "$WON" ]
 then
   WON=0
 fi
 if [ -n "$DRAW" ]
 then
   WON=x
 fi
 FN="${D}-${W_D}${B_D}-${IS_B}${IS_W}-${WON}"
 FO="${FN}.pgn"
 if [ -e "$FO" ]
 then
  FO="${FN}_${RANDOM}.pgn"
 fi
 echo "$FI -> $FO"

 cat $FI | sed -e '1d; s/^1\./\n1./' > $FO
 echo "" >> $FO
done
