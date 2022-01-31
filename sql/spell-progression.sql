/* note: Unless otherwise stated: only the changes between levels are stored.
Check for max(amount) at a level <= current. */

CREATE TABLE cantripProgression (
    classID REFERENCES class (id),
    levelID REFERENCES level (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (classID, levelID)
);

CREATE TABLE spellSlot (
    levelID REFERENCES level (id),
    slotLevel INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    PRIMARY KEY (levelID, slotLevel)
);

CREATE TABLE pactSpellSlot (
    levelID REFERENCES level (id),
    slotLevel INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    PRIMARY KEY (levelID, slotLevel)
);

CREATE TABLE innateSpellsKnown (
    classID REFERENCES class (id),
    levelID REFERENCES level (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (classID, levelID)
);

