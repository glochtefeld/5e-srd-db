import argparse
# 3. Every line until a blank newline is part of the description.
# 3-1. Run a regex on that line to replace all whitespace with a single space.
# 4. Pipe that SQL into stdout.

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('file',help="file containing spells pasted from the srd, separated by a blank line.")
    parser.add_argument('-v','--verbose',help="show extended debug output",action="store_true")
    args = parser.parse_args()
    with open(args.file, 'r') as infile:
        feats = []
        lines = infile.readlines()
        i = 0
        while i < len(lines):
            name = lines[i][:-1]
            i+=1
            if args.verbose:
                print("NAME: " + name,end=", \n")

            prereq = ""
            if lines[i].startswith('Prerequisite'):
                prereq = lines[i].split(':')[1].strip()
                i += 1
            if args.verbose:
                print("PRE: " + prereq,end=", \n")

            descrip = lines[i].strip() + " "
            i+=1
            while lines[i] != "\n":
                descrip += " " + lines[i].strip()
                i+=1
            i+=1
            if args.verbose:
                print(descrip, end=", \n")

            feats.append(f"INSERT INTO feat (name, prerequisite, description) VALUES ('{name}', '{prereq}', '{descrip}');")

            if args.verbose: 
                print()

        for ft in feats:
            print(ft)

if __name__ == '__main__':
    main()

"""
The file containing all of the feats must fit the following structure: 
    - All of the copyright material must stripped. This is a pretty simple procedure, as it appears probably every 5-6 feats.
    - Single quotes must be replaced with the apostrophe character. Again, simple enough.
    - Each feat must be separated by a newline. The SRD only has one feat, but (hypothetically) you could search for lines with no numbers or punctuation and insert a newline above them. Hypothetically.
    - The file must end with a blank line.

Go from: 

Grappler
Prerequisite:	  Strength	  13	  or	  higher	  
You’ve	  developed	  the	  skills	  necessary	  to	  hold	  your	  
own	  in	  close-­‐‑quarters	  grappling.	  You	  gain	  the	  
following	  benefits:	  
•   You	  have	  advantage	  on	  attack	  rolls	  against	  a	  
creature	  you	  are	  grappling.	  
•   You	  can	  use	  your	  action	  to	  try	  to	  pin	  a	  creature	  
grappled	  by	  you.	  To	  do	  so,	  make	  another	  grapple	  
check.	  If	  you	  succeed,	  you	  and	  the	  creature	  are	  
both	  restrained	  until	  the	  grapple	  ends.	  

To:
INSERT INTO feat (name, prerequisite, description) VALUES ('Grappler','Strength 13 or higher','You’ve developed the skills necessary to hold your own in close-­‐‑quarters grappling. You gain the following benefits: • You have advantage on attack rolls against a creature you are grappling. • You can use your action to try to pin a creature grappled by you. To do so, make another grapple check. If you succeed, you and the creature are both restrained until the grapple ends.');
"""
