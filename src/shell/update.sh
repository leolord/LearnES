#!/bin/bash
# @file:        insert_data.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 更新数据
# @date:        2019/01/26

source host.sh

echo "Update Document with 'doc':"

es_post "/${INDEX}/${DOC_TYPE}/1/_update" '{
  "doc": {
    "name": "John Doe",
    "age": 20
  }
# }'


echo "Update Document with 'script':"

es_post "/${INDEX}/${DOC_TYPE}/1/_update" '{
  "script": "ctx._source.age += 5"
}'


echo "Bulk Update/Delete:"

es_post "/${INDEX}/${DOC_TYPE}/_bulk" '
{"update":{"_id":"1"}}
{"doc": {"name": "John Doe" }}
{"update":{"_id":"2"}}
{"doc": {"age": 10}}
{"delete": {"_id": "i2n5iWgBspje78yyuhP6"}}
'
