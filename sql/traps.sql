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
    upperLevel REFERENCES level (id),
    trapDangerID REFERENCES trapDanger (id),
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
    upperLevel REFERENCES level (id) NOT NULL,
    trapDangerID REFERENCES trapDanger (id) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    bc BLOB DEFAULT NULL
);

DROP TABLE IF EXISTS trapByType;
CREATE TABLE trapByType (
    trapID REFERENCES trap (id),
    trapTypeID REFERENCES trapType (id),
    PRIMARY KEY (trapID, trapTypeID)
);
