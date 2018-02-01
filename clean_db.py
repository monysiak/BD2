#!/usr/bin/python
# pip install psycopg2 - jak nie dziala

import psycopg2
from os import listdir
import os
import sys

class PsqlDao:
    def __init__(self):
        self.conn = psycopg2.connect("dbname='komis' user='komis' host='localhost' password='komis'")
        self.cur = self.conn.cursor()

    def insert_csv_file(self, file):
        cur = self.cur
        csv_file = open(file, 'r').read().split('\n')
        csv_file = csv_file[1:len(csv_file)]
        for line in csv_file:
            insert = "insert into {0} values(".format((file.split('.')[0]).split('/')[1])
            line = line.replace(';', ',')
            insert = insert + line + ");"
            cur.execute(insert)
            print "insert powiedzion'd"


if __name__ == '__main__':
    possible_exec = ["dict", "test"]

    test = False
    if len(sys.argv) != 2 or not (sys.argv[1] in possible_exec):
        print "usage: ./clean_db <test/dict>"
        exit(1)
    elif sys.argv[1] == possible_exec[0]:
        files = listdir("dictionary_data")
    else:
        files = listdir("test_data")
        test = True
    dao = PsqlDao()
    dao.cur.execute('begin')
    for file in files:
        if not test:
            dao.insert_csv_file(os.path.join("dictionary_data", file))
        else:
            dao.insert_csv_file(os.path.join("test_data", file))
    dao.cur.execute('commit')
    print """ ____________________________
< Zalanie danymi sie udalo xD >
 ----------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\\
                ||----w |
                ||     ||"""
