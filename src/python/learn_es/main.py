#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""
这里是主要的代码

File:        main.py
Author:      wujiantao(wujiantao@bytedance.com)
Date:        2019/02/23
"""
import logging
import sys

from elasticsearch import Elasticsearch, helpers

import ujson
from learn_es import const

#  from elasticsearch_dsl import Q


class LearnES:
    """LearnES 这里是入口类"""
    def __init__(self):
        self.logger = logging.getLogger('learn_es')
        self.logger.setLevel(logging.DEBUG)
        self.logger.addHandler(logging.StreamHandler(sys.stdout))

        self.client = Elasticsearch([{'host': const.HOST, 'port': const.PORT}])
        self.logger.info('Connected to %s:%d', const.HOST, const.PORT)

    def check(self):
        """check 检测集群的状态"""
        self.logger.info('\n*************** Begin to check es status ***************')

        cluster = self.client.cluster
        logger = self.logger

        status = cluster.health().get('status')
        logger.info('Cluster status: %s', status)

        pending_tasks = cluster.pending_tasks()
        pending_task_count = len(pending_tasks.get('tasks'))
        logger.info('Pending tasks: %d', pending_task_count)

        if pending_task_count > 0:
            logger.info(pending_tasks)

        logger.info('Cluster settings: %s', cluster.get_settings())

        logger.info('Allocation explain: %s', cluster.allocation_explain())

    def setup(self):
        """这里插入数据"""

        cli = self.client
        logger = self.logger
        index_cli = cli.indices

        logger.info('\n*************** Begin to setup ***************')

        if not index_cli.exists(const.INDEX_NAME):
            self.client.indices.create(const.INDEX_NAME)
            logger.info('Created index: %s', const.INDEX_NAME)
        else:
            logger.info('The index %s has existed', const.INDEX_NAME)

        with open(const.DATA_FILE_PATH, 'r') as json_file:
            json_data = ujson.load(json_file)
            logger.info('Read %d records from json file.', len(json_data))

            helpers.bulk(self.client, [{
                '_op_type': 'index',
                '_index': const.INDEX_NAME,
                '_type': const.DOC_TYPE,
                '_source': doc
            } for doc in json_data])

        logger.info('Inserted data successfully')

    def teardown(self):
        """删除索引"""
        self.logger.info('\n*************** Begin to teardown ***************')

        self.client.indices.delete(const.INDEX_NAME)
        self.logger.info('Deleted index %s', const.INDEX_NAME)

    def query(self):
        """query 查询数据"""
        self.logger.info('\n*************** Begin to query data ***************')

    def update(self):
        """update 更新数据"""
        self.logger.info('\n*************** Begin to update data ***************')

    def process(self):
        """这里是入口流程"""

        self.setup()
        self.check()
        self.query()
        self.update()
        self.teardown()


if __name__ == '__main__':
    ins = LearnES()
    ins.process()
