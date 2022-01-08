#!/bin/bash
ARTICLE_LIST=($(ls -R ./articles | grep .md$))
INDEX=0
JSON="["
for ARTICLE in ${ARTICLE_LIST[@]}; do
  let INDEX++
  YEAR=${ARTICLE:0:4}
  ARTICLE_PATH="./articles/${YEAR}/${ARTICLE}"

  TITLE=$(grep -m 1 "title: " ${ARTICLE_PATH} | sed -e "s/title: //g")
  DESCRIPTION=$(grep -m 1 "description: " ${ARTICLE_PATH} | sed -e "s/description: //g")
  EMOJI=$(grep -m 1 "emoji: " ${ARTICLE_PATH} | sed -e "s/emoji: //g")
  IS_PUBLISHED=$(grep -m 1 "is_published: " ${ARTICLE_PATH} | sed -e "s/is_published: //g")
  CREATED_AT=$(echo ${ARTICLE} | sed -e "s/\.[^\.]*$//")

  JSON+="{\"title\": \"${TITLE}\", \"description\": \"${DESCRIPTION}\", \"emoji\": \"${EMOJI}\", \"is_published\": \"${IS_PUBLISHED}\", \"created_at\": \"${CREATED_AT}\"}"
  if [ ${#ARTICLE_LIST[@]} != $INDEX ]; then
    JSON+=","
  fi
done
JSON+="]"

echo $JSON > ./meta/list_data.json