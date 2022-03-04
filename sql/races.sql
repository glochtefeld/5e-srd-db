DROP TABLE IF EXISTS race;
CREATE TABLE race (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL,
    age VARCHAR (500) NOT NULL,
    alignment VARCHAR (500) NOT NULL,
    sizeID REFERENCES creatureSize (id),
    sizeDescription VARCHAR (500) NOT NULL,
    speed INTEGER NOT NULL,
    darkvision BOOLEAN NOT NULL DEFAULT FALSE
);

DROP TABLE IF EXISTS raceFeature;
CREATE TABLE raceFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    raceID REFERENCES race (id),
    name VARCHAR (15) NOT NULL,
    description VARCHAR (500) NOT NULL,
    bc BLOB DEFAULT NULL
);

DROP TABLE IF EXISTS raceLanguage;
CREATE TABLE raceLanguage (
    raceID REFERENCES race (id),
    languageID REFERENCES language (id),
    amount INTEGER DEFAULT 1,
    PRIMARY KEY (raceID, languageID)
);

DROP TABLE IF EXISTS raceASI;
CREATE TABLE raceASI (
    raceID REFERENCES race (id),
    abilityID REFERENCES ability (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (raceID, abilityID)
);

DROP TABLE IF EXISTS subrace;
CREATE TABLE subrace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    parentID REFERENCES race (id),
    name VARCHAR (25) DEFAULT '',
    description VARCHAR (500) DEFAULT ''
);

DROP TABLE IF EXISTS subraceASI;
CREATE TABLE subraceASI (
    subraceID REFERENCES subrace (id),
    abilityID REFERENCES ability (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (subraceID, abilityID)
);

DROP TABLE IF EXISTS subraceFeature;
CREATE TABLE subraceFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subraceID REFERENCES subrace (id),
    name VARCHAR (15) NOT NULL,
    description VARCHAR (500) NOT NULL,
    bc BLOB DEFAULT NULL
);

DROP TABLE IF EXISTS draconicAncestry;
CREATE TABLE draconicAncestry (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    resistance REFERENCES damageType (id),
    breathWeapon REFERENCES spell (id)
);

DROP TABLE IF EXISTS rockGnomeTinkerOption;
CREATE TABLE rockGnomeTinkerOption (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL,
    description VARCHAR(500) NOT NULL
);
