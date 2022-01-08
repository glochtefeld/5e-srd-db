import argparse

schools = {
    'abjuration': 1,
    'conjuration': 2,
    'divination': 3,
    'enchantment': 4,
    'evocation': 5,
    'illusion': 6,
    'necromancy': 7,
    'transmutation': 8
}
def get_school(k):
    return schools[k]

time =  {
    'action': 1,
    'bonus': 2,
    'reaction,': 3,
    'Instantaneous': 4,
    'round': 5,
    'minute': 6,
    'minutes':6,
    'hour': 7,
    'hour.': 7,
    'hours': 7,
    'day': 8,
    'days': 8,
    'month': 9,
    'year': 10,
    'Until dispelled': 11,
    'Special': 12
}
def get_time(k):
    return time[k]

component = { 'V': 1, 'S': 2, 'M': 4 }
def calc_component(comp_str):
    res = 0
    for k,v in component.items():
        if comp_str.find(k) > -1:
            res |= v
    return res

distance = {
    'Self': 1,
    'Touch': 2,
    'feet': 3,
    'foot': 3,
    'mile': 4,
    'miles': 4,
    'Special': 5,
    'Sight': 6,
    'Unlimited': 7
}
def get_dist(k):
    return distance[k]

area = {
    'Cone': 1,
    'cone': 1,
    'Cube': 2,
    'cube': 2,
    'Cylinder': 3,
    'cylinder': 3,
    'Line': 4,
    'line': 4,
    'Sphere': 5,
    'sphere': 5,
    'radius': 6,
    'hemisphere': 7,
}
def get_area(k):
    return area[k]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('file',help="file containing spells pasted from the srd, separated by a blank line.")
    parser.add_argument('-v','--verbose',help="show extended debug output",action="store_true")
    args = parser.parse_args()
    with open(args.file, 'r') as infile:
        spells = []
        lines = infile.readlines()
        i = 0
        while i < len(lines):
            name = lines[i][:-1]
            i+=1
            if args.verbose:
                print(name,end=", \n")
            
            level = 0
            school = ""
            ritual = "FALSE"
            if lines[i].find('cantrip') > 0:
                school = get_school(lines[i].split(' ')[0].lower())
            else:
                level = lines[i][0]
                school = get_school(lines[i].split()[1])
                ritual = "FALSE"
                if lines[i].find('ritual') > 0:
                    ritual = "TRUE"
            i+=1
            if args.verbose:
                print(level,end=", ")
                print(school,end=", ")
                print(ritual,end=", \n")

            casting_time = lines[i][14:].split(' ')
            c_time_count = casting_time[0]
            c_time_measure = get_time(casting_time[1].strip())
            c_reaction_trigger = ""
            if c_time_measure == 3:
                c_reaction_trigger += ' '.join(casting_time[2:]) + " "
                i+=1
                while not lines[i].startswith('Range'):
                    i+=1
                    c_reaction_trigger += lines[i][:-1] + ' '
                c_reaction_trigger = c_reaction_trigger.strip()
            else:
                i+=1

            if args.verbose:
                print(c_time_count,end=", ")
                print(c_time_measure,end=", ")
                print(c_reaction_trigger,end=", \n")

            # dist, range, area
            rnge = lines[i][7:].split(' ')
            dist = ""
            spRange = "1"
            area = "NULL"
            if rnge[0] == 'Touch\n':
                dist = get_dist(rnge[0][:-1])
            elif rnge[0].startswith('Self'):
                if len(rnge) > 1: # has an area
                    dist = get_dist(rnge[1][rnge[1].find('-')+4:rnge[1].find('-')+8])
                    spRange = rnge[1][1:rnge[1].find('-')]
                    area = get_area(rnge[2][:-2])
                else:
                    dist = get_dist(rnge[0][:-1])
            elif rnge[0].startswith('Special'):
                dist = get_dist('Special')
            elif rnge[0].startswith('Sight'):
                dist = get_dist('Sight')
            elif rnge[0].startswith('Unlimited'):
                dist = get_dist('Unlimited')
            else:
                spRange = rnge[0]
                dist = get_dist(rnge[1][:-1])
            i+=1

            if args.verbose:
                print(dist,end=", ")
                print(spRange,end=", ")
                print(area,end=", \n")
                

            # components
            component = calc_component(lines[i][12:])
            specMat = ""
            if component & 4 > 0:
                tmp = lines[i][20:-1] + " "
                i+=1
                while not lines[i].startswith("Duration"):
                    tmp+=lines[i][:-1] + " "
                    i+=1
                specMat = tmp.strip()
            else:
                i+=1

            if args.verbose:
                print(component, end=", ")
                print(specMat, end=", \n")

            # duration
            dur = lines[i][10:].split(' ')
            conc = "FALSE"
            dur_type = ""
            dur_len = ""
            if dur[0].startswith('Concentration'):
                conc = "TRUE"
                dur_len = dur[3]
                dur_type = get_time(dur[4][:-1])
            elif dur[0].startswith('Instantaneous'):
                dur_type = get_time(dur[0][:-1])
                dur_len = 1
            elif dur[0].startswith('Until'):
                dur_type = get_time('Until dispelled')
                dur_len = 1
            elif dur[0].startswith('Special'):
                dur_type = get_time('Special')
                dur_len = 1
            elif dur[0].startswith('Up'):
                dur_len = dur[2]
                dur_type = get_time(dur[3][:-1])
            else:
                dur_len = dur[0]
                dur_type = get_time(dur[1][:-1])
            i+=1

            if args.verbose:
                print(conc,end=", ")
                print(dur_type, end=", ")
                print(dur_len, end=", \n")

            # description
            desc = ""
            while lines[i] != "\n" and not lines[i].startswith("At Higher Levels"):
                desc += lines[i][:-1] + " "
                i+=1
                if i > len(lines):
                    break

            if args.verbose:
                print(desc, end=", \n")

            # higher levels
            higher_lvl = ""
            if lines[i].startswith("At Higher Levels"):
                tmp = lines[i][18:-1] + " "
                i+=1
                while lines[i] != "\n":
                    tmp += lines[i][:-1] + " "
                    i+=1
                    if i > len(lines):
                        i-=1
                        break
                higher_lvl = tmp.strip()
            i+=1
            if args.verbose:
                print(higher_lvl, end=", \n")

            spells.append(f"INSERT INTO spell (name, level, isRitual, schoolID, timeID, time, reactionTrigger, distanceID, range, areaID, componentBits, specialMaterial, durationID, durationTime, concentration, description, higherLevels, bcArgs, bcConstants, bcFn) VALUES ('{name}',{level}, {ritual}, {school}, {c_time_measure}, {c_time_count}, '{c_reaction_trigger}', {dist}, {spRange}, {area}, {component}, '{specMat}', {dur_type}, {dur_len}, {conc}, '{desc}', '{higher_lvl}', NULL, NULL, NULL);") 
            if args.verbose:
                print()

        for sp in spells:
            print(sp)


if __name__ == '__main__':
    main()

"""
A CRITICAL WARNING: The SRD likes to mix apostrophes (’) and single quotes (\'). 
Make sure you do a global find/replace and change all of them to apostrophes.

ALSO: The 'Weird' spell has the unique quality that the duration is 'up to one minute'
spelled out. It's easier just to change that to an actual number, like every other
concentration spell.

ALSO: Each spell needs to have a blank line after it, including the last one.
I used a vim macro to just blast through them. Ideally, you won't actually
need this script at all.

FINALLY: Copying directly from the SRD PDF will include some copyright notices.
This primitive parser can't handle those, so just take them out. 

A spell pasted from the SRD looks like this (without indentation):
    Acid Arrow
    2nd-­‐‑level evocation
    Casting Time: 1 action
    Range: 90 feet
    Components: V, S, M (powdered rhubarb leaf and an
    adder’s stomach)
    Duration: Instantaneous
    A shimmering green arrow streaks toward a target
    within range and bursts in a spray of acid. Make a
    ranged spell attack against the target. On a hit, the
    target takes 4d4 acid damage immediately and 2d4
    acid damage at the end of its next turn. On a miss,
    the arrow splashes the target with acid for half as
    much of the initial damage and no damage at the end
    of its next turn.
    At Higher Levels. When you cast this spell using a
    spell slot of 3rd level or higher, the damage (both
    initial and later) increases by 1d4 for each slot level
    above 2nd.

We want to turn it into something like this:
    INSERT INTO spell 
        (name, level, schoolID, timeID, time, reactionTrigger,
        distanceID, range, area, componentBits, specialMaterial,
        durationID, durationTime, concentration, 
        description, 
        higherLevels,
        bcArgs, bcConstants, bcFn) 
    VALUES 
        ('Acid Arrow', 2, 5, 1, 1, NULL,
        3, 90, NULL, 7, 'powdered rhubarb leaf and an adder’s stomach',
        4, NULL, FALSE,
        'A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn.',
        'When you cast this spell using a spell slot of 3rd level or higher, the damage (both initial and later) increases by 1d4 for each slot level above 2nd.',
        NULL, NULL, NULL);

Except on one line.

Copyright 2022 Gavin Lochtefeld

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""
