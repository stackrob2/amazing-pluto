#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://stg-api.stackbit.com/project/5fcdd6a42db6c70015ecf558/webhook/build/pull > /dev/null
curl -s -X POST https://stg-api.stackbit.com/project/5fcdd6a42db6c70015ecf558/webhook/build/ssgbuild > /dev/null
bundle install && bundle exec jekyll build
curl -s -X POST https://stg-api.stackbit.com/project/5fcdd6a42db6c70015ecf558/webhook/build/publish > /dev/null
