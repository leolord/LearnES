#!/bin/bash
# @file:        sql.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 翻译SQL
# @date:        2019/01/26
cd $(dirname "$0")
source host.sh

echo "Translate SQL to es search query"
es_post '/_xpack/sql/translate' '{
  "query": "SELECT count(name),age FROM '${INDEX}' where balance < 40000 and age between 28 and 32 GROUP BY age",
  "fetch_size": 10
}'

