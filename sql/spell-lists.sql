DROP TABLE IF EXISTS spellList;
CREATE TABLE spellList (
    classID REFERENCES class (id),
    spellID REFERENCES spell (id),
    PRIMARY KEY (classID, spellID)
);

/* note: Curse you, circle of the land */
DROP TABLE IF EXISTS subclassSpellList;
CREATE TABLE subclassSpellList (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    source VARCHAR (25) DEFAULT NULL,
    subclassID REFERENCES subclass (id),
    levelAdded REFERENCES level (id) DEFAULT NULL,
    spellID REFERENCES spell (id)
);
