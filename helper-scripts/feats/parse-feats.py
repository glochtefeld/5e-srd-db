# 1. first line is title.
# 2. If the second line starts with 'Prerequisite', it's a prerequisite. By default this is an empty string.
# 3. Every line until a blank newline is part of the description.
# 3-1. Run a regex on that line to replace all whitespace with a single space.
# 4. Pipe that SQL into stdout.

"""
The file containing all of the feats must fit the following structure: 
    - All of the copyright material must stripped. This is a pretty simple procedure, as it appears probably every 5-6 feats.
    - Single quotes must be replaced with the apostrophe character. Again, simple enough.
    - Each feat must be separated by a newline. The SRD only has one feat, but (hypothetically) you could search for lines with no numbers or punctuation and insert a newline above them. Hypothetically.

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

Grappler
Prerequisite: Strength 13 or higher 
You’ve developed the skills necessary to hold your own in close-­‐‑quarters grappling. You gain the following benefits: • You have advantage on attack rolls against a creature you are grappling. • You can use your action to try to pin a creature grappled by you. To do so, make another grapple check. If you succeed, you and the creature are both restrained until the grapple ends. 

To:
INSERT INTO feat (name, prerequisite, description) VALUES ('Grappler','Strength 13 or higher','You’ve developed the skills necessary to hold your own in close-­‐‑quarters grappling. You gain the following benefits: • You have advantage on attack rolls against a creature you are grappling. • You can use your action to try to pin a creature grappled by you. To do so, make another grapple check. If you succeed, you and the creature are both restrained until the grapple ends.');
"""
