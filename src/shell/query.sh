#!/bin/bash
# @file:        query.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 各种查询
# @date:        2019/01/26

cd $(dirname "$0")
source host.sh

SEARCH_PATHNAME=/${INDEX}/${DOC_TYPE}/_search

echo "Query By Index:"
curl ${HOST}/${INDEX}/${DOC_TYPE}/1?pretty
curl ${HOST}/${INDEX}/${DOC_TYPE}/2n5iWgBspje78yyuhP6?pretty

echo "Empty Query:"
curl ${HOST}/${INDEX}/${DOC_TYPE}/_search?pretty&size=2

echo "Sort:"
curl ${HOST}/${INDEX}/${DOC_TYPE}/_search?pretty&q=*&sort=account_number:asc

echo "Query with size:"
es_query $SEARCH_PATHNAME '{
  "profile": true,
  "query": {
    "match_all": {
    }
  },
  "size": 1
}'

