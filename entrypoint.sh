#!/bin/bash

echo "====================="
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"

git config --global  --add safe.directory /github/workspace

python /urs/bin/feed.py

git add -A && git commit -m "update feed"
git push --set-upstrem origin main


echo "========= Finished Task ============"

