DROP TABLE IF EXISTS pantheon;
CREATE TABLE pantheon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    description VARCHAR(1500) NOT NULL
);

DROP TABLE IF EXISTS alignment;
CREATE TABLE alignment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    abbreviation VARCHAR(2) NOT NULL,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS domain;
CREATE TABLE domain (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL
);

DROP TABLE IF EXISTS deity;
CREATE TABLE deity (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pantheon INTEGER REFERENCES pantheon (id),
    name VARCHAR(25) NOT NULL,
    description VARCHAR(50),
    alignment INTEGER REFERENCES alignment (id),
    symbol VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS deityDomain;
CREATE TABLE deityDomain (
    deity INTEGER REFERENCES deity (id),
    domain INTEGER REFERENCES domain (id),
    PRIMARY KEY (deity, domain)
);
