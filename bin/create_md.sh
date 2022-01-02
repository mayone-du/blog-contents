#!/bin/bash
DATE=`date +%Y-%m-%d`
cp ./template/TEMPLATE.md ./articles && mv ./articles/TEMPLATE.md ./articles/$DATE.md 