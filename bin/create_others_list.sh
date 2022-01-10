#!/bin/bash
ARTICLE_LIST=($(ls -R ./others | grep .md$))
META_ATTRIBUTES=(title description emoji is_published)
INDEX=0
JSON="["
for ARTICLE in ${ARTICLE_LIST[@]}; do
  let INDEX++
  ARTICLE_PATH="./others/${ARTICLE}"

  JSON+="{"
  for ATTRIBUTES in ${META_ATTRIBUTES[@]}; do
    TMP=$(grep -m 1 "${ATTRIBUTES}: " ${ARTICLE_PATH} | sed -e "s/${ATTRIBUTES}: //g")
    JSON
  done
  JSON+="}"

  if [ ${#ARTICLE_LIST[@]} != $INDEX ]; then
    JSON+=","
  fi

done
JSON+="]"

echo $JSON > ./meta/list_data.json