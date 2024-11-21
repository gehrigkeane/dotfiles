#
# JQ
xh get 'https://prod-brand-service.fetchrewards.com/businesses' | jq '.[] | select(.partner) | .id' | wc -l
xh get 'https://prod-brand-service.fetchrewards.com/businesses' | jq '.[] | .id' | wc -l

# http get -> select fields -> to CSV -> sort by first column numerically
xh get "https://prod-brand-service.fetchrewards.com/v2/brands" \
| jq -r '.[] | [.popularityRank, .id, .name] | @csv' \
| sort -k1 -n > prod_brands.csv


# GitHub Repository Size - Human Readable
# numfmt: --from-unit=1024 b/c GitHub size is in KiB
gh api --method GET /repos/fetch-rewards/partner-file-service | jq '.size' | numfmt --from-unit=1024 --to=iec-i


#
# AWS

# list EB application verisons
aws elasticbeanstalk describe-application-versions \
  --application-name "Purchase History Service" \
  --version-label "$BUILD_VERSION" \
  | jq -r '.ApplicationVersions[]' \
  | wc -l

# list EB environments
aws elasticbeanstalk describe-environments \
  --application-name "Purchase History Service" \
  --environment-names "$BUILD_ENV-ph$BUILD_SUFFIX" \
  | jq -r '.Environments[].EnvironmentName' \
  | wc -l


#
# Bash

# if via test
# ref: https://kapeli.com/cheat_sheets/Bash_Test_Operators.docset/Contents/Resources/Documents/index
if test "$SKIP" -eq 0; then
  # ...
elif test "$SOME_VAR" -lt 2; then
  # ...
else
  #...
fi

#
# Git
# ref: https://stackoverflow.com/a/61602985



#
# Go

# Replace a module w/ a local version
go mod edit -replace bitbucket.org/some/package=${GOPATH}/src/bitbucket.org/some/package
# and
go mod edit -dropreplace bitbucket.org/fetchrewards/neli


#
# Java

# Heap dump
ps -C java -o pid | tail -n 1 | xargs sudo -u webapp jmap -dump:format=b,file=/tmp/dump.hprof

aws s3 cp /tmp/dump.hprof s3://offer-service/dump/2023_07_06.hprof


#
# YAML

# Note: BBP treats additional indetation differently
- >-
  if test "$SKIP" -gt 0; then
    printf "Artifact already exists for '%s', skipping build + upload" "$BUILD_VERSION"
    exit 0
  fi

# Convert SVG to PNG and/or make square
# ref: https://stackoverflow.com/a/34999317/7792536
rsvg-convert -a -w 200 -h 200 rect.svg > rect-rsvg.png
convert -background none -resize 200x200 -gravity center -extent 200x200 rect-rsvg.png rect-correct.png
