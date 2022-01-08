#!/bin/bash
ARTICLE_LIST=($(ls -R ./articles | grep .md$))
TITLE_KEY_AND_VALUES=()
DESCRIPTION_KEY_AND_VALUES=()
INDEX=0
JSON="["
for ARTICLE in ${ARTICLE_LIST[@]}; do
  let INDEX++
  YEAR=${ARTICLE:0:4}
  ARTICLE_PATH="./articles/${YEAR}/${ARTICLE}"
  TITLE=$(grep -m 1 "title: " ${ARTICLE_PATH} | sed -e "s/title: //g")
  DESCRIPTION=$(grep -m 1 "description: " ${ARTICLE_PATH} | sed -e "s/description: //g")
  CREATEDAT=$(echo ${ARTICLE} | sed -e "s/\.[^\.]*$//")
  JSON+="{\"title\": \"${TITLE}\", \"description\": \"${DESCRIPTION}\", \"created_at\": \"${CREATEDAT}\"}"
  if [ ${#ARTICLE_LIST[@]} != $INDEX ]; then
    JSON+=","
  fi
done
JSON+="]"

echo $JSON > ./meta/list_data.json