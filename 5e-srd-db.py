#/usr/bin/python3
import argparse
import os
import sqlite3
import sys

class DB:
    conn = None
    cur = None
    def __init__(self, path):
        self.conn = sqlite3.connect(path)
        self.cur = self.conn.cursor()

    def write(self, sql):
        self.cur.execute(sql)
        self.conn.commit()
    
    def readone(self, sql):
        data = self.cur.execute(sql)
        return data.fetchone()

    def read(self, sql):
        return self.cur.execute(sql)

    def close(self):
        self.conn.close()

def read_sql_in_dir(path):
    commands = []
    with os.scandir(path) as directory:
        for script in directory:
            if script.path.endswith(".sql") and script.is_file():
                commands += read_sql_file(script.path)
    return commands

def read_sql_file(path):
    commands = []
    with open(path,'r') as sql_file:
        data = sql_file.read()
        commands = [d.strip() for d in data.split(';\n')]
    return commands

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-o","--output", help="specify output database path")
    parser.add_argument("-q","--quiet", help="suppress all output", action="store_true")
    parser.add_argument("-v","--verbose", help="display all output", action="store_true")
    args = parser.parse_args()

    def cout(string, cend="\n"):
        if not args.quiet or args.verbose: # change to && for production
            print(string, end=cend)

    outpath = "OUT/SRD5.db"
    if args.output != None:
        outpath = args.output

    if os.path.isdir(outpath):
        outpath += "SRD5.db"

    if os.path.exists(outpath):
        if args.quiet:
            os.remove(outpath)
        else:
            cout("Warning: about to overwrite file at " + outpath + ".")
            choice = input("Continue? [Y/n]: ")
            if choice != "" and (choice[0] == 'N' or choice[0] == 'n'):
                sys.exit("Cancelling operation.")
            cout("Deleting " + outpath + "...", cend="")
            os.remove(outpath)
            cout("DONE")

    cout("Building database " + outpath + "...")
    os.makedirs(outpath[:outpath.rfind('/')],exist_ok=True)

    commands = []
    commands += read_sql_in_dir("sql")
    commands += read_sql_in_dir("sql/ogl-content")
    
    db = DB(outpath)

    for comm in commands:
        try:
            cout(comm)
            db.write(comm)
        except Exception as e:
            print(e)
            db.close()
            sys.exit("Aborting.")
    db.close()

"""
Copyright 2022 Gavin Lochtefeld

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""
