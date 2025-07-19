#!/bin/bash

Number1=100
Number2=200

TIMESTAMP=$(date)
SUM=$(($Number1=$Number2))
echo "script executed at: $TIMESTAMP"
echo "sum of $Number1 and $Number2 is : $SUM"