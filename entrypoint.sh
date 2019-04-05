#!/bin/bash

set -e -u -o pipefail

echo ARGS="$@"
env | sort
repo_url=https://github.com/mattikus/i-am-qb
lita_dir=/qb

mkdir -p $lita_dir
cd $lita_dir

apt-get update && apt-get upgrade -y ca-certificates

# Grab the latest copy of QB
if [[ ! -d ${lita_dir}/.git ]]; then
  /usr/bin/git clone --depth 1 $repo_url $lita_dir
else
  /usr/bin/git fetch --depth 1 origin
  /usr/bin/git reset --hard origin/master
fi

/usr/bin/bundle install
exec /usr/bin/bundle exec lita "$@"
