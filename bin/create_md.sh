#!/bin/bash
DATE=`date +%Y-%m-%d`
YEAR=`date +%Y`
if [ ! -d "./articles/${YEAR}" ]; then
  mkdir -p ./articles/${YEAR}
fi
if [ ! -f "./articles/${YEAR}/${DATE}.md" ]; then
  cp ./template/TEMPLATE.md ./articles && mv ./articles/TEMPLATE.md ./articles/$YEAR/$DATE.md 
else
  echo "File already exists"
fi
