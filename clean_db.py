#!/usr/bin/python
#pip install psycopg2 - jak nie dziala

import psycopg2
from os import listdir
import csv
import os
from functools import reduce


class PsqlDao:
    def __init__(self):
        self.conn = psycopg2.connect("dbname='acn' user='acn' host='localhost' password='acn'")
        self.cur = self.conn.cursor()

    def insert_csv_file(self, file):
        cur = self.cur
        # csv_file = csv.reader(open(file), delimiter=';', quotechar='\'')
        csv_file = open(file, 'r').read().split('\n')
        columns = csv_file[0].split(';')
        csv_file = csv_file[1:len(csv_file)]
        for csv_line in csv_file:
            line = str(reduce((lambda x, y: x + ';' + y), csv_line))
            if line.__contains__('id'):
                pass #zapamietac
            else:
                pass #insert


if __name__ == '__main__':
    dao = PsqlDao()
    dict_data = './dictionary_data'
    files = listdir(dict_data)
    for file in files:
        dao.insert_csv_file(os.path.join(dict_data, file))
