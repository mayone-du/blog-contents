#!/bin/bash
ARTICLE_LIST=($(ls ./articles))
for ARTICLE in ${ARTICLE_LIST[@]}; do
  ARTICLE_PATH="./articles/${ARTICLE}"
  echo $ARTICLE_PATH
  # --- --- で囲まれているメタ情報を抽出し、json化する
  # TITLE=$(cat ${ARTICLE_PATH} | grep "---" | head -n 1 | sed -e "s/---//g" | sed -e "s/title: //g")
  # DESCRIPTION=$(cat ${ARTICLE_PATH} | grep "---" | head -n 1 | sed -e "s/---//g" | sed -e "s/description: //g")
  # TITLE_KEY_AND_VALUE="\"title\": \"${TITLE}\","
  # DESCRIPTION_KEY_AND_VALUE="\"description\": \"${DESCRIPTION}\","

  # echo $TITLE_KEY_AND_VALUE
  # echo $DESCRIPTION_KEY_AND_VALUE
done

TITLES=($(grep -m 1 "title: " ./articles/*))
A=$(sed -e "s/title: //g" -n 1 ./articles/first.md)
echo $TITLES > ./meta/list_data.json
echo $A