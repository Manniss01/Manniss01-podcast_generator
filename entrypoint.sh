#!/bin/bash
set -e  # Exit on error

echo "====================="
echo "Configuring Git user..."
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"

# Ensure workspace is a safe directory
git config --global --add safe.directory "$GITHUB_WORKSPACE"

echo "Running Python script..."
python3 /usr/bin/feed.py

echo "Adding and committing changes..."
git add -A
git commit -m "update feed" || echo "No changes to commit"
git push --set-upstream origin main

echo "========= Finished Task ============"
