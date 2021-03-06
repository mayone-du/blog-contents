#!/bin/bash
ARTICLE_LIST=($(ls -R ./articles | grep .md$))
META_ATTRIBUTES=(title description emoji is_published created_at)
FILE_INDEX=0
ATTRIBUTES_INDEX=0
JSON="["
for ARTICLE in ${ARTICLE_LIST[@]}; do
  let FILE_INDEX++
  YEAR=${ARTICLE:0:4}
  ARTICLE_PATH="./articles/${YEAR}/${ARTICLE}"

  JSON+="{"
  for ATTRIBUTES in ${META_ATTRIBUTES[@]}; do
    let ATTRIBUTES_INDEX++
    VALUE=$(grep -m 1 "${ATTRIBUTES}: " ${ARTICLE_PATH} | sed -e "s/${ATTRIBUTES}: //g")
    if [ "${ATTRIBUTES}" == "is_published" ]; then
      JSON+="\"${ATTRIBUTES}\": ${VALUE}"
    elif [ "${ATTRIBUTES}" == "created_at" ]; then
    # .mdを削除
      JSON+="\"${ATTRIBUTES}\": \"${ARTICLE:0:10}\""
    else
      JSON+="\"${ATTRIBUTES}\": \"${VALUE}\""
    fi

    # 最後のメタ属性のループでなければ、カンマを追加する
    if [ ${#META_ATTRIBUTES[@]} != $ATTRIBUTES_INDEX ]; then
      JSON+=","
    fi
  done

  JSON+="}"

  if [ ${#ARTICLE_LIST[@]} != $FILE_INDEX ]; then
    JSON+=","
  fi

  let ATTRIBUTES_INDEX=0

done
JSON+="]"

echo $JSON > ./meta/article_list.json