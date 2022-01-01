#!/bin/bash
ARTICLE_LIST=($(ls ./articles))
for ARTICLE in ${ARTICLE_LIST[@]}; do
  ARTICLE_PATH="./articles/${ARTICLE}"
  # --- --- で囲まれているメタ情報を抽出し、json化する
  TITLE=$(cat ${ARTICLE_PATH} | grep "---" | head -n 1 | sed -e "s/---//g" | sed -e "s/title: //g")
  DESCRIPTION=$(cat ${ARTICLE_PATH} | grep "---" | head -n 1 | sed -e "s/---//g" | sed -e "s/description: //g")
  TITLE_KEY_AND_VALUE="\"title\": \"${TITLE}\","
  DESCRIPTION_KEY_AND_VALUE="\"description\": \"${DESCRIPTION}\","

  echo TITLE_KEY_AND_VALUE
  echo DESCRIPTION_KEY_AND_VALUE
done