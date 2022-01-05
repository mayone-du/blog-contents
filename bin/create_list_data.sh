#!/bin/bash
ARTICLE_LIST=($(ls ./articles))
TITLE_KEY_AND_VALUES=()
DESCRIPTION_KEY_AND_VALUES=()
INDEX=0
JSON="["
for ARTICLE in ${ARTICLE_LIST[@]}; do
  let INDEX++
  ARTICLE_PATH="./articles/${ARTICLE}"
  TITLE=$(grep -m 1 "title: " ${ARTICLE_PATH} | sed -e "s/title: //g")
  DESCRIPTION=$(grep -m 1 "description: " ${ARTICLE_PATH} | sed -e "s/description: //g")
  JSON+="{\"title\": \"${TITLE}\", \"description\": \"${DESCRIPTION}\"}"
  # 最後のループじゃなければコンマを追加
  if [ ${#ARTICLE_LIST[@]} != $INDEX ]; then
    JSON+=","
  fi
done
JSON+="]"

echo $JSON