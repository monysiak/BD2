#!/usr/bin/python

import psycopg2
from os import listdir


class PsqlDao:
    def __init__(self):
        self.conn = psycopg2.connect("dbname='komis' user='komis' host='localhost' password='komis'")
        self.cur = self.conn.cursor()

    def insert_csv_file(self, file):
        cur = self.cur
        cur.execute('')


if __name__ == '__main__':
    dao = PsqlDao()
    files = listdir('./dictionary_data')
    for file in files:
        dao.insert_csv_file(file)
