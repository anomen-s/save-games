#!/bin/sh

# Rename file using data inside

mkdir -p target

for FI in *.txt
do
  echo '------------------------'

 D=`sed -ne 's/\[Date \"\(.*\)\"\]/\1/p' "$FI"`
 IS_B=`sed -ne 's/\[Black \"anomen.*/b/p' "$FI"`
 IS_W=`sed -ne 's/\[White \"anomen.*/w/p' "$FI"`
 W_D=`sed -ne 's/\[White \"[^0-9]*\([0-9]*\)"\]/\1/p' "$FI"`
 WON=`sed -ne 's/.*anomen.* won.*/1/p' "$FI"`
 DRAW=`sed -ne 's/.*Termination .Draw.*/1/p' "$FI"`

 echo "DATE:$D	SIDE:${IS_B}${IS_W}"
 
 if [ "x${IS_B}${IS_W}" = xw ]
 then
  ELO=`sed -ne 's/\[BlackElo \"\([0-9]*\)"\]/\1/p' "$FI"`
  echo "Black ELO: $ELO"
 else
  ELO=`sed -ne 's/\[WhiteElo \"\([0-9]*\)"\]/\1/p' "$FI"`
  echo "White ELO: $ELO"
 fi
 if [ -z "$WON" ]
 then
   WON=0
 fi
 if [ -n "$DRAW" ]
 then
   WON=x
 fi
 echo "Result:$WON"
 FN="${D}-${ELO}-${IS_B}${IS_W}-${WON}"
 FO="target/${FN}.pgn"
 if [ -e "$FO" ]
 then
  FO="${FN}_${RANDOM}.pgn"
 fi
 echo "$FI -> $FO"

 cat "$FI" | sed -e 's/^1\./\n1./' > "$FO"
 echo "" >> "$FO"
done
