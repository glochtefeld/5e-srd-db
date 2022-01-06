CREATE TABLE componentType (
    bit INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(15) NOT NULL,
    abbreviation VARCHAR(1) NOT NULL
);

CREATE TABLE magicSchool (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE spellTime (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

CREATE TABLE castDistance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

CREATE TABLE castArea (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

CREATE TABLE spell (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    level INT NOT NULL,
    schoolID REFERENCES magicSchool (id) NOT NULL,
    castTimeID REFERENCES castTime (id) NOT NULL,
    castTime INT NOT NULL DEFAULT 1,
    reactionTrigger VARCHAR(100) DEFAULT '',
    distanceID REFERENCES castDistance (id) NOT NULL,
    range INT,
    area REFERENCES castArea (id) DEFAULT NULL,
    componentBits INT NOT NULL,
    specialMaterial VARCHAR(100) DEFAULT NULL,
    durationMeasure REFERENCES castTime (id) NOT NULL,
    durationTime INT,
    concentration BOOLEAN DEFAULT FALSE,
    description VARCHAR(1000) NOT NULL DEFAULT '',
    higherLevels VARCHAR(1000) NOT NULL DEFAULT '',
    bcArgs BLOB DEFAULT NULL,
    bcConstants BLOB DEFAULT NULL,
    bcFn BLOB DEFAULT NULL
);
