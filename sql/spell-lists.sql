DROP TABLE IF EXISTS spellList;
CREATE TABLE spellList (
    classID INTEGER REFERENCES class (id),
    spellID INTEGER REFERENCES spell (id),
    PRIMARY KEY (classID, spellID)
);

/* note: Curse you, circle of the land */
DROP TABLE IF EXISTS subclassSpellList;
CREATE TABLE subclassSpellList (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    source VARCHAR (25) DEFAULT NULL,
    subclassID INTEGER REFERENCES subclass (id),
    levelAdded INTEGER REFERENCES level (id) DEFAULT NULL,
    spellID INTEGER REFERENCES spell (id)
);
