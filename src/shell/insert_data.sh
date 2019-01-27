#!/bin/bash
# @file:        insert_data.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 插入数据
# @date:        2019/01/26
cd $(dirname "$0")
source host.sh

# echo "Create Index:"
# es_put '/customer' ''

# echo "Insert Document:"
# es_put "/${INDEX}/${DOC_TYPE}/1" '{
  # "name": "John Doe"
# }'

# echo "Insert Document Without ID"
# es_post "/${INDEX}/${DOC_TYPE}" '{
  # "name": "John Done"
# }'

# echo "Bulk Insert:"
# es_post "/${INDEX}/${DOC_TYPE}/_bulk" '
# {"index":{"_id":"1"}}
# {"name": "John Doe" }
# {"index":{"_id":"2"}}
# {"name": "Jane Doe" }
# '

echo "Bulk Insert from json/json-like file:"

curl -X POST "${HOST}/${INDEX}/${DOC_TYPE}/_bulk?pretty&refresh" -H 'Content-Type:application/json' --data-binary "@../../accounts.json"
