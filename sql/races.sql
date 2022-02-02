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

CREATE TABLE raceFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    raceID REFERENCES race (id),
    name VARCHAR (15) NOT NULL,
    description VARCHAR (500) NOT NULL,
    bc BLOB DEFAULT NULL
);

CREATE TABLE raceLanguage (
    raceID REFERENCES race (id),
    languageID REFERENCES language (id),
    amount INTEGER DEFAULT 1,
    PRIMARY KEY (raceID, languageID)
);

CREATE TABLE raceASI (
    raceID REFERENCES race (id),
    abilityID REFERENCES ability (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (raceID, abilityID)
);

CREATE TABLE subrace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    parentID REFERENCES race (id),
    name VARCHAR (25) DEFAULT '',
    description VARCHAR (500) DEFAULT ''
);

CREATE TABLE subraceASI (
    subraceID REFERENCES subrace (id),
    abilityID REFERENCES ability (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (subraceID, abilityID)
);

CREATE TABLE subraceFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subraceID REFERENCES subrace (id),
    name VARCHAR (15) NOT NULL,
    description VARCHAR (500) NOT NULL,
    bc BLOB DEFAULT NULL
);

CREATE TABLE draconicAncestry (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    resistance REFERENCES damageType (id),
    breathWeapon REFERENCES spell (id)
);

CREATE TABLE rockGnomeTinkerOption (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL,
    description VARCHAR(500) NOT NULL
);
