#!/bin/bash
# @file:        health.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 检测ES健康情况
# @date:        2019/01/26
cd $(dirname "$0")
source host.sh

echo "Index Helth:"
curl ${HOST}/_cat/health?v

echo 'Node List'
curl ${HOST}/_cat/nodes?v

echo 'Index List'
curl ${HOST}/_cat/indices?v

echo 'Document Mapping'
curl ${HOST}/${INDEX}/${DOC_TYPE}/_mapping?pretty

echo 'Running Tasks:'
curl ${HOST}/_tasks?pretty&detailed=true&actions=*byquery
