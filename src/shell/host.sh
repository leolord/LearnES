#!/bin/bash
# @file:        host.sh
# @author:      wujiantao(wujiantao@bytedance.com)
# @description: 定义Host
# @date:        2019/01/26

HOST=127.0.0.1:9200
INDEX=customer
DOC_TYPE=_doc

es_query()
{
  pathname=$1
  data=$2
  curl -X GET ${HOST}${pathname}?pretty -H 'Content-Type:application/json' -d "${data}"
}

es_post()
{
  pathname=$1
  data=$2
  curl -X POST ${HOST}${pathname}?pretty -H 'Content-Type:application/json' -d "${data}"
}


es_put()
{
  pathname=$1
  data=$2
  curl -X PUT ${HOST}${pathname}?pretty -H 'Content-Type:application/json' -d "${data}"
}
