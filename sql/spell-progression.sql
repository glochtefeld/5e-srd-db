/* note: Unless otherwise stated: only the changes between levels are stored.
Check for max(amount) at a level <= current. */

DROP TABLE IF EXISTS cantripProgression;
CREATE TABLE cantripProgression (
    classID REFERENCES class (id),
    levelID REFERENCES level (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (classID, levelID)
);

DROP TABLE IF EXISTS spellSlot;
CREATE TABLE spellSlot (
    levelID REFERENCES level (id),
    slotLevel INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    PRIMARY KEY (levelID, slotLevel)
);

DROP TABLE IF EXISTS pactSpellSlot;
CREATE TABLE pactSpellSlot (
    levelID REFERENCES level (id),
    slotLevel INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    PRIMARY KEY (levelID, slotLevel)
);

DROP TABLE IF EXISTS innateSpellsKnown;
CREATE TABLE innateSpellsKnown (
    classID REFERENCES class (id),
    levelID REFERENCES level (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (classID, levelID)
);

