#!/bin/bash
ARTICLE_LIST=($(ls ./articles))
TITLE_KEY_AND_VALUES=()
DESCRIPTION_KEY_AND_VALUES=()
for ARTICLE in ${ARTICLE_LIST[@]}; do
  ARTICLE_PATH="./articles/${ARTICLE}"
  TITLE=$(grep -m 1 "title: " ${ARTICLE_PATH} | sed -e "s/title: //g")
  DESCRIPTION=$(grep -m 1 "description: " ${ARTICLE_PATH} | sed -e "s/description: //g")
  TITLE_KEY_AND_VALUES+="\"title\": \"${TITLE}\","
  DESCRIPTION_KEY_AND_VALUES+="\"description\": \"${DESCRIPTION}\","
done

echo '{
  "title": "'$TITLE_KEY_AND_VALUES'",
  "description": "'$DESCRIPTION_KEY_AND_VALUES'",
}'
