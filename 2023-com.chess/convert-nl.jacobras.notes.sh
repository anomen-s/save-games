#!/bin/sh

# Extract from nl.jacobras.notes

jq -c -r '.notes[] | select(.title | test("Chess.com")) | {updated, text}' < data.json | \
while read -r data
do
  # Extract values from the JSON data
  timestamp=$(echo "$data" | jq -r '.updated')
  text=$(echo "$data" | jq -r '.text | gsub("\\\\"; "")')

  # construct filename
  D=$(echo    "$text" |sed -ne 's/\[Date \"\(.*\)\"\]/\1/p')
  IS_B=$(echo "$text" |sed -ne 's/\[Black \"anomen.*/b/p')
  IS_W=$(echo "$text" |sed -ne 's/\[White \"anomen.*/w/p')
  W_D=$(echo  "$text" |sed -ne 's/\[White \"[^0-9]*\([0-9]*\)"\]/\1/p')
  B_D=$(echo  "$text" |sed -ne 's/\[Black \"[^0-9]*\([0-9]*\)"\]/\1/p')
  WON=$(echo  "$text" |sed -ne 's/.*anomen.* won.*/1/p')
  DRAW=$(echo  "$text" |sed -ne 's/.*Termination .Draw.*/1/p')
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

  echo $FO

  # write result
  echo "$text" > "$FO"
done
