#!/bin/bash
# @file:        delete.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 删除索引
# @date:        2019/01/26
cd $(dirname "$0")
source host.sh

echo "Delete Document:"
curl -X DELETE ${HOST}/${INDEX}/${DOC_TYPE}/imntiWgBspje78yyqxNU?pretty

# echo "Delete Index:"
# curl -X DELETE ${HOST}/${INDEX}?pretty
