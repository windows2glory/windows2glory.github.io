#!/usr/bin/env bash
# Usage: ./new-post.sh "My post title"
set -euo pipefail

title="${1:?Usage: ./new-post.sh \"My post title\"}"
slug=$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')
day=$(date +%Y-%m-%d)
file="_posts/${day}-${slug}.md"

if [[ -e "$file" ]]; then
  echo "Already exists: $file" >&2
  exit 1
fi

safe_title=${title//\"/\\\"}

cat > "$file" <<EOF
---
title: "${safe_title}"
date: ${day}
---

EOF
echo "$file"
