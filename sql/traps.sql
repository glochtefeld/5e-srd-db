DROP TABLE IF EXISTS trapDanger;
CREATE TABLE trapDanger (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dangerLevel VARCHAR (15) NOT NULL,
    saveDCLower INTEGER NOT NULL,
    saveDCUpper INTEGER NOT NULL,
    attackBonusLower INTEGER NOT NULL,
    attackBonusUpper INTEGER NOT NULL
);

DROP TABLE IF EXISTS trapSeverity;
CREATE TABLE trapSeverity (
    upperLevel INTEGER REFERENCES level (id),
    trapDangerID INTEGER REFERENCES trapDanger (id),
    damage VARCHAR(5) NOT NULL,
    PRIMARY KEY (upperLevel, trapDangerID)
);

DROP TABLE IF EXISTS trapType;
CREATE TABLE trapType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL
);

DROP TABLE IF EXISTS trap;
CREATE TABLE trap (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    upperLevel INTEGER REFERENCES level (id) NOT NULL,
    trapDangerID INTEGER REFERENCES trapDanger (id) NOT NULL,
    description VARCHAR(1000) NOT NULL
);

DROP TABLE IF EXISTS trapByType;
CREATE TABLE trapByType (
    trapID INTEGER REFERENCES trap (id),
    trapTypeID INTEGER REFERENCES trapType (id),
    PRIMARY KEY (trapID, trapTypeID)
);
