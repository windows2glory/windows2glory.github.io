#!/usr/bin/env bash
# Log gh in as windows2glory using the token stored in AWS Parameter Store.
set -euo pipefail

aws ssm get-parameter --name /github/windows2glory/pages-token \
  --with-decryption --query Parameter.Value --output text \
  --profile default --region ap-southeast-1 \
  | gh auth login --hostname github.com --with-token

gh auth status --hostname github.com
