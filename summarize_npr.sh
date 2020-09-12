#!/bin/bash

set -ux

cd "${0%/*}"

dir="${1%/}"
cp kataribe.toml $dir
cat $dir/access.log | kataribe > $dir/result.txt
sudo cp -a /var/log/mysql/mysql-error.log $dir
sudo cp -a /var/log/mysql/mysql-slow.log $dir

# パーミッションまわり調整
sudo chown -R $USER:$GROUPS $dir
pt-query-digest $dir/mysql-slow.log > $dir/digest.txt

./dispost $dir/digest.txt
./dispost $dir/result.txt
