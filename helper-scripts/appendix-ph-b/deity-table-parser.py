import argparse

alignments = {
    'LG': 1,
    'LN': 2,
    'LE': 3,
    'NG': 4,
    'N' : 5,
    'NE': 6,
    'CG': 7,
    'CN': 8,
    'CE': 9
}

domains = {
    'Death': 1,
    'Knowledge': 2,
    'Life': 3,
    'Light': 4,
    'Nature': 5,
    'Tempest': 6,
    'Trickery': 7,
    'War': 8
}

def set_align(text):
    return alignments[text]

def set_domain(lst):
    return [domains[d] for d in lst]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('file',help="file that contains text pasted from the srd")
    parser.add_argument('pantheon',help="pantheon index in the db")
    parser.add_argument('index',help="starting deity index in the db")
    args = parser.parse_args()
    with open(args.file,'r') as infile: # Error checking? not here!
        deity_cmds = []
        domain_cmds = []
        lines = infile.readlines()
        deity_idx = int(args.index)
        i = 0
        while i < len(lines):
            # cell 1
            first_comma = lines[i].find(',')
            name = lines[i][:first_comma]
            description = lines[i][first_comma+2:-1] # account for space after

            # cell 2
            i+=1
            alignment = set_align(lines[i][:-1])

            # cell 3
            i+=1
            domains = set_domain(lines[i][:-1].split(', '))

            # cell 4
            i+=1
            symbol = lines[i]

            deity_cmds.append(f"INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES ({args.pantheon},'{name}','{description}',{alignment},'{symbol}');")
            for dom in domains:
                domain_cmds.append(f"INSERT INTO deityDomain (deity, domain) VALUES ({deity_idx},{dom});")
            i+=1
            deity_idx += 1

        for c in deity_cmds:
            print(c)
        print()
        for c in domain_cmds:
            print(c)
        print()

if __name__ == '__main__':
    main()

"""
Example table row:

Nike, goddess of victory
LN
War
Winged woman

Note that when pasted, the text is on four lines. 

Desired output (assuming deity number of 1):
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Nike, goddess of victory',2,'Winged woman');
...
INSERT INTO deityDomain (deity, domain) VALUES (1,8)
...

BEGIN LICENSE TEXT
Copyright 2022 Gavin Lochtefeld

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
END LICENSE TEXT
"""

