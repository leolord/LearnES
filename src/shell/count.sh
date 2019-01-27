#!/bin/bash
# @file:        count.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 整体文档数量
# @date:        2019/01/26
cd $(dirname "$0")
source host.sh

echo "Global Document Count:"
curl -X GET ${HOST}/_count?pretty

echo "Document count in index:"
curl -X GET ${HOST}/${INDEX}/_count?pretty

echo "Document count of type:"
curl -X GET ${HOST}/${INDEX}/${DOC_TYPE}/_count?pretty
