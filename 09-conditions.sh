#!/bin/bash
NUMBER=$1

if[ $NUMBER -lt 10 ]
  echo "Given $NUMBER is less than 10"
else
  echo "Given $NUMBER is not less than 10"
  exit 1
fi
