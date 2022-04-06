#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar  7 17:45:41 2022

@author: noah
"""
"""we can bring to mongodb file into python by using pymongo module
MongoClient is responsible for the connection
"""

from pymongo import MongoClient
client= MongoClient('127.0.0.1',27017)
db=client["Prac"]
tweets=db["Tweets"]

"""these three steps will be always there when we connect the mongodb



error occurs since i have empty cells without few columns
"""

for tweet in tweets.find():
    print(tweet["text"])

