#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""
定义常量

File:        const.py
Author:      wujiantao(wujiantao@bytedance.com)
Date:        2019/02/23
"""

import os

HOST = '127.0.0.1'
PORT = 9200
INDEX_NAME = 'customer_v2'
DOC_TYPE = 'doc'
DATA_FILE_PATH = os.path.join(os.path.dirname(__file__), '../data.json')
