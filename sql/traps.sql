CREATE TABLE trapDanger (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dangerLevel VARCHAR (15) NOT NULL,
    saveDCLower INTEGER NOT NULL,
    saveDCUpper INTEGER NOT NULL,
    attackBonusLower INTEGER NOT NULL,
    attackBonusUpper INTEGER NOT NULL
);

CREATE TABLE trapSeverity (
    upperLevel REFERENCES level (id),
    trapDangerID REFERENCES trapDanger (id),
    damage VARCHAR(5) NOT NULL,
    PRIMARY KEY (upperLevel, trapDangerID)
);

CREATE TABLE trapType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL
);

CREATE TABLE trap (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    upperLevel REFERENCES level (id) NOT NULL,
    trapDangerID REFERENCES trapDanger (id) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    bc BLOB DEFAULT NULL
);

CREATE TABLE trapByType (
    trapID REFERENCES trap (id),
    trapTypeID REFERENCES trapType (id)
    PRIMARY KEY (trapID, trapTypeID)
);
