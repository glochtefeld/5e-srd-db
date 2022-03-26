DROP TABLE IF EXISTS race;
CREATE TABLE race (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL,
    age VARCHAR (500) NOT NULL,
    alignment VARCHAR (500) NOT NULL,
    sizeID INTEGER REFERENCES creatureSize (id),
    sizeDescription VARCHAR (500) NOT NULL,
    speed INTEGER NOT NULL,
    darkvision BOOLEAN NOT NULL DEFAULT FALSE
);

DROP TABLE IF EXISTS raceFeature;
CREATE TABLE raceFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    raceID INTEGER REFERENCES race (id),
    name VARCHAR (15) NOT NULL,
    description VARCHAR (500) NOT NULL
);

DROP TABLE IF EXISTS raceLanguage;
CREATE TABLE raceLanguage (
    raceID INTEGER REFERENCES race (id),
    languageID INTEGER REFERENCES language (id),
    amount INTEGER DEFAULT 1,
    PRIMARY KEY (raceID, languageID)
);

DROP TABLE IF EXISTS raceASI;
CREATE TABLE raceASI (
    raceID INTEGER REFERENCES race (id),
    abilityID INTEGER REFERENCES ability (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (raceID, abilityID)
);

DROP TABLE IF EXISTS subrace;
CREATE TABLE subrace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    parentID INTEGER REFERENCES race (id),
    name VARCHAR (25) DEFAULT '',
    description VARCHAR (500) DEFAULT ''
);

DROP TABLE IF EXISTS subraceASI;
CREATE TABLE subraceASI (
    subraceID INTEGER REFERENCES subrace (id),
    abilityID INTEGER REFERENCES ability (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (subraceID, abilityID)
);

DROP TABLE IF EXISTS subraceFeature;
CREATE TABLE subraceFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subraceID INTEGER REFERENCES subrace (id),
    name VARCHAR (15) NOT NULL,
    description VARCHAR (500) NOT NULL
);

DROP TABLE IF EXISTS draconicAncestry;
CREATE TABLE draconicAncestry (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    resistance INTEGER REFERENCES damageType (id),
    breathWeapon INTEGER REFERENCES spell (id)
);

DROP TABLE IF EXISTS rockGnomeTinkerOption;
CREATE TABLE rockGnomeTinkerOption (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL,
    description VARCHAR(500) NOT NULL
);
