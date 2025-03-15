#!/bin/bash

echo "Enter the number please"
read number
for ((i = $number; $i >= 0; i--)); do
  echo "$i"
  sleep 1
done
echo "Done "



