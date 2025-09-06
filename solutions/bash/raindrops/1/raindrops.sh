#!/usr/bin/env bash

num=$1
s=""
(( num % 3 == 0 )) && s+="Pling"
(( num % 5 == 0 )) && s+="Plang"
(( num % 7 == 0 )) && s+="Plong"

if [ -z "$s" ]; then
  echo $num
else
  echo $s
fi
